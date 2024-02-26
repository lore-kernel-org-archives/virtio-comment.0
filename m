Return-Path: <virtio-comment-return-9145-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEADCC48BF6
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 13:51:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E4D5FEE281
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 13:51:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B329298644E
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Feb 2024 13:51:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9856298632B; Mon, 26 Feb 2024 13:51:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89A9D986339
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Feb 2024 13:51:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1708955484.278000
X-TM-MAIL-UUID: 0fe2f268-2fbd-4517-9b2b-b78533b499d1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3IkJPJj1AmIFLP8toQ4YFArvunzS6AAduRsJgKZCHjdEkZ9JxEWcrWMhJjgPHgoWNRrh8dODpkuaSuePQnCJGA0L6dOAR/3Fw/XlI63aqOcThSR1yBnnpnJTbbSnqhxObrOxX3+Tpw+HwdGUFJnXd43t0oRpc6rP+vphRlnrU02q/+Gxm+MFWAPGH82W1sCcSoFHH4ploCeh3atdE4n7Gl0OC5DP4E/mz0ZTVp+W9J4a2v5NH1conVPewCaJlnHBADJSQCtYw6+MyTwC5FB97n/NfIWw36yzOjbTvzdrD6q25dICHOEdd1vlP38sL+5QZqFSrxEJDoWMSfYIuC/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfG11PFnybNoL5sj6lHsc0RqMvZOT9Ea2HkAlfJdQks=;
 b=Ai/ZzCfsdt368k+NqPBq1IE4+8iv+ON6joLRCwzKb1jwVn02D4cjEWtkdfrQ6Mkvk3zIjpQNk51ZNKM8hKzCgDQPzIWitr1ZvD4cEB5ZTSABzj45tQPobu4DKgrv4kclxmjLTtFRmwOF/n6kXaHJVVRpCP9tAjYHDpDUbOMxlaVN6mUSgcvoB0cfO0586fXZ1CuMVjLr1zGwnRyfVlrjhrg7OtRM6qOCumIVGs0R1v4Dw+pPZ52WFbybyFcOl1a47TlBeo7MdHPMdMsqpsWZYATwuTL4FxPoVC3y0A3hvZrrlHSGw4IROpcZNNusKuCZ+Z6POfTCXWWpHDm/8qMuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <464fe9d2-5469-4c0c-bf35-fb13ac6b4421@opensynergy.com>
Date: Mon, 26 Feb 2024 22:51:14 +0900
Content-Language: en-US
To: virtio-comment@lists.oasis-open.org, mvaralar@redhat.com
References: <ZWhq3eOxSZ8a7sd1@fedora>
 <CAHYGQ0x4fKCaTE1sBmpbBzzjEw_GwFES0f3eg7oeRvWsm4S4ZA@mail.gmail.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <CAHYGQ0x4fKCaTE1sBmpbBzzjEw_GwFES0f3eg7oeRvWsm4S4ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|BEXP281MB0182:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be521ea-3c47-4eb9-e17a-08dc36d204a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PXLkx6pt+SjndsJKhhNH2PLKUwByQolr/WEwVFaJSRRwyGA3o2m3zvWnXuYU2mGMcLbMgAk1RqxJL3kU6qBpAMf1nJinF1F1GvWf9jhEqeItnpzwt9vx6rlqci6nmJmqsrBbRAmp2wZ9otJs4a2knPe26BUYADZBbaxB2ZxBYZ0sKnNc1IQ7jBm5QM/DOXkaffi2GaxkvwFyc9iebn5XVaMMPoCkZ7AJiU48IjTH0kCGll5FICEYPykWG3PiGES3asFCJR32PgkKtHepNcwLTivYKv1kAkaTY2ikFCcUxkekpy9rk0JisadIUUnWZI5b4ZwmHwn4HRnwQMvFaLD9ky/kwssbo3mreqcXyqUpBCX4wNmf3zR0hzrmnbW38IdXJvvQqaf54mkbE10L521vA4itrO4S0ym6FcprWacPOkrQOSyLi7wQfHlb8/+auFxin9cATGHEYTXabA1D49AOO8qb+UgQBQu9Y3dMEYklYIn5NKPQQekC92b0JljG70k3/gRMSynKf3d8q72qvR/1HTk6obiI/jn+TdkSatbZTJyNTipb1NWmUHeqggKCcHZrYXSlcHg/UKQREwZvxSt7TOTRrsOpZLx2HMwyYROSKhvjudOBuJz3akvglf7AkeVd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1MyQ3NSbDJXZmpMSE5kbW5JV0M0UmgzbnJaYS8vb1V0bWU3ejJIUlpielFL?=
 =?utf-8?B?R0ZocnppM095WDA1bXRkUWhpYUdVTEhYeDRIWkV2Wms5UWZhRkVWbkhlSm9l?=
 =?utf-8?B?TTlVVk5lWWM1c0ppRWp6M3k3SUpzd0pOd0xBZXpWc3JMV3AxQkFGYUtsbVh4?=
 =?utf-8?B?STQ5NWtDM1prZVhOaXlQaFg5ZkRFS0lVN3ZpUVV3QmFZWDI4UlRsc1IzYmY2?=
 =?utf-8?B?cjlYQ0VCSVVOb3RGNFJuc01PYnhPVGoraWpLQTgwbGthcStHNG1iM3RVWENl?=
 =?utf-8?B?UlNkQW4xVGRtaUhiWG81NW92Z2NTR2szQlpveDFHaDhrdHl6YjhvNDZTelF4?=
 =?utf-8?B?UU5BVVR2cDArTzZPZ2xQZzJrVFYwWVZSOVBrcEJud0JDWHI3VDljZXd1UHNu?=
 =?utf-8?B?TzhIUmlLNW1XV051NUZ1MFZoRDUvczUrUzJ2amV0VWNaT3JNblZqQm4rM21U?=
 =?utf-8?B?Uy9waS85aUJEWjNaMVJvVXNzTTgxUTJnSEhiWGlYTVJpakxjaFVlR3NPRm9I?=
 =?utf-8?B?MmR3SkhFR0xYVzZlc2orT2xITzZWSGt5cXplRWJYK0ZWaWxpR2FZeHR0bFgv?=
 =?utf-8?B?UFc1a2I2MXpnaTFNQm0rT2xDRDJYbGdaWk5pbW5zMFc0eGRzdlB3UmxNZ2VN?=
 =?utf-8?B?N2E4T0xlb2k3ZGhHVVhpaW9OMThoaUhLTUxBOE1LTUJWR3JnMStSc2trTWpT?=
 =?utf-8?B?MmlJUnBWOURiK2VsVkRKK1hjdmlrUWRmREJ6ZHBiRER3dmowdWVlRXJlZXVW?=
 =?utf-8?B?Q0dxdnJQaHlsVVJ1UjcyNnpoQ2hZMFQrcTZCa0FuNGYwLzB5ZU41MkVhaENR?=
 =?utf-8?B?NlA5K1psYlJDcEpNR1NDdUVOV09scFJhME1VaG4vcEpZdkxmYUhkT0tLNjdX?=
 =?utf-8?B?clFoWVZTUDVnNGE4WHh5YXE0YjlqQm54MXJHb29hZG1OZEpoUEFsK2NnQ1pm?=
 =?utf-8?B?UndBd21TTm40c3BITU1MRXJTUU9Pa29VZ0lqWWdmN09DL1QrL2ZVcGJOa2Jn?=
 =?utf-8?B?YmI3aXBzRk5Zdm5GakZvL1lKaEx3OEI0MGRMMDEzbzhrY2ZoYjlQMzZ0NFZF?=
 =?utf-8?B?Z0twVldnOHlUNDZsSVBzcGtoRkpyK0hHWGcxU1pKZXBydTltRFh5VHgzYVVh?=
 =?utf-8?B?d2xVdEFtbUI5dHdUeXpCbit2OHpVRk05bVd3TkQ0dGlOYXA2Unh2cEswT2hH?=
 =?utf-8?B?VFJxYk9KTSsyT3l5ZGVHOWpZVDMvMlRQUzIvMUVEVWxZY1JLTTVRT0xTQTlt?=
 =?utf-8?B?YUdYMmJDRXkvUXJmZ0hIdmJNZ0lIbVBoS3dsdUtDTEU3WXRnUHJaMHEyaEFh?=
 =?utf-8?B?MXM1dkFlVHRoVWRreWZhd1YwSUc1d1Z0eXlMRXBUVVZMSFNDU1E5R3hUMnJC?=
 =?utf-8?B?ZERKSnlJcDFJVGdJSE9qMHRCV2x5OHBtai9iV0l5SStURUg0QUgrS1FJd01V?=
 =?utf-8?B?MDhmbDU1b1QvejJWSU1tVElyYnFTdlQxMnNLaGU3Q1duR05VWi85ZGtrblpw?=
 =?utf-8?B?NmpDeW13cnNvSHhyM2dramtqSUZDcjljVFRPdHZuOEF0bWxycnZKUGhNbm13?=
 =?utf-8?B?VXVGN3huZTRLZDkzMWlmTDYwMWw1SWgxRkgyUlArc3RhRjVOdFMveFRxMlcz?=
 =?utf-8?B?SEk1YWVCbVBwRTFLd1h4cyt0am92WW9HT3F1UnFLbVZOK0YwbWkxaHBQekRp?=
 =?utf-8?B?Sm1zYkFGY0pSUDJjWVRDaktXVDRBbW1BeHVGRitJeHpLaEloeEdSS1hjQ3B4?=
 =?utf-8?B?WGtsSm1UaXc4TjIydVVQckxMMjhiQTZ2WHR1SlBXTldnZUNGemFRaVZMeGVj?=
 =?utf-8?B?TFVsVndkOWIxcWp2eEhaNkZGR25iekRDVnBiMmtmRkEyTkJ4TnIxSlFic3Zr?=
 =?utf-8?B?N2R6TGYxTjVyVFFXVlVqcit0OFk3dlg1Zys4SnVpeFAxeFBvdFdmamM3NE1k?=
 =?utf-8?B?Zno5WVYwZ3V0S0t2MlJxUDBPaVJBSVhWYkU3NlZHZ1FNQmU2SnZERW82NzU3?=
 =?utf-8?B?QndiU0ZOQzVrOFBQdk0yVDRjVk9GWk0wMW5VMTIrQWRXUEp2VldrQ3hlcTQ3?=
 =?utf-8?B?eUR3RTAxUlBiaXhhL3BOTHl0T3ZvTmNMVGlJQzYrellMdCtpOVFzdDEyUVRZ?=
 =?utf-8?B?N0FYVnB4blJ0b0ROTXFqYVVDSUVJNnBFMXdyWis5enNYVkhWczF4cjE2a0RI?=
 =?utf-8?Q?PshoWPA4aW0Agp0zI0x9Bnln9xCeGpjJG53JWbmCjMwr?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be521ea-3c47-4eb9-e17a-08dc36d204a0
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 13:51:23.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UzCbAeL6JUsLJiRsbUyJmP6pWDZJY7OY58rx4+595U8dC8SIrofmt/SRaG156LrJYdAGE1l2NUqXZw6p7jYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0182
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28214.007
X-TMASE-Result: 10--21.544300-4.000000
X-TMASE-MatchedRID: dL10VBB8yodTzAVQ78TKJRhvdi92BBAuUd1JKREWJmRFx7lXgV2V0vzC
	1lcNJt+sEcprQILSqFpLpsFD/EsN+6iXIZEHIuhmoXieF+7O0poWRcTK0fEGOcb6ChwiGgNXtnN
	KCsvrnwPm9Tc/GgfFJwFtWueZlMH053wUWrdRQRL4PV3mEBaU4tUusl/JVaRNJMbUKl0RLWQOTm
	Rmm0AOxWG7SA6wCYCCkahjgFOTAFRum1pJlJ3EaH0R968WXL3fChJqth1sAeqcU9LnAKOkdoWcC
	566YECYU1aggOMk9siZubILyAdogoy6eRzzta4SeN74AukXgP+MVe9CAxGt5chgx7IMKlK+2b+u
	rH3H8sMtVJBtr98MYUF2JfNJT/5/zWx6/VM1PNPrH5D64+wmqomeW3FlVRPAUbrmMe9PPVn4QQY
	+sUgrSThmPf5JIdeVlnjqKAQZGV57GUDENr1nNXIihB0Ntof6ESmIL2wWvXOJOwV4RFMJHgoTTU
	qKMGAHGgVgzT/GzPNoPZQpDuhp057qzU2F2dErxU0BgCkcY+TaPuPIIqmcJ/p4OuSy0UFxr54JI
	x46I6QD+Uf8y92iJmTN42zgWnUNOfEmq6feyfMlCGssfkpInQ==
X-TMASE-XGENCLOUD: 203318a9-e5be-4229-93c8-2d48eb799606-5-0-200-0
X-TM-Deliver-Signature: 4BE1D8C14D8C07007DEF0748D4BF5C93
X-TM-Addin-Auth: pWLfLV00ilHuH8eTHbnMkK342mYKPZSokfoc5fJ3esFaJUrxpqzRI1iLb9R
	Iv3C5llA+phLH3g4JRDYGwmVq0rfesG5dhB0Psm9uZLUFjHj70sHtab6CrSNhP9yCdUCX34lTiR
	dH+dO/0NAeZYuopRSKiRmwwGbAFUYHvgFh3rjo9uuE0oWp2FAXM5Ra7DH4Cafx9JmKciwvx7I8N
	Xpe8nqhcy0xqsIwkeWfEKQsXWg/rgLtAHkdRGIbB6w9wJZtOUIRuTMG7ZJocJuHoL59YPVA1fbI
	z5DnkWK9YU7ImrA=.YEtTkYU6yLJlxQUfpbNa3DOBnRc4eoR0o0rjettqgCq/b7fR+INCChl+2h
	ZJy8GJyO8qPIZx1yYWKz1f5s80i++uvpemol4FpPsX0mjuKj/bmL1IMPkJC15RTeUz1nwNdLfig
	A/8lTSoEH/q16eaExHvqnnGgn7v8FqygU8p4yTkDJA6vps1OBrqbvlTBneryQJwti/eJHxmBkjy
	yHELDg5Tcl3ZAV/hSjemKXuEqrFHI+p2p0NcRIa7Zll/VQIh4a/u+OjP88e6n2/Tum+F1hewoZe
	l6E0VvvFrHZfPYliqRfnuqE8tX9QHgDvzs0BZH7qG+7THiynd7SQcZxI23g==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] Re: [PATCH] virtio-sound: use 'data buffer'
 instead of 'buffer'

Hello Matias,

On 20.02.2024 18:11, Matias Ezequiel Vara Larsen wrote:
> On Thu, Nov 30, 2023 at 11:58 AM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
>>
>> This commit replaces the wording 'buffer' with 'data buffer' when
>> referring to the payload of PCM messages. The virtio specification
>> defines the word buffer as a set of zero or more device-readable
>> physically-contiguous elements followed by zero or more
>> physically-contiguous device-writable elements. In the virtio-sound
>> section, the word is used only for the data or payload in a request. In
>> this case, the data buffer is sent together with a header, i.e.,
>> device-readable, and the status, i.e., device-writable. To not get
>> confused with the main definition, this commit replaces those usages
>> with the wording 'data buffer'.
>>
>> Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> ---
>>   device-types/sound/description.tex | 26 +++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>> index 54c9c8e..97151fa 100644
>> --- a/device-types/sound/description.tex
>> +++ b/device-types/sound/description.tex
>> @@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
>>
>>   \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device Operation / PCM IO Messages}
>>
>> -An I/O message consists of the header part, followed by the buffer, and then
>> -the status part.
>> +An I/O message consists of a buffer that contains a header part, followed by
>> +the data buffer, and then the status part.
>>
>>   \begin{lstlisting}
>>   /* an I/O header */
>> @@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>   \item[\field{latency_bytes}] indicates the current device latency.
>>   \end{description}
>>
>> -Since all buffers in the queue (with one exception) should be of the size
>> +Since all data buffers in the queue (with one exception) should be of the size
>>   \field{period_bytes}, the completion of such an I/O request can be considered an
>>   elapsed period notification.
>>
>>   \paragraph{Output Stream}
>>
>> -In case of an output stream, the header is followed by a device-readable buffer
>> -containing PCM frames for writing to the device. All messages are placed into
>> -the tx queue.
>> +In case of an output stream, the header is followed by a device-readable data
>> +buffer containing PCM frames for writing to the device. All messages are placed
>> +into the tx queue.
>>
>>   \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Device / Device Operation / PCM Output Stream}
>>
>>   \begin{itemize}
>> -\item The device MUST NOT complete the I/O request until the buffer is totally
>> +\item The device MUST NOT complete the I/O request until the data buffer is totally
>>   consumed.
>>   \end{itemize}
>>
>> @@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>
>>   \begin{itemize}
>>   \item The driver SHOULD populate the tx queue with \field{period_bytes} sized
>> -buffers. The only exception is the end of the stream.
>> -\item The driver MUST NOT place device-writable buffers into the tx queue.
>> +data buffers. The only exception is the end of the stream.
>> +\item The driver MUST NOT place device-writable data buffers into the tx queue.
>>   \end{itemize}
>>
>>   \paragraph{Input Stream}
>>
>> -In case of an input stream, the header is followed by a device-writable buffer
>> +In case of an input stream, the header is followed by a device-writable data buffer
>>   being populated with PCM frames from the device. All messages are placed into
>>   the rx queue.
>>
>> @@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>   \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Device / Device Operation / PCM Input Stream}
>>
>>   \begin{itemize}
>> -\item The device MUST NOT complete the I/O request until the buffer is full.
>> +\item The device MUST NOT complete the I/O request until the data buffer is full.
>>   The only exception is the end of the stream.
>>   \end{itemize}
>>
>> @@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>
>>   \begin{itemize}
>>   \item The driver SHOULD populate the rx queue with \field{period_bytes} sized
>> -empty buffers before starting the stream.
>> -\item The driver MUST NOT place device-readable buffers into the rx queue.
>> +empty data buffers before starting the stream.
>> +\item The driver MUST NOT place device-readable data buffers into the rx queue.
>>   \end{itemize}
>>
>>   \subsubsection{Channel Map Control Messages}\label{sec:Device Types / Sound Device / Device Operation / Channel Map Control Messages}
>> --
> 
> Hello Anton,
> 
> I apologize for asking again, but could you please add your R-b to
> this patch? you have already reviewed the RFC.

But, as you said, it already contains my R-b. I just can't imagine how
to do it again. :)

I think this patch is already ok.


Kind regards,

> 
> Thanks.
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0
E-Mail: anton.yakovlev@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616B
Geschäftsführer/Managing Director: Regis Adjamah

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

