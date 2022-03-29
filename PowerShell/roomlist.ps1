# Copyright (c) 2022 YA-androidapp(https://github.com/YA-androidapp) All rights reserved.


Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -Device

$roomListName = 'All Rooms'
$roomListAlias = 'allrooms'

New-DistributionGroup -Name $roomListName -Alias $roomListAlias -RoomList
Get-DistributionGroup $roomListName

$mailboxes = Get-Mailbox -ResultSize unlimited -Filter { RecipientTypeDetails -eq 'RoomMailbox' }
$mailboxes | % { Add-DistributionGroupMember $roomListAlias -Member $_.Alias }
Get-DistributionGroupMember $roomListName
