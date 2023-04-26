Return-Path: <virtio-comment-return-5656-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2448C7618E
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 10:07:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B0172B07A
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 10:07:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8E16986644
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 10:07:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D6F3A98663B; Wed, 26 Apr 2023 10:07:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C340498663C
	for <virtio-comment@lists.oasis-open.org>; Wed, 26 Apr 2023 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1682503638.588000
X-TM-MAIL-UUID: 00969682-8a82-4f67-9445-33df01deed0d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tybh0/U+DJXRqXBzHTGLAjLgEzW664bqZu9fDNOAiQwgksASEcydcnCU3g1wMBy6IrfbZllsF5xEqUNMiY2mewLK5sciY0lBSuO82+yKCrclYORkGzICFvrbMBSRKtBHo3pXNnPRStNLI+rluUXT+N7H+MypUjq0uGQ3JRbAi3tGZLc+cfDPJAoL2yTK4jU/t6BMzaPhbbbupvueIknzVYSxysaKNBDejoau6WqIdpBpEKoebexZOL5ZMd8j+3tlVO9YnBmAtHc3FVHD7s3RP36uhtuftY5Wn6KQaNKYziKWnOzn0y4ivVDCKOX38rUGtxcoQOHLd7GWkMOIC5KmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UREw+SeTVP1vSOJ26h6wZzswfJBQpgaZnA3GqQSo+I=;
 b=WuG5Q8fPG47mCmfjTwUP1Ht3f+2GZvW1cHElVm3KHP8zrcyI18DBCa4TRodcCIxrPvK4m0RkxSFZgKwNhNfAkNlzQhdtZFAwzNtctFxUvnBnutheBlQdmNwv3ljDc6ydLoUE/GVK2TuFU19y5lfO7S1jSjwezVPfU4rptgbXvphKUDrweE7Bwtp4qABa8WTzhO3Kc5BSpGxVW/DGLuj9i5IvW1aauhiJAt0Yf0EeQalQh8p/Ss5I88A1E6Xl2wbEtEq16p+gnykSxnDL4qXuWRKw0fThJ9m/z2zou6n4A/6eZ1RyzoKGwudJ5L9r0GA07OgyZgQ+wwx0uyHNhDDIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <75b978fc-b6e8-e0ec-c6eb-5a695214c921@opensynergy.com>
Date: Wed, 26 Apr 2023 12:07:15 +0200
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
References: <20230313041116.126953-1-peter.hilber@opensynergy.com>
 <87zg76k9sr.fsf@redhat.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
In-Reply-To: <87zg76k9sr.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::18) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BEZP281MB2904:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ba6f2b-1b37-4200-2920-08db463e03bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ud7n146Ld6QP4Sm4VLQrTEr49JSiHjY+RVPR98NFHpBe72WDroi0U+InrRSwBaND1QqbHFkiybJ5RxZWTdDdk1A99/KgZNIQjwUvNm81sf8ghMeoVDEoJUBXWs0JUn0RhDN/sZ4yDGWu6UYM435QcSA/nbjTsDhThB3lr9ijK/d5otcWLCpN8V5N4qTpkxNNTrYT1ewQLsAmIHSoV3OF0MUaOWheYoRisU1dfKvZuIge7OPtMDQuzfWkXOpgxAYX4fB82vn+xxpk7mdJ8Wn6LfWHQG/mGGRYVOo8VzCVb5IZnlJnmnOI1a5TvPnpbh3lC9DvtSjRGXeWHBo+3ssOD0k7cw21iy+xJSgNpcA6UjcPZ3NNdmHAFwm89+Rem1wLoaGla544eY/k28VN4czP4tXcVcIH78Vmy1olbpS7zLkXekbEyXFG2TgGio5NFcZfWGioF4qaJPnYXqN6Ha+Zii2XCJjxcd4HDfsHmWqI42IF7tVvOkRqPXeqruZLDHjYQW767Na1nOaqeIqueLpXq6pOky8W8b5v8m65Ma3P5/SZU1CcdR1n+qH7RkeX/FHk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(136003)(39840400004)(366004)(396003)(376002)(346002)(451199021)(316002)(66946007)(66556008)(41300700001)(31686004)(66476007)(478600001)(44832011)(5660300002)(42186006)(2906002)(8676002)(8936002)(186003)(26005)(53546011)(2616005)(83380400001)(36756003)(31696002)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhzdE0wQWJZdHZ2TGVPbFY1bHpkekk3UWVablRoRXoxaHo2dWpqcXoxRVZ5?=
 =?utf-8?B?Y3VSUGR3dzM2WHNZTFV2WldQUWZxMTRRdVVnMFVURGFnRW5iZ1c3QVBvUEEz?=
 =?utf-8?B?UlhCNFVhQ2hCZExoeG5haEZFMlh5WHArb3B6b0ZoVit3bjM0VUdrMzFMUTFh?=
 =?utf-8?B?THlwMWpJeGRsMVFjQjlsZ1ZHckRuWlE5MjNHRnFyOEt0QmZXNFJOYzIwYUI3?=
 =?utf-8?B?UDFhN2YvTDBEd1RmWnNJUTU1clRmekh6Um9ZQUxjVVlPOUMxWm1YNzd4Nlhv?=
 =?utf-8?B?TC96RFZNemdORjY1NlhDUUx1Nm5MOFJtUHVDc2J3OTRNU3FIS1RFS1hNZHpr?=
 =?utf-8?B?ZVR5Z2k5VXd5UkxBYW8xaFlxZ1hxenRpUjZxOE52KzJsWVdvaDdRY204ODU0?=
 =?utf-8?B?NlJONHRFdi9BaXoyeWFZbW13K2VLZGFMa1JZdzFKNG9vL2FUM2pkZm9zWlZP?=
 =?utf-8?B?T2plbWhDbEtpQVcwNnJrUzlPejA3RmtiVSsrY25rdy91UC9OVmc5dTJ6QU83?=
 =?utf-8?B?TXRrNzd0bGloZGpUNW9yRUtseGNnZG9tWXVmUk9FTWhQdm5nMUdwUXJDWmlE?=
 =?utf-8?B?QmxxU0lRRVBocWpCY0VBeHljMkhNcVNIUHV5QVVEbGZiNUh5U3AreVF6aDFR?=
 =?utf-8?B?eDQrTlVDeFhaUUlOakMyU3d4eElrSHhOelZVZ05HalJLcGtkVXFoSGlwbmg5?=
 =?utf-8?B?aVpiQ043Q2xjRnFsaXJ1cmZjMU5La2pkN09OZ3ByQVdLZjB5ZlBSaGhrTTNB?=
 =?utf-8?B?eSt5S3J2bmVLc1FRQStheVpqZHQvVkNoNG9BSklEL0ZYVDJVZHBCTE5MQWky?=
 =?utf-8?B?ZjR6bTBxeGJYM00rVzNFZ0FDRUZsRlU1elVVakV1SXlTRkxZdG5HVTlWcHd4?=
 =?utf-8?B?dzFJSTQ3ZXRGY1RhV1NPNU1nWm14a3MzaGUzaDhJRWxvV3ZIbVdPSEp0SlVk?=
 =?utf-8?B?VCtZT1BxR2ZiV0NXTDIyZkxwS0JnbHpBQ1VZZUZTZ0cvVzZHbFVzdkp2cGtn?=
 =?utf-8?B?MEN2YTNianFpdENKN1dubTlpRFNXMzdQaHY5ZXFDOGlSVERzVitPN09pWUc0?=
 =?utf-8?B?d3FscWRUMFk1ak1CRW1CR0hucDlqc1RHQmMwby9LemEzd2xlRHltQ2JGaThN?=
 =?utf-8?B?bU5wODdBZkdEZXQvRlVYbFUwOHJhTEltYTh4TlFnaWRsbFhXcGkzWVNYZ2Fq?=
 =?utf-8?B?NllEdUhTWk9uQlJXb1ZwOVVUekxoYVpLdzdtQWVKOU1yUjNOTXFzdndnOXBR?=
 =?utf-8?B?eHBWMmdlVXo1TC9qaHl0RWNaUjZweTBrcGZrQllzdmlhZmlzazloMkdkWitK?=
 =?utf-8?B?K01SanJ2UmxPbFRGOTZyVXY3U0xOWnR4SWVVQ1hCSzk2UFFkRVVqSU1iU2p3?=
 =?utf-8?B?dzl3QXp1aVZLcjRZUHJzeDlaMkZyQkRTbTZ5VVdTWFI5SXl0YXhINzE5WTVN?=
 =?utf-8?B?MjBsNWdweDdvOWJNcWk3aW5BTWRDS1dMblJXUjRteVdIK01XUFBzcTJ6L3Nh?=
 =?utf-8?B?bDQ5R1gzbE92NVdwYUhzMjB0VVlwTzB0WlFDSGRUSmQ2WGQ1OS9oREdmdDg2?=
 =?utf-8?B?NE12ajZXNDh4NXlqekNhOGJGcEpIS0JNNVhMdFllUUl3SkRUMFBmZkc2MXJk?=
 =?utf-8?B?Q0FmbVdJa2RIdFBobksvYTZsWGJhM1ZMcU03VWhCeU9QaEVScGNpRXRld2xW?=
 =?utf-8?B?NzFta1BCWmdRcFJRempmOHpQejlmdk1nRi9JVXZIUUFUN2ZZdmNMTUlZOS95?=
 =?utf-8?B?bDNQcGZEUDF1d2hOYlA3MnpqKytLNVRNemZTakNwNW4zQ2tGdTFXakludUJS?=
 =?utf-8?B?NW9zcnZidmNEaThWSGVjOWE5QkMrYjAwQlVNNmhCbkZocnV5UFhudllNTGs5?=
 =?utf-8?B?cXo3WU5lenJUcDFlU0RyRzRlcnhxZ0psUkE2ZUNJb0NlODA5UzZWRys1SUVM?=
 =?utf-8?B?bnVMa3dOcGx1cTVJL0Rqb0JrcTVieTIrUkZlRktPc3lBb2hVbUR1WGY3bGRH?=
 =?utf-8?B?MHA2QUozZ1pvYUgrYVdyWUZZRGwzb1laWVpWVmFaM1czMFAxajRHb29NeEZu?=
 =?utf-8?B?UXh3RG1OU2MvODJIM0x4ZXhZazFwcVVTcitMY2w4dzIrUmZtcWkxdllKNXhm?=
 =?utf-8?Q?a8DtkGY19+DKcBVtxnwYt9wLZ?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ba6f2b-1b37-4200-2920-08db463e03bd
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 10:07:16.9658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv9aHuRTaFwpSD34X5b2q+DmqdQ9pNBOGcmZpGzjRayCcK1CRy1cL5IN40ZhCmqokGi5jFJdEoC6Fpn1Q67RKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2904
X-TM-AS-ERS: 104.47.11.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1007-27588.007
X-TMASE-Result: 10--22.301000-4.000000
X-TMASE-MatchedRID: /77LoUQXvQ//9O/B1c/Qy6n9fPsu8s0a9mojSc/N3QdlEv6AItKWF+Ws
	WsO3yC+R5U2NzhfTq9wMTcSRJhpjYkVo4O2Xo9Hd71L6f9O5B+ZJ0h0KLwFrgC196sn93sBvIF2
	O99KpeDGO7hbtJEox4pOEOQlW+0SsvpqBrThv61N4L+0UwLmbKAgqPpbA7sp1pjlkbDvDJ4d1N6
	CkrtCdcZIyEkGXU6ffT5qvV+wg6GaQx+WOi6GOwTLRY601LrakWQ3R4k5PTnA1Y73PdzvXZG5N6
	wU/c9MhjG/9lof4S7vGT6BqDJfLwHgIZ3ddh6cXsjFnB5RHQ19xXefgn/TNQzpnHdhQ1BMb+gMs
	n+vJ8DYIxSbK3q3Dv1mgMJJnBa8xXlQ3HMlWJmMK3Ma88LL+br8pAYpAfWtA0mU2/P/r9E2e1Tc
	u/lFv/TdYVm91LOFEhaG5EyTT/hnwaWk9Bce4Z6OuVibdZNTv3SkTY86NiDg0EE1cHlv0zIUE//
	lwpCnJ2cyuxt5VCkSakH5sGdQNp+tMgz0LcU8Z8IK7yRWPRNEFeeAjqMW+lzYnGCpPrrgSsQ6iK
	0VBVwi81t8Q1n+Bdd5axDxXPHnXaSdpgQtIYn5+yskgwrfsC30tCKdnhB58vqq8s2MNhPCy5/tF
	Zu9S3Ku6xVHLhqfx33fj+sMArfMaMUyeC0staEkVAPr0TXS8
X-TMASE-XGENCLOUD: 2e8e3372-eaea-4259-b464-20b0bf1d8803-5-0-200-0
X-TM-Deliver-Signature: 5F5BD48B2D6A42411B9E431161DBB3BF
X-TM-Addin-Auth: PDHAE9iw/ghD2l/dLMZ9unjiYmg8irerrxyqKn9Wrr/gmqjRwH1+BDGqeEY
	wvRtMwXP6Fi6D7i8oGDodGcdPK0zXMvxWy97lfW8QlkB7n3zzuR1NlO+EF+XaVCw03IVVZWlS+E
	pXEelqaB4f2yGl4YMD0LDBJy6crGG3iUtV8XKe9+YklFqt1bbIhibFeamNt4EZvS5Tz33dYpnTT
	uBQBFpFwHNip7V6CAJ4ZKA7Xjy4IIIOLKxvhqn3cK2/LrCYWZVrjKKCCKw8U7kEggDFKZbuR8ob
	KU9JwitheRL65qg=.s4e8oNus8Xx1aKvN+Ups+QM0uGTPUE/UjV0JEYeLmgnFKHkO6sJ0KdhUDZ
	NSVQS/YExAXq8IZoEEiNvCi4IHrh/rGoFW9MCOwCbwicVdPvlsI4EhVfLVj/uClre7mdWs5AGFC
	fmviRAOxTT8Q9CWRG2k1z3YNkFM38zDMcHcekpSR6eyRGDw1L4yPiPalZeg7m55Of26mOd5D4tb
	d1TYZr9esdXUTY0EyawO+bcZwM9y8XzMudH57hHTR1uGAqqKNV34mH4x7YfyARVn0eU/+nTgA89
	mYSFcaNmEa7y0nlvcVsjN55FVffJl9jAgHqB7Jd5YPEE+EnVsRMvDTyHdbQ==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rtc: Add device
 specification.

On 17.04.23 13:49, Cornelia Huck wrote:
> On Mon, Mar 13 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>
>> This is a partial draft for a Real-Time Clock (RTC) device. The
>> virtio-rtc device provides information about current time through one or
>> more clocks.
>>
>> It is planned to add a timer/alarm feature as part of a draft spec
>> update.
>>
>> The draft uses the "Timer/Clock" device id which is already part of the
>> specification. This device id was registered a long time ago and should
>> be unused according to the author's information. The name "RTC" was
>> determined to be the best for a device which focuses on current time,
>> but is up to discussion.
>>
>> For this device, there is a prototypical Linux kernel driver for which
>> upstreaming is planned, and a proprietary device implementation.
>>
>> In the spec text, there is some redundancy between the informative and
>> the normative text. The intent is that the informative text already
>> gives all the essential information about the device.
>>
>> In the spec, clock ids are 64 bit wide to have unique ids when
>> supporting clock hot-plugging in the future.
>>
>> Any feedback is appreciated very much.
>>
>> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>> ---
>>  conformance.tex                         |   2 +
>>  content.tex                             |   3 +-
>>  device-types/rtc/description.tex        | 523 ++++++++++++++++++++++++
>>  device-types/rtc/device-conformance.tex |  10 +
>>  device-types/rtc/driver-conformance.tex |   9 +
>>  5 files changed, 546 insertions(+), 1 deletion(-)
>>  create mode 100644 device-types/rtc/description.tex
>>  create mode 100644 device-types/rtc/device-conformance.tex
>>  create mode 100644 device-types/rtc/driver-conformance.tex
>
> (...)
>
>> +VIRTIO_RTC_S_INVAL indicates that
>> +
>> +\begin{itemize}
>> +\item the driver request values are not allowed by the specification or
>
> Do we need to specify that, as such a driver would be non-conforming
> anyway?

I would still consider this helpful for error handling and diagnostic
purposes.

>
>> +\item the device read-only part of the message, or device write-only
>> +	part of the message, is too small.
>> +\end{itemize}
>> +
>> +VIRTIO_RTC_S_DEVERR indicates that the device encountered an error while
>> +executing the request, which could not be attributed to invalid input
>> +from the driver.
>
> Is there any way for the driver to find out whether the request has
> partially been executed, and whether it should retry?

Maybe this could be changed to say that

    ... the device did not execute the request due to an error which was
    not caused by invalid input from the driver.

As for retrying: Should there be an additional status code? IMHO this
would increase complexity without a clear benefit. Could the device not
retry internally if immediate retrying makes sense at the particular
point in time?

>
>> +
>> +All \field{reserved} fields are written as zero, and their value is
>> +ignored.
>> +
>> +The set of clocks does not change after feature negotiation completion,
>> +until device reset. The set of clocks should not change on device reset
>> +either (similar to negotiated features). Clock identifiers are
>> +zero-based, dense indices. All fields named \field{clock_id} contain
>> +clock identifiers.
>> +
>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_OK if the device successfully
>> +executed the request.
>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_UNSUPP if the device could not
>> +execute the specific request due to an implementation limitation.
>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
>> +of the \field{message_type} field which is neither described in this
>> +specification nor otherwise known to the implementation.
>
> Should any such implementation limitations be guarded via feature bits?
> I.e. can we drop _UNSUPP if we require features to be negotiated (and
> per-clock capabilites being clearly communicated)?
>

All new message types should be guarded by feature bits, of course. By
mistake, I added the `nor otherwise known to the implementation` suffix
to the requirement above; I will remove it.

What would dropping _UNSUPP mean? I think there should still be an error
status in this case, regardless of whether the driver was compliant or
not.

But I think I should change the spec draft so that there will be no
_UNSUPP statuses if both driver and device are compliant (and if the
driver does not choose to ignore the actual device capabilities). For
this, only one change should be required: Add a VIRTIO_RTC_M_CROSS_CAP
message, through which the driver can determine whether the device
supports cross-timestamping for a particular pair of clock and HW
counter.

(Also, the field name should read `msg_type`, not `message_type`.)

>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_UNSUPP for a request with a value
>> +of the \field{hw_counter} field which is neither described in this
>> +specification nor otherwise known to the implementation.
>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_NODEV if the \field{clock_id} field
>> +value supplied with the message request does not identify a clock.
>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_INVAL if the request values are not
>> +allowed by the specification and none of the previous requirements in
>> +this document stipulated another \field{status}.
>
> I think we can drop this (see above).
>

Again, I would still consider a non-OK status helpful for error handling
and diagnostic purposes.

>> +
>> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
>> +\field{status} field to VIRTIO_RTC_S_INVAL if the device read-only part
>> +of the message is too small.
>
> (...)
>
>> +\item[VIRTIO_RTC_M_CLOCK_CAP] discovers the capabilities of the clock
>> +identified by the \field{clock_id} field.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_M_CLOCK_CAP 0x1001 /* message type */
>> +
>> +struct virtio_rtc_req_clock_cap {
>> +	struct virtio_rtc_req_head head;
>> +	__u8 reserved[4];
>> +	__le64 clock_id;
>> +};
>> +
>> +struct virtio_rtc_resp_clock_cap {
>> +	struct virtio_rtc_resp_head head;
>> +	__le16 type;
>> +	__u8 reserved[10];
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{type} field identifies the clock type. A device provides
>> +zero or more clocks for a clock type. The following clock types are
>> +defined:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_CLOCK_UTC 0
>> +#define VIRTIO_RTC_CLOCK_TAI 1
>> +#define VIRTIO_RTC_CLOCK_MONO 2
>> +\end{lstlisting}
>> +
>> +VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
>> +standard. The device uses the time epoch of January 1, 1970, 00:00
>> +UTC. This is the same epoch as \emph{Unix time}.
>> +
>> +VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
>> +standard. The device uses the time epoch of January 1, 1970, 00:00
>> +TAI.
>> +
>> +VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
>> +subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
>> +epoch is before or during device reset.
>> +
>> +Additional clock types may be standardized in the future.
>> +Implementation-specific clock type definitions are not recommended and
>> +use a clock type id greater than or equal to 0xF000.
>
> Could this command return capabilities in addition to the type?
> E.g. indicate whether a clock supports cross-timestamping?

Yes. But cross-timestamping will typically only be requested by the
driver, and supported by the device, for specific HW counters. So I
think this would be better indicated with a new VIRTIO_RTC_M_CROSS_CAP
message (as discussed in the previous to last reply).

An additional `capabilities` field may be added with the next iteration
of the spec, which should add more features.

>
>> +
>> +\end{description}
>
> (...)
>
>> +\drivernormative{\paragraph}{readq Operation}{Device Types / RTC Device / Device Operation / readq Operation}
>> +
>> +The driver MUST put the request into the device-readable part of the
>> +readq message.
>> +
>> +The driver MUST allocate enough space for the response in the
>> +device-writable part of the readq message.
>> +
>> +If VIRTIO_RTC_F_READ_CROSS was not negotiated, the driver MUST NOT send
>> +the VIRTIO_RTC_M_READ_CROSS message.
>
> There seems to be some dislike for doubly-negated statements, what
> about:
>
> "The driver MUST negotiate VIRTIO_RTC_F_READ_CROSS before sending a
> VIRTIO_RTC_M_READ_CROSS message."
>

I will change the sentence as suggested. Thanks for the review!

> (...)
>
> Generally, looks reasonable to me, but I'm not that familiar with clocks
> and would appreciate if someone else took a look as well.
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

