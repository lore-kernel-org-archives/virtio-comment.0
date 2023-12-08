Return-Path: <virtio-comment-return-8763-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEEFC4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  8 Dec 2023 02:45:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C08682AD6E
	for <virtio-comment@archiver.kernel.org>; Fri,  8 Dec 2023 02:45:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5124986917
	for <virtio-comment@archiver.kernel.org>; Fri,  8 Dec 2023 02:45:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 86FB798690B; Fri,  8 Dec 2023 02:45:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7552698690C
	for <virtio-comment@lists.oasis-open.org>; Fri,  8 Dec 2023 02:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702003527.754000
X-TM-MAIL-UUID: 61becd43-c7ef-491d-a7e3-b0294bef702f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjNTBRf5rqehmJl8XotmAhd3FcSgYentvDbDfn4HcREei39CbvLuC3F/xAbaf+EFylrBBNISGgcl96EdX2pvFEvd2NMIOX9e4DYuzwT4Zphb1vb2APC3o8fKkKm0Sa97J59rSxrbUeGwnj/CLBstSGwYnFtBMnocLxnmY0gxOmDA75am+S4RA6/JR7gnZWipWhpt/SvoYFtd3govFbK6CqhuJ9k5n16Z8uCjmolrJm1LxXKyYKMXXK6L/dsPg84qWiiFPpfeDmEBmiYwBeHdhEucPvzC9u2XA8MMWnYu8Kdihr4CJWqFXdVvcEThZloP9wwBi8GXED7IJXSoyh261w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn0hHWQKadFzkRJAV9acfBTXzCoVkFH25KRmiVe4wf0=;
 b=CcW/aPPJjLyGB6WrnZMFp1kCFF0in15/+BW1+Aid+RFSPtqqw6hU+zkFbo4ywgY5OOUtZP1BYWLSCRaMg1IHOdlaLPQpY+HH4sOe0SUaTkQC5mfJi5sL+9zgJao9TzYy7Caa79oUq2mUsYevXQ/zpfrcV1L/KUDCwEVA4dfh900fLGlbwmrmtEfa9K9tguEcSkXA3+/N/0SpXZD+HS47DUi5X8ci08qc2Cgf54B1SMqqYt4EVCSbjKufIC11PPdAkPx6moQFOMj3wWFiFGW1NzEEARhhhd56yzuJtp0I9JMwtRCLQEiWTZUEtvDN5CMG2CPHj7Vpd252rl6z5aHUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <cc2648d8-503a-4a09-a9cd-0d7133cf39a3@opensynergy.com>
Date: Fri, 8 Dec 2023 11:45:18 +0900
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
References: <ZR6EzpQb6J1TxbM8@fedora>
 <CAHYGQ0yw+ejG9TY57gVZeG3ucDxofebW5FDwhwLDS1HM6VfzaQ@mail.gmail.com>
 <ab659c42-3223-455d-8e22-fad373fa54e5@opensynergy.com>
 <ZWhoD/1ARedxgQsT@fedora>
Content-Language: en-US
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <ZWhoD/1ARedxgQsT@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|FR6P281MB3735:EE_
X-MS-Office365-Filtering-Correlation-Id: dce15cc6-acd4-4e13-fbe2-08dbf797bb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKxs9H4iwk2mjV1i4kGX+6xGP+OcdVPxSeGETxor7VhUwC0voDx5bLGVi/KRftJRqoHbE+3ex/1wFG3v58y1N9FSctdbquE+dpnFrj3si3BzuJAW3VrkOADVdMr4mowssF+toVwMUn7VZ/0r7Qppz2KvLCa70I/rN6uY9H3sQWOvu2Wmnd+xcYFhVtNfEafhNo4KL1M+iYnLlaru9l+GKp5B2Q4CBAlgj6wHaxuVCe6sXFFaDIZHSF6Bgh6SWuutWV1LRdTAYhzaHZYR7d4glPWQI//pA/WYVIZoaOiYhYmAwTqYYxY+NYXmomLGiykLpR97WuuilZDvkdjIs23so3eWxHZZNEhXCU6d5wJGfyvhW55xTrDPpkieACaghVNxI4FT457lnjmoxQ6ESuUtG9DJ9Mdn70WFBMFPZROwno9OIHBMxwnHAXb8BXyQJDLSZlBNUPXCxOq23/uLQOMYrHUphORQjNacd/+DCoYELyLCqIA2J8CChGIObtx4vVWTba7Us5ICI8+38VOm6ZA36k75JOuFS2Keabw9Fy5ikpAoFfZtyJZtJTCMPpGfJx7vaVaN+A/kFKnWqE/kP7i12duxJN/JTSB6m+9H+ph1bOYLuD8v9I8IgR0cRfFh2J7tfhUkcrWO923LriylY1WaGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39840400004)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66899024)(316002)(66556008)(66476007)(42186006)(6916009)(86362001)(8936002)(4326008)(8676002)(44832011)(31696002)(66946007)(41300700001)(36756003)(478600001)(2906002)(5660300002)(38100700002)(2616005)(26005)(53546011)(83380400001)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVNDVDBHaWc5bmZDQ2hPOXpBU1hvK0pSVXZwQ3Y3MTJpRWtidXZtalpvUjJ6?=
 =?utf-8?B?K3BEa3ErRE5rdWhOODFRcjdMNTZZUHlqTW1iLzdGcE1UTnFHUkwzVjhYaklQ?=
 =?utf-8?B?cVpTQTdTUGdxWE53Y3pueFhiZE9VbjY3VDFISTVnY3JqaVdKTEJmZ0RmcVlq?=
 =?utf-8?B?TEVHRUVxdDZ3VysydTVkblRNSzRRYkkxK1BSVW9IeWRiSXBlelMzSFNSSVZm?=
 =?utf-8?B?bXU2RlJpSFQ1MWcwZWhCbWhDNlJTNHhCd2lkTmlGOFB3bHBZa1BUemt2Y2J1?=
 =?utf-8?B?T2xxNjM0anl1eU1XQS92SEFxZ3Y2THFGUEpoTGpPczlYRkJZblBEMkk4TG1i?=
 =?utf-8?B?VnNYd3l2Vm1yWGtHOG5RWU85bkxKd0VlTEw5akFFNDJxdlZZNFBiOTErM0M4?=
 =?utf-8?B?SGYwYmg1RHppNkdKalZaQU5tQzB6RGx2dGphZkhIYkQ4a2pieEJVOWpEbzBN?=
 =?utf-8?B?Vi9wUDRwZzRORFNJREJhOVpidHczOURkUmUyZDBxMmd6UWV6c2ZxcTEwN1Fa?=
 =?utf-8?B?QThCNnJqazNTWGVCd3NhTHBwRnZ3SCtFeFloVUk3SVpzSk10UEg2aW9mZEZF?=
 =?utf-8?B?RFUxUkxFS1JpMWZRNHZ5V2hFWW5BT294eDVBaWFZV29wWVJvMzZjV0RWMVJy?=
 =?utf-8?B?R2daQzVQTlRZRk51bkF6WnBVTWhzYUJsdDhWa2RwZzNWSUtsTkZVWDJtWmV1?=
 =?utf-8?B?dWFXV3VJOVc3RkFVTzhieWdRWm9ESVY4T0JJYU4wN01SWXN3TWloT3pNQ3cy?=
 =?utf-8?B?Vlg4OFJCTDEyY3F6NkFYL2lYTmlYbVhvM3d6TEJMNjRBV2FNd2xRbGtUeTNn?=
 =?utf-8?B?bFA4dU1MTWtLbTJKa2dWY1BKRGdwZ2U5TzM4d29QSTRxSXlXVEJYbWRHTFNI?=
 =?utf-8?B?blBldmx2OVZWTnYvRU9RcXh2ajJjY1Q4aEtEbjYxSjZMaEF3Z2RJaGtpbE5P?=
 =?utf-8?B?aXNyYk9oQTRVK2ZpQXQ3TGZxV1BzOTQ0c2JreWluR251VHR0bG1TVk1FeVZL?=
 =?utf-8?B?d2l2eUNSL2ZQc0tzc1hzN3E1Y3BuSkdxUk16K1FYeE5YODNwZ3lnYTZBR1dR?=
 =?utf-8?B?Nm1RVmpuVlpmV0ZReGNyTjVXZElPTG5NVUZqbTllQXFYWUVGRVMySUx5NFV4?=
 =?utf-8?B?T3gvbTVaZSsvWVFlc29SU0VJbGNBK1NnK2paU0tuRnlvN1hvZStlMzlaSUVa?=
 =?utf-8?B?dDZncmRvL0N4N3c2MXBVbC9mT1Z0L1dQNVd3d1cxTjJmME9QcGF3Qk1yd1JG?=
 =?utf-8?B?NGhpZXA4WmlSK0l2WTNPU0xPbVVHWkp2T0NoOUJRaTJINFNIWUN1b0FSNWkz?=
 =?utf-8?B?dkMwbnc0Uk81U0JLdUhmZDFZbTl6MFIrcEpnb1lCNFFRWklPWm4wMVBBQWhW?=
 =?utf-8?B?V1BueUx2Qkh6aFQxK0M4dFhpVXBQN0R2REVlYm4xTWFQK3Y2emIyMWN5NDNp?=
 =?utf-8?B?bWs2Wlh5RUJCSklPdkxPNWNPRmxFY0JSVVVzc0hMeGZ3bWlqcUNwMDZBOFRB?=
 =?utf-8?B?anRwY05RMklTMjg3S1pNTUYwTXozaVpNeG12WkZjSWZIZCtKODVmT2hCblRj?=
 =?utf-8?B?N2dXR0VCbWpEQkpUaEN5QmJCQ3dJdmQ2N3hTbW40L0l6ZGNuSERtQWJXenVp?=
 =?utf-8?B?U1Q4QXdHMTcvZTBsMkFQTlEwYVlMZ2ZlcmpwRkFZYmNQMlc3N0R5bktwR2lO?=
 =?utf-8?B?aXQyUksyZjBzWi9SS04yeUl5bEVvMDZSWjRMdHAvMU00Y2VJM2Vpd0NoWmMy?=
 =?utf-8?B?TlUrWGlNU3hESCtXY0NuSXJTcWIrMERHNW51cExGMzBwczhYOWVvbHg2d0ky?=
 =?utf-8?B?YVZJUkVHeFRKbFV6WUNtQmFrV2kvVGs5cEdkeW1OaUY1d2ZnS0pwY1pHREdJ?=
 =?utf-8?B?ZVhsM3FGdUV5Y1RrWnoxdWp0R3FjMHhBTmtvK09sMUx3d3FsajJvTzFudkNo?=
 =?utf-8?B?MmwvakMxY0Y4eHIyK3ZaQzNsTytzZkZ2N2gwemNEaXdUMXU2MGR6VWJ0WEVH?=
 =?utf-8?B?ZjIzbEdMY3lGTXovTHdCbWZkNlkyN0NhNzRhMVh1aXFvOGluVHkvRzlPcFVl?=
 =?utf-8?B?cVdlb25VRDgxbmgvWlUxb3dyS1M2SUtwRG1WRU1NMDRTbnJuMHJIZm5RZUhm?=
 =?utf-8?Q?3K1tYSjUnklxO3gZbq10oDK5R?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce15cc6-acd4-4e13-fbe2-08dbf797bb99
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 02:45:26.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReKgSpUZmdtQr/6ZiTQ+aMVj/IlYMljVtfyvcSvMJB5KiJG4Xipw5tui0UgaTA1hKDZNHY307A4QvYG8Mf3MZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB3735
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28044.004
X-TMASE-Result: 10--26.843300-4.000000
X-TMASE-MatchedRID: C/snMIRQLS35ETspAEX/ngw4DIWv1jSVbU+XbFYs1xIhkL0gCMh6DlN3
	rR14CcOhGEJSQnEWTfKLO9h/kZ7mQr2KMNqfxJkCUlO0zoIcpU6B1fO2o4QGcFkDEupan34PO3n
	IbkOFysIJGnDj1UHi6wRx6tYvM9b7UAStw10tjyBLviwaHYb1se4HeUqhyIYyZDry68hdbV4VzW
	aohW2+5KJ/XDloAeUSk9Razjxghkemw67F8Y7edlssdJQrqxMalIhi5GPAGeNrJ2aYUZsUtxXX4
	JUcjUFdHJi1gReJcwvLq+0RgqIZUfz3BWE0gMZ/ZUfUHA2Laiwa3oXvkaIARpI6syrgZ5ZaSbrM
	pf8slybQKF5VsFp8yPxwog8i0v7vZ4n57YIG4wBkRDVifPlAcYB1tSnIvF1D3vJmSnAjZBBq5HB
	BuOg8ziNKtOF0t1j/THxSrgy3rAJloDh19hwAesVNAYApHGPk2j7jyCKpnCcSCDdzAMeX/U7zkl
	yhPTD9YIyQM4JfnWl4bd6tiMFuXX7cGd19dSFd
X-TMASE-XGENCLOUD: 51be7257-46fb-492f-971c-851f849a6c07-0-0-200-0
X-TM-Deliver-Signature: 0033C3FB0A399D917B2D4BFDC71C42B5
X-TM-Addin-Auth: 3/kvxXM7YxwO8AooIYDMwF70/VZVtwJlYZoh/dfW89ACm3HFQcDkLurSnO0
	0qd7A/0HODwzy5nGb/ggu6f1fN1kbKb4ZCgkkLOpu6tBM4MRhS6ErRiQFMF7Nq+vE+rYrHFS2/3
	jNEnQo8goVLD7c0PeST1KcvQyNs4cP51SFdet6V+afdX/PvCXGFN9ocD/lcman4/chWP0DSWEIi
	hQdq947OhVPB14qUyZKIKoqdrhn69irZY7rBZjGKoHewFX3zjsq3MqucM0WbN2sE9/cC0StKXQC
	ncM1fTR66ub/yQA=.JzqU+mjqqpjhTAWQEELi74E5elfbpia4XvzX+HXWdWXKieyTbER5D1ClmX
	l/1OQJFZVrut1sQ5uoQyy+vD3GH5OW9cAd+t8E19qd4iFa5cIOF4wDZ8kcgt7GuWw/dXAoW1nQ3
	HLpguJm2Vph8nMXUqUYL6BgieuFNzEgJDnViEZ6t7mPFC3FyNMsshKNAGpIy7BhgbAFuJrj/tyV
	Em2TangTGuN6CU1Yi5TQxJxCy3TXnMdL5OfyGaDLlNZHQrFUfodDmGoUtQKCY5+RnHOVkoqPIjk
	Fnxf14uEUZoY9HqqhlrTlJ+k1CYBTBD0TEpomYuMzkgB+a4Wp/rXqronnsA==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] Re: [PATCH] virtio-sound: add latency_bytes definition

Hi Matias,

On 30.11.2023 19:46, Matias Ezequiel Vara Larsen wrote:
> Hello Anton,
> 
> On Thu, Nov 30, 2023 at 10:30:35AM +0900, Anton Yakovlev wrote:
>> Hi Matias,
>>
>>
>> On 07.11.2023 19:46, Matias Ezequiel Vara Larsen wrote:
>>> Ping Anton.
>>>
>>> Thanks, Matias.
>>>
>>> On Thu, Oct 5, 2023 at 11:41 AM Matias Ezequiel Vara Larsen
>>> <mvaralar@redhat.com> wrote:
>>>>
>>>> This commit aims at providing a better definition of latency_bytes. To
>>>> do so, this commit defines latency_bytes as is defined in Crosvm.
>>>>
>>>> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>>>> ---
>>>>    device-types/sound/description.tex | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>>>> index 54c9c8e..1349765 100644
>>>> --- a/device-types/sound/description.tex
>>>> +++ b/device-types/sound/description.tex
>>>> @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>>>>    \begin{description}
>>>>    \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
>>>>    and VIRTIO_SND_S_IO_ERR otherwise.
>>>> -\item[\field{latency_bytes}] indicates the current device latency.
>>>> +\item[\field{latency_bytes}] indicates the current device latency. For
>>>> +playback, this is the amount of bytes that must be consumed before
>>>> +the current request can be played. For capture, this is the latency in terms of
>>>> +bytes that the capture buffer was recorded.
>>>>    \end{description}
>>
>> Yes, this field definitely needs some clarification.
>>
>> If you think about it, from the point of view of the application in the guest,
>> the size of the current latency is the current contents of the buffer. I.e.
>> exactly what you added to the description, but without taking into account the
>> value of this field.
>>
>> In the current Linux driver implementation, this "latency_bytes" value is
>> saved to the "delay" field, which is then passed to user space. And this
>> "delay", as I understand it, indicates an additional delay caused by the
>> specifics of the hardware.
> 
> Yes, I understood the same. For me, it was not clear how "delay" would
> be used by user applications. In crosvm, for example, `latency_bytes` is
> set to 0, but I'm not sure what would happen if it was set to something
> else. When I played around with different values, I didn't notice any
> difference in behavior.

The value of this delay is reported to user space, and can also be taken into
account when calculating timestamps for the substream. So the application
can take this into account if necessary.


>> And it turns out that the latency_bytes field either should indicate such an
>> additional delay (for example, caused by the specific implementation of the
>> backend on the device side), or does not make sense, since the current latency
>> value is already known a priori. What do you think?
> 
> Do you mean that we could get rid of this field and add it in the future
> in case we need it? Or, to add to the description the fact that
> latency_bytes is a specific implementation value that adds additional
> delay?

I meant that we could add something like: "indicates the current value of the
additional delay caused by the implementation of the device".


> Also I do not understand how the `latency_bytes` value and the
> completion notification may interact. For example, a device could send
> completion notification immediately after a request is received and just
> set the correct value to the `latency_bytes` field to indicate how many
> bytes would take to the current buffer to be consumed. I can't see any
> issue with using the `latency_byte` value in that way.

But what is the practical meaning of this?

And, ideally, the completion of requests should coincide with period
boundaries on the timeline. Otherwise, for example, there will be problems
with synchronizing video and audio streams when timestamps based on the hw_ptr
value are used.


Best regards,

> 
> Thanks, Matias.
> 

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

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

