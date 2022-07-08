' https://superuser.com/a/100084'
' If DataObject type error, . In the macro editor, go to Tools->References. Click browse, select the file C:\Windows\System32\fm20.dll and press OK
' Adds a link to the currently selected message to the clipboard
'Adds a link to the currently selected message to the clipboard
Sub AddLinkToMessageInClipboard()

   Dim objMail As Outlook.MailItem
   Dim doClipboard As New DataObject

   'One and ONLY one message muse be selected
   If Application.ActiveExplorer.Selection.Count <> 1 Then
      MsgBox ("Select one and ONLY one message.")
      Exit Sub
   End If

   Set objMail = Application.ActiveExplorer.Selection.Item(1)

   If objMail.Class = olMail Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][MESSAGE: " + objMail.Subject + " (" + objMail.SenderName + ")]]"
   ElseIf objMail.Class = olAppointment Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][MEETING: " + objMail.Subject + " (" + objMail.Organizer + ")]]"
   ElseIf objMail.Class = olTask Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][TASK: " + objMail.Subject + " (" + objMail.Owner + ")]]"
   ElseIf objMail.Class = olContact Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][CONTACT: " + objMail.Subject + " (" + objMail.FullName + ")]]"
   ElseIf objMail.Class = olJournal Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][JOURNAL: " + objMail.Subject + " (" + objMail.Type + ")]]"
   ElseIf objMail.Class = olNote Then
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][NOTE: " + objMail.Subject + " (" + " " + ")]]"
   Else
      doClipboard.SetText "[[outlook:" + objMail.EntryID + "][ITEM: " + objMail.Subject + " (" + objMail.MessageClass + ")]]"
   End If

   doClipboard.PutInClipboard
End Sub


' Cann Add the following code to emacs for support for links for outlook items
';;; org-outlook.el - Support for links to Outlook items in Org
'
'(require 'org)
'
'(org-add-link-type "outlook" 'org-outlook-open)
'
'(defun org-outlook-open (id)
   '"Open the Outlook item identified by ID.  ID should be an Outlook GUID."
   '(w32-shell-execute "open" (concat "outlook:" id)))
'
'(provide 'org-outlook)
'
';;; org-outlook.el ends here

' And lastly, update your .emacs file to include the Outlook link code. Just add this somewhere after org-mode is setup.
'(require 'org-outlook)



' Can add the following code to emacs for support for links for outlook items
';;; org-outlook.el - Support for links to Outlook items in Org
'
'(require 'org)
'
'(org-add-link-type "outlook" 'org-outlook-open)
'
'(defun org-outlook-open (id)
   '"Open the Outlook item identified by ID.  ID should be an Outlook GUID."
   '(w32-shell-execute "open" (concat "outlook:" id)))
'
'(provide 'org-outlook)
'
';;; org-outlook.el ends here

' And lastly, update your .emacs file to include the Outlook link code. Just add this somewhere after org-mode is setup.
'(require 'org-outlook)
