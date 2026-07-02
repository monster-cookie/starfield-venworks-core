ScriptName Venworks:Core:ObjectRefHelpers:SetLinkedRefOnAttach Extends Venworks:Core:Base:BaseObjectReference
{ Set a LinkedRef to a parent reference on CellAttach using the specified keyword }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;
Group Configuration
  Keyword Property DSELinkedRef_ToSet Auto Const Mandatory
  ObjectReference Property MarkerToLinkToo Auto Const Mandatory
EndGroup


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;
; Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)
Event OnCellLoad()
  self.SetLinkedRef(akLinkedRef=MarkerToLinkToo, apKeyword=DSELinkedRef_ToSet, abPromoteParentRefr=true)
EndEvent
