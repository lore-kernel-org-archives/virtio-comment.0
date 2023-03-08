Return-Path: <virtio-comment-return-4771-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1714C64EC4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 10:55:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E71932B023
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 10:55:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D37D69866F2
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 10:55:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C16649866ED; Wed,  8 Mar 2023 10:55:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE2FF9866EE;
	Wed,  8 Mar 2023 10:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnLymf7K2g9GqsXLov7Rl4ZFfAuPgVfn+ANIFoqbpy3AtuI8N8riVRsWWEPWfq7k4A6arxGPkD0Ppa1RbYdLrPMA54hFisCEgXKk6svLNqQ65VKFHPRR7Y6H8qz7/dxnWPuMshIvQRroQtt/5kVPZdncdednVxSwFctO3YxZRGrCtJaXS0INQF29EKeiu3MmU9V+CJlf0ono/o1B2wMlj++m/RbWOfuALzZ8O3G9hdl2tX/7SdB1LGfavE/xlH5R3Zxp3aLUBDJWAIuPdZv6pe+hNxvQA8gz6wQ9hgDzALO0al+z/y/134iBCuQhN3yux5kPbhb609IvGUr2omki+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfEnCDCWbcw4m4jSrEuJWyxU71N50IiEe4c8OZfBOCs=;
 b=hkjDFW9t6yb6oAE5/0fG2J2IKaHI8TFNqowHUx+bc9PS6Tl5vImlJ70/JBjtn2+Enh7JiJn+HJq5PXthk1qiHyAep61c2IPmA0UUweahI9hddnTmAYzkvdu3C6tPpKHdKI5ILaf12V5FaD9sYzc5kUBccSGb0mO4r7beDyhNxh8Y36eC6a9dwdg8boLgZ/fnj3tgSYPPXRzqhWdxdeRXHR5vn2Xjj1xVTxvgNwA4LuJOtyxy3BRy/RchD9nu7Da4axCATbFvDeCS2dRxezezqExVSxbtcQh8omsplqrHL6jepugu5Ugz245VtF9907fT5oMCuzFkVfdwxShVZSvcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Message-ID: <6668fd7a-3eb3-0447-9cbf-72d308b1336a@nvidia.com>
Date: Wed, 8 Mar 2023 12:55:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "nrupal.jani@intel.com" <nrupal.jani@intel.com>,
 "Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
 "hang.yuan@intel.com" <hang.yuan@intel.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <cover.1677761896.git.mst@redhat.com>
 <910b3607a5f255134d30b3e1233e564f564eafb8.1677761896.git.mst@redhat.com>
 <PH0PR12MB548116853CAC23DF9CA7345EDCB29@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230302201912.GC2554028@fedora>
 <20230302185803-mutt-send-email-mst@kernel.org>
 <20230303131703.GB2866370@fedora>
 <20230303081900-mutt-send-email-mst@kernel.org>
 <4f869944-4ccd-c51e-0f30-dc3ba15ffd52@nvidia.com>
 <20230307192752-mutt-send-email-mst@kernel.org>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <20230307192752-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CO6PR12MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f2b10f-07e3-4e6d-2739-08db1fc3ab3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A3O9RaXfJJxhRMsPxZlQm4BcuQlEU+N4c14JbBcVMlKKVilu+vwxDVLdf4pNOK+UqP9ct+T98wYkJVDFDOcktcz0v9tk1SA86zSn59kJsNfFjsHZh7vnV+Y3xmwykdJ88M4nmI620TXo4BhM4/ZOiYXW0emVfZSA8aV5uXhYl40vvmKKaWHpuqn1XkZcXEc0QFuLEPwsmBYej4LLuaUQrg/7XHof//TSZsBthCDfSbDrG4v1v81D4qaVJxLsgW1w6Qa72Sl5mmgzx1OGaKT2cdaCYpSLwvdhgvDAfy0qmsTy+sRWFekFKk+AnLYn31k+w3zsqVoWHbFdcTLrdSAWCbwOPaov40IwNQVePSqEDREM8w7fkzauOR1fkXhO7dDLmq5+QCP9RPVhHWVD09F32qcoj1ipGbSu08iNmqoylHv2wa0lLsaId5+4FMjE6njjK91we2UpdamUOzWqJWNBHSF5O9EM9LNpi0ucZTMKl8rFUe3rk1pq4qFYVooXLl89KvUZNDsGHDc69hIbYvMCXLvnTg4J/RPVGFMldecov4LyYcmLpTbzi9KVpaTNLcGnZMz3AfuBq8m6mAxn3t7Bjao676++lygYGZXTes0DImq/SncrDamZI5Lhv/1RViIdpxG9YVHsAl+xR/dIBVrOc5xZbrCx48zn4/fr6AJE12KwUYf+InWQomIIuhvZ4cE6GuQxKoiXx2tT52lt6et27goUZmMEzRlvpRBzc15rVOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199018)(38100700002)(478600001)(316002)(31696002)(83380400001)(5660300002)(54906003)(7416002)(2906002)(36756003)(41300700001)(8676002)(6512007)(53546011)(6506007)(8936002)(4326008)(6916009)(186003)(6666004)(107886003)(66476007)(31686004)(66556008)(66946007)(6486002)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qml6V2oxTjNxVS8rMEp5VlN6U0djcWxTd00rK2RqMmFkZ2RJb2ZDNWhibXJV?=
 =?utf-8?B?WUdNQ1RQK2duNzRjcExLVENUdFdOZzhaN0QxM3BWKzBCdzdYV3V3MHBBL0pY?=
 =?utf-8?B?bWRJWGQxbndZQnpLMFVXZjdCZGJtZFR6YWt0M3hqSXBGemI1YUc0MnNXai83?=
 =?utf-8?B?NE5uZUF5QkZMZHBZU3YxeVFQUURCMks5SHZsNUFCS3BrdDJoRjlKZWVMM1pj?=
 =?utf-8?B?UjlyQldWTEZYU2EyRTZxeGM0QnJuMDNBK0lzelN4OVQ3SHFaWHg5R29Ia3Jn?=
 =?utf-8?B?b3hKSUVxdUtsMnBteCt1RkRJeVNaWXhCUE1nYlNibzJ4QWhCcVJFV3hxdnMy?=
 =?utf-8?B?Q05XZElDNnAvb2k3SDBRbWZ5SGhpSU1hK044TmhaZkd3REVWSzhzRlNlRXli?=
 =?utf-8?B?L0JvNEpvaHAzemswVEFOM3YzWjVZTWlkRjZVbjI4N1dVbUpHdXQwRUs2UTF5?=
 =?utf-8?B?c0U3andtcDg1YU5ySWw5Nll4WDJXTFUyeFM5cGdtb2ZDeEUySDcxcEUyMm9q?=
 =?utf-8?B?N0xoWEFXamlzb2t0dXJFRXhnYW82a01MdFVacW1QdXRwV2FhdE1IQXdDT2Qx?=
 =?utf-8?B?NzZUdVdaMWpwejE4cUw1eCt1eldJbnJrM09PdXlmTzR5Rkt6bWVCK0VnRjVl?=
 =?utf-8?B?eTdsQkZmMXIwTG9OK051TGpKSnJTQWIrS3BmT21HK1ZzTzg5bVFUbjFHSy9q?=
 =?utf-8?B?ZUNGbFovR1o3cjduZ1drMnNwTFgxVHErQXBYdFpNSGVFRmtyT3ZvTnV1VDVM?=
 =?utf-8?B?NCtTVkZYK25ncmx6azBkdWJSRytYeUVmbU9YRGJ6SnlKYVVGZ3R1eXZkUjRW?=
 =?utf-8?B?dXpkK1VtaU5OK3ZqdnNHK3R3a2JSeURqR1ZQQUVSMDZLREF2Y3BLNGo5Wm51?=
 =?utf-8?B?dDRwUWx4amZWVXVobXlnSU5EQ2JpbDdxSDZiNWJwZkw3VEt2MlkxWHQ1cE9W?=
 =?utf-8?B?TWxPM0xWczBHbS9rMXdJS3ppaitRYTRZeWJkVDZkUmlOVE5xdnM2QWFJQWxr?=
 =?utf-8?B?Sm5DcDljUzlDdnJOYVlpSCt4Z0JSVTQ4L3dJM21QVm1OcnRGZ3F5UTlYUGwx?=
 =?utf-8?B?Wmp3ZHEzQUJaZXNONEVNWFF3Y2crYnVTVE1mT0ZWeFYyZ1BQbHkrL215TnZC?=
 =?utf-8?B?NkF6TnVxV0tDNStHY3k4UndyYlNXSVhRVzNnMXJpYjk0blAyNDNhUVVITGN5?=
 =?utf-8?B?T1VYVnJtTElKNk9nY05uWTNWMk1LN0JyajVmcHFHVitZQm10cjZKc3BZWEJ5?=
 =?utf-8?B?RHlWc3o3NCtac0JCUkVBbDA5YkpYZ0w5QjhQTDEwdHI0SGpOTlVVVm1WSzB1?=
 =?utf-8?B?S1FwMm80N3oxaVROeHlWSS9leXFVbWhLTzlRVGN5MDArYXlJSDZPSG5Cdm9o?=
 =?utf-8?B?ckpmYk5mLzA5RGREeXJURmpER2lLT1ZTY1c2VXhtcm8weDQ3S1pLaHZlOG9T?=
 =?utf-8?B?RncrQTdqc3hNRU5wNnRoTUo4OCtTYWcrSThFTXUwZWNjcnRSb0JjVVp1VEZP?=
 =?utf-8?B?TFVpdzhFT2xOUW01aUIwOGpwRXdTN1lDMHREcWlDTkJjZ3ptZmNwMkFpM0Ry?=
 =?utf-8?B?d3R2Q0VWb2dqUUxyRkxLSVVrYWVORTByZWNyWFJwR1lpK2lCcERzUW1OY2xE?=
 =?utf-8?B?KzhadG4wUDVBdUp2S3ZpTDlNelE3US91VGFsS2RiY243WndxT0RORDdlV1ZV?=
 =?utf-8?B?VXZScjNXaGJ2Q3JOdVhJd0RkQ1B4YWJJOTNqdVZ0OEw0eEsyWS9rS0laTExu?=
 =?utf-8?B?RGl5RWVNVURORkx4MDZTRlRhaUlSV0U4T3lkbDl2dWk1ZXBra3laY28raWxN?=
 =?utf-8?B?Y2pnZFhUVFB4bnVpOTM2TlVpMy8wTWNsU2EvSlpVOVFEYTFIUXo0NlFqYXlN?=
 =?utf-8?B?dXpLNGtITjdZY09KbjFBQkVnVXowYkVUdFlVM2tZNDBGRDNEZUNCWjBrYWwz?=
 =?utf-8?B?UFBQV2NmNXI1NnRLaUFsV285K2o3RnJYZ3FtdG5KMWhFQWZoWUVvaUdzUXU3?=
 =?utf-8?B?NWNUZmFEcVdJdFl6YXp4OUxsNkFzNHJOVkR1OEFJM3h0OFNvcW01cHZUT3JC?=
 =?utf-8?B?THc5d25xeGFjSXZaQkFZYWw3ZlRBTm5DekNncXg2VktOWTFxWGJEcTFlK2ky?=
 =?utf-8?B?cXZJV2VGNmwyZmMraGhGWjQ0ckJiSjZ5N0RKTkE4ZnRDV2NHQ0RyWkJjZXlM?=
 =?utf-8?B?ZXJ1K1ZoYXVLVUhNZFRhelVrQlU4TTV1NTdPM29vUVowRkxQUTlqaTJCME1Z?=
 =?utf-8?B?U01XZTVCWDhFcllpT0pRa2Zocm5nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f2b10f-07e3-4e6d-2739-08db1fc3ab3d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 10:55:45.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfguJDZMkSx/NC1b2y/S3A8ywSKLkg7+3lz6fspPrlaWyfEw+8zIGBF3K80myuzMiQq1xDIxIn2xXXksujX20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
Subject: [virtio-comment] Re: [PATCH v10 03/10] admin: introduce group administration commands



On 08/03/2023 2:34, Michael S. Tsirkin wrote:
> On Mon, Mar 06, 2023 at 01:04:42PM +0200, Max Gurtovoy wrote:
>>
>>
>> On 03/03/2023 15:19, Michael S. Tsirkin wrote:
>>> On Fri, Mar 03, 2023 at 08:17:03AM -0500, Stefan Hajnoczi wrote:
>>>> On Thu, Mar 02, 2023 at 07:01:56PM -0500, Michael S. Tsirkin wrote:
>>>>> On Thu, Mar 02, 2023 at 03:19:12PM -0500, Stefan Hajnoczi wrote:
>>>>>> On Thu, Mar 02, 2023 at 06:40:29PM +0000, Parav Pandit wrote:
>>>>>>>
>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> Sent: Thursday, March 2, 2023 8:05 AM
>>>>>>>
>>>>>>>> +When \field{status} is VIRTIO_ADMIN_STATUS_OK, \field{status_qialifier}
>>>>>>>> +is reserved and set to zero by the device.
>>>>>>>> +
>>>>>>> s/status_qialifier/status_qualifier
>>>>>>> Missed from v10 of Feb.
>>>>>>>
>>>>>>>> +When \field{status} is VIRTIO_ADMIN_STATUS_EINVAL, the following table
>>>>>>>> +describes possible \field{status_qialifier} values:
>>>>>>> s/status_qialifier/status_qualifier
>>>>>>>
>>>>>>> Can you please add other useful error codes in addition to the EINVAL?
>>>>>>> Few that we are needed EAGAIN, ENOMEM, EBUSY, ENODEV.
>>>>>>
>>>>>> Please define a unique constant for each error condition that can occur
>>>>>> instead of sharing catch-all errno constants between multiple error
>>>>>> conditions. If a driver wants to squash them together into an errno,
>>>>>> that's fine, but I think doing this at the hardware interface level is
>>>>>> just propagating the mistakes of errnos.
>>>>>>
>>>>>> Only status_qualifier is needed and the vague status field can be
>>>>>> dropped. It's not clear to me why adding EAGAIN, ENOMEM, EBUSY, and
>>>>>> ENODEV is useful. They have no meaning to the driver, only the
>>>>>> status_qualifier really indicates what is going on.
>>>>>
>>>>> At a high level at the moment we have only two cases:
>>>>> - ok
>>>>> - invalid input supplied by driver
>>>>>
>>>>> maybe we will have more reasons for a failure - remains to
>>>>> be seen.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> I'm sure you guys have discussed this previously, but please provide
>>>>>> rationale in the spec because it looks weird to someone with fresh eyes.
>>>>>>
>>>>>> Stefan
>>>>>
>>>>> Really most drivers just want to propagate errno to userspace.
>>>>> All the detailed reporting is for sure well intentional but
>>>>> in the end it is at best printed into log - end to end
>>>>> people just end up with a switch statement
>>>>> converting these to errno codes.
>>>>> So we are passing them from device and this way there will be
>>>>> some uniformity.
>>>>
>>>> Please clarify the rationale in the spec. I don't agree with it, as
>>>> explained in my earlier email, but as long as its documented, people can
>>>> try to follow it.
>>>>
>>>> Stefan
>>>
>>> It's 2:2 for now, you are with Parav, me and Cornelia like it :)
>>> Or I will try to document it better.
>> I don't understand this status_qualifier as well and it wasn't included in
>> my original patch set.
> 
> Sounds like you feel I should drop your S.O.B - is this the complaint?
> I wanted to give attribution since I started with that but sure, no
> problem.
> 
>> I vote for "status" that describe generic status codes and
>> "command_specific_error" that should be inspected by the driver only if
>> "status" is set to "VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR".
>> We discussed this so many times before (and already agreed IIRC) and adding
>> this new qualifiers mechanism sounds not right to me and not intuitive for
>> device and driver developers.
>>
>> I suggest:
>>
>> 1. VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE
>> 2. VIRTIO_ADMIN_STATUS_Q_INVALID_FIELD
>> 3. VIRTIO_ADMIN_STATUS_Q_INVALID_GROUP
>> 4. VIRTIO_ADMIN_STATUS_Q_INVALID_MEMBER
>> 5. VIRTIO_ADMIN_STATUS_COMMAND_SPECIFIC_ERR (for more info read the
>> command_specific_error field).
> 
> I don't think it's a good idea, we'll have to agree to disagree.

Ok.
can you explain why isn't this a good idea please ?
remember that this is very common logic in many specifications and many 
HW device implementation.
> 
> 
> The point is simple. We can have a detailed virtio specific error.
> Nice for debugging most drivers won't know what to do with it.
> This is the status_qualifier.
> Very detailed but
> generally drivers will just have a giant switch statement translating
> it to a simple error code for userspace.

how giant is this switch statement ?
NVMe handles fine with this logic. Maybe you can take a look on that to 
get some more ideas of implementing this kind of things.

Why do we need to add some qualifiers logic into our devices ?

> So to save everyone work, we also added "status"
> a generic kind of error class that is easy to pass to userspace
> with a small switch statement.

if you want something that is easy just pass OK = 0 and not_OK = 1 or != 0.
Not need for qualifiers.
In you case the qualifiers is just an extension for the status.

> 
> COMMAND_SPECIFIC_ERR is just way too much detail - commands generally
> just should not fail it's a quality of implementation issue.

it's the way many specifications work.
And this is the correct way for future extensions IMO.
Each new command may have it's own namespace of errors extensions.

why we defer such essential decisions for the future ?
We already introduces 2-3 admin features in the past (MSIX, feature bits 
config, num_queues config, etc..) - maybe we can learn from it ?


> 
> 
> 
>>
>>
>>>
> 

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

