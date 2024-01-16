Return-Path: <virtio-comment-return-8955-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B759FC4706C
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:06:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 24CA726A37
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:06:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F248F98667B
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 11:06:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D6397986591; Tue, 16 Jan 2024 11:06:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C73169865AA
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 11:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1705403209.186000
X-TM-MAIL-UUID: d4dce56b-ae79-4b74-bf6f-a127299237eb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVZ99i5zEbpJXhzyWfOdFG95i6A+Mq9ncVpTcrPXLZz4XSCIbKQ3kQ26q0xfnEwG/RyFgoKzPXC8yfXzGiKieuaF6HzZN7Hq99halQXQZFalpDVA63+dGlDiWkkjNmg1UttMGQpWpZkenV27XU/kKEIcwaJ6fecc5EMQEEFGfeaKwrmPdBfJVK7j6njPh3g+nUufbsPEbJitvjCV8ZRoG1w2YyJ59Z8g3O40XVPMoEJarhgbKIKtAfknUZL9lYIvUkAcav69rHqQGLeoll0PSN5NU/+jpLKvc30+Mo6QH2lfaKwcSXCcfzj+FcOoednUbe4N2IRrvi7b/ZjlV8MkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8x7hl9NcivUArFzzBk3sYSqfAWUxFv/K7Mzwo9lP9s=;
 b=ndNAZ0Z0QqE/bW5p2Cppqtuy1IetZZ+q6/9DXGfLrTEno6xl53XfHzJHHge5xcy3NwREl/pUp7MRP2h9ea0AiUgqmEqBTWotO4Z4C2+igatfYDdRhxubotPA2kVUXcG4QhE0tMFLqyhDJDex/cy0tGCFCrfHCw57lMn8TGAfHzou2CfgHaxTL7r9SWg90QdKkmdMyS2JZityt3ympr/Loo2QiieKi0X+iSBm9zsT8J6H268kSXHleGMHRdzRwvVtXEauC2ea3cH0TFt0k7s5vESq2PsmOPRrqZm3kT67QucfSlKprjztLSyDhQ4trvOVmD7VAa/IwE9AAdrdhda1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com>
Date: Tue, 16 Jan 2024 12:06:46 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <87wmt63w1l.fsf@redhat.com>
 <a284ed4f-9ca1-4b8a-8c79-beec5040bd6b@opensynergy.com>
 <87wmsamw1y.fsf@redhat.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <87wmsamw1y.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR0P281MB2335:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ec8583-20d8-4a15-17e2-08dc16833ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lfFo/AIPON5kL1b5bFSfYCzjeBLIzYDRe4u0j6PZE8vEYI4JNpqPG7UaZNg4RBzjlDqgZ2OsqXxOkLHay9hlBhXawFlEU6e6AU5B8nMAEZPDHIKj4E8ATvPO8iWKTST9MIKZCI5vpgjqLUpChew0poVsCpsI+8oaYqg839soRkBqAeU9hl/qQNHrcbyTavuM5MvZkoNV/MUPskQkcM/vwhaIGhB4h8BwT6dA+lKx5vPMItYzdnd4AbHvp/hrcdiJUUmkCEuaKCSFt9nD7S0JUsSDmEla/pPX0waIPeWwaXlRnX+ry61GMCNJ2dx5N8isLTH/2nkC0v8fyjZOSURvAwM94zjDt8xHuFnNY2yYonC8un72yV7fmpvM9bh8oS5Qf7SoRQ49fLfT4romKN2YzyTUrHzeMGdI50Aa78Vs8+HWYyNWKyZMUTSmx1JpsMc5A80XJIEWmPqnyI2bPp5XoVUUMJIMW5KRTujt1d5UE1C9e7E+NViFlVDUDFe9KX+L8CjbZWs0T/Xztp6iQHT7YXAeP4hUoAH2rsSMb/6DW5WGU+PDh51TrO+S0MCR1VXj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39840400004)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(36756003)(41300700001)(86362001)(31696002)(38100700002)(53546011)(54906003)(66476007)(66556008)(66946007)(42186006)(8936002)(8676002)(316002)(478600001)(83380400001)(5660300002)(4326008)(26005)(44832011)(2616005)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUU0MmF5RStNR2pzSHNPM0VnS2xCUEdiSDd5MXVmUjZqT2dTOWVoS3lZNXE3?=
 =?utf-8?B?Q09XNkZEODdLN0VENHB5dGJNVlFwYjBlNHRpTVEzUFRobHUwb3dOb29EK3h6?=
 =?utf-8?B?L244NDkzN0Y1MWVTZlRyY0x1U2duRjY5NjhZd0gxNHR3QXczWE9vcWI1Q3g5?=
 =?utf-8?B?Z0FRRjVzdlE2QmIwaDk4K1Z1b2VWSFN3d2d6SDhCV2srUkhOcDd0aExsbElz?=
 =?utf-8?B?Y1B4TjMzRWRDNHBGRmJzaGxSbDhJUjdZa0p1Sk42c2JPa29BZFNJTVRUQ0xW?=
 =?utf-8?B?c2xjY2VBSVNtbDBSMEUySWgyckZ2Wjh2U2k5bGRjWDZjWjJHbGUvc3JGS2ox?=
 =?utf-8?B?VEJLZC90dHJvUDh3UHBtN2VoRVZYZEhCM0RYY3F6cGR5VzJ4dVpTL2hUL0NE?=
 =?utf-8?B?cFVpeVVpMU43SllHUUpkUFk4NFRNMjFxcDRlMjMvK1JlWGJ5WFY0Rm9kYytF?=
 =?utf-8?B?WTFGOE1sNFh3S0NDOEhRZThPMlR1OU42bGpEcE5UVE5XaWRHMTVxKzNoWWFP?=
 =?utf-8?B?MjNSQmJqVHRCeENldHFNZmVYN2tHZlI5Y2lGVEJEcC83bGNmQU1CTnphK0xH?=
 =?utf-8?B?b2twUU55UERLUHdyYnYvd0dvSXBmZml2R3A3MXFtc0ZUT2Z0SkFQVE5hUlor?=
 =?utf-8?B?M2RhWERkOCtmY0tuemtkU0pIMFhJTFlaSnRCZUs5Vjc0YmZBeTRyQnNKaCsy?=
 =?utf-8?B?UXlKQ0l3YTNJL0ZmQ1hNNGIyWmpmN25lcjVGK2NLWTI0bjBlMUFkcWRwR3Zp?=
 =?utf-8?B?bnJOVG1jbjc5bUV5VFpxT1ROOXgvKzFWd2s1Tis4bmZMSXhpd2xESHRjSUtL?=
 =?utf-8?B?b09KQkRQRUNJRDgzUVhYdTRFVmlodnRoRkM4OFlhUU1YTnYzUXZOU0xsZVFx?=
 =?utf-8?B?U3NVK01SQTRxbmphRTB6bjA5T01zV01RRU5hV0cyU2Yvb0U5Yk91ekZsUjJN?=
 =?utf-8?B?ZlV5Y2V5UDgxZWN5Y1N6bXNDSlZmL3V3UmJNZEtBRThsY0VsUWJEN0VDWXgr?=
 =?utf-8?B?TXFCUnJMd3J6T1VVTVBlMlJadHZYTGxTMVhyR1hJVUdhc2swTFRaZmZtT0Zk?=
 =?utf-8?B?Z0JKY0UwRitDS2tzN0w5a0dqaTB4ZTYzWHN2OVlEdTFXYVlyRERiZzlyT2w2?=
 =?utf-8?B?a2Zld25jRlo1WS9wT2Y3YjI5azd2ZkUrdTFDVnRIWDJUWWRBVjJLcFFkK2Zt?=
 =?utf-8?B?UGhVTFpZcVArd0lKWCtzVmV2V1p5N1Z5VmloWnNGRjU1YnhET2txUUpHQWtQ?=
 =?utf-8?B?WTFzdExZeDVkcDN4UEZlbHlaRmpNYllJejNoWmMxcnNTODArTkhPSWpWNUs2?=
 =?utf-8?B?STUzKytJdy9mbG5RWm94SkVVQ1hFVHdaa2RCRW9NbFJRZEFadHVXd0dVelZl?=
 =?utf-8?B?UWdMVGpmV29jWXlqRFRKVUJpSDhTOXA1QUx5aG1Uekoxc1NEM1lVZURyQ3c2?=
 =?utf-8?B?a213TDQ2K3Y2YXJxbzNqMGZ6b3RocHFIUnB2SGpYc21pMUFJb2dLK2N2Y29F?=
 =?utf-8?B?VmMrQXFBR3l3dE01SzM1S09vVjlhZm1SaXNNcFJqV2M0emI2WnQxc05EekJU?=
 =?utf-8?B?UE5qdW4xbkNiV3haV1ZSNTEyRS9lZmoxRGRYL0ZqL3dkS1d2L0h3cTdjTHl5?=
 =?utf-8?B?R2htTmdvK2QwelZ4YjRjSkIrMmlORldONVpEUk1IT3R5bjRpNEJlTDZuQmxT?=
 =?utf-8?B?QkRCQkdveHB3UW16QnFHdTlsb05RZ0RjblljdDczYUliOU1QNmFBZUNvU3dJ?=
 =?utf-8?B?TEdBWXI4TWM4OHVkdUQ4cTQ2ajR2VjI2VWZGRlkzSWtIU2VpRWRjQXN1SS9o?=
 =?utf-8?B?b0dyNmJQUnlrR3Nrbm45Q05FL2lLR1lxWUVobFVFNUZYZmp3amJ2VUJtOHIy?=
 =?utf-8?B?U2JoUENTZloxTW5UMXQzMXhsMEl3N2xjeS94TmdDUlUyQ1lkRWQrYld3dHlZ?=
 =?utf-8?B?aGV5LzgybXViQk85bnVwNmsrY05ZTWxVZmkxZnhGMkQ2NFVjbVkwYktKZDNY?=
 =?utf-8?B?bG90bk5XNFRiNkM4QkoxNlhNNW9BcjJsTmNDb1daeWxPTkV6bGdYdUNXRkQ5?=
 =?utf-8?B?dVdwc0pvVFpDTVhRdS9CR1ZmZkR2aDZKczQrUHpORTljNG00YVVZSFBwWGp5?=
 =?utf-8?Q?vVZcJAF2Xlbwq8A5pd/Y7fOcu?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ec8583-20d8-4a15-17e2-08dc16833ba5
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 11:06:47.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1fOoyWufm2wT9Lwg//L6zGxOtj4JibqB5d1B6O3yRDE6UohiI7P+6asDSLbNNSrwXqg4nfLHVOTRtvitLfyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2335
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28122.007
X-TMASE-Result: 10--12.500400-4.000000
X-TMASE-MatchedRID: C/snMIRQLS35ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK9i+/f9tLGG+R5
	pI4Y+w3PsRle9BeadcNh/hSyPxRTdu7cQoOH30eiITytpp/jrEyHjXoKyXN5xuTyjZldzR9GJQk
	txNYzOLNcfKlz8KPRQgv2Ir6I906fcfF9xsCM5pkdcDzNgmJ4TVhAFa9hyLt2eDAmjlAyxX10WA
	VqU51ca4p4x4ItJVyQFKxWp75G8jKgRE2f7HLcWZ1hE3UvZVrYkWAvDGk/cOHUowdNeXQLB/vWe
	4croRVdvHFGdtaoMpd4IKuko5+988Ha0wSYk9AG4EfJdkIZsepFcJSuEK7lY6E5mnw5NFcUjUbH
	KinL4HB1Uwwx8pF0lasHux8CHncsHmQ2bIx3aOIlQx76zly9ozsagavr4+KJagU9hBAOHM+aNT0
	a+RcKeKZLbrmGih+GggtK2c3VGnpp5LVm+3vYv0I9AEPfED/do4NJa7SjFsoNof8VS2Ruh07zkl
	yhPTD9YIyQM4JfnWk0zI7+eiZZ8EJnvIQwtoFg4ppQorDWtl9AGNIPzzkX1vHdmXcE/yiLb4vV8
	qb/rIg=
X-TMASE-XGENCLOUD: bf86d97a-8e39-4a65-b23a-a5dca7744ee7-0-0-200-0
X-TM-Deliver-Signature: B25EE63160CB1AEDC51F16A532AC506A
X-TM-Addin-Auth: cRQiC7M8e5++f3fVd+QFMw/yEPpD7BKGl2TfCcnC0LMJBc51KmCieo/4RGA
	+GDJkLmwPWLXtzFbtjry1+U2hQES6dB8a4sjFxBeEbuoVfZ6ocgxQWRsmCs5wJFUvIFWOMq7UDl
	jvpfs1Tf2nTldYp1xaIC7V49OfS+Ikf2j41X50bcfcfKltCAa1zIaMuo10nTjYLlSB2ll3IQqYr
	u3aAyY8eKA03HYBQpEAvccX8REfopgoP33bONC47A1IQkFXam4kmZ/IrnR9klpQtyTEozBZaXTj
	iCOBL8IyekJi0wk=.ogGQiP8aWB31lk2L4GAtyLTuOM35eqcw81zARwvHJ7fp4mGUopfNbfAOj1
	rxVr9ScqTh9NJdWT61Bi5ZIE1oaVTbENAFo7ciPT6NxnaDEWPRCUzeq92Zh5FZTwVrBEzHp6Jfl
	3GTLrxI3F+Hp3gq6eIyyEpI/Tz/5zwjgIFW3kehi7FMBeYGXM8tG2P7Bv71L8SCrdFYCEZUE940
	GT+SoBWm0IECU6ef7J0eUgUr2rG0O0kon5l3p/WYKRIQw3B9tszkUJHYU1LJM7QOUkA6AGKUUd9
	GV7ay7ex2UHO8JREij/ZiAjmTReAOWgnQRgi8YD5YC/56mWHMVFp53KRkig==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On 15.01.24 16:54, Cornelia Huck wrote:
> On Thu, Jan 11 2024, Peter Hilber <peter.hilber@opensynergy.com> wrote:
> 
>> On 22.12.23 19:57, Cornelia Huck wrote:
>>> On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>>>
>>>> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>>>>
>>>> The intended use case is: A driver needs to react when an alarm time has
>>>> been reached, but the driver may be in a sleep state or powered off at
>>>> alarm time. The alarm feature can resume and notify the driver in this
>>>> case. Alarms may be retained across device resets (including reset on
>>>> boot).
>>>
>>> Does the driver have some kind of control or information about whether
>>> alarms are retained? I.e. to start with a clean slate, if wanted.
>>
>> As of now, the driver can disable the alarm through
>> VIRTIO_RTC_REQ_SET_ALARM_ENABLED. If the driver does this before making
>> buffers available to the alarmq, the device behaves like starting with a
>> clean slate, with two exceptions:
>>
>> - VIRTIO_RTC_REQ_READ_ALARM might return a different alarm time than the
>>   one at the first reset (but the alarm would be disabled).
>>
>>   If adding the minimum allowed alarm time to the spec, as was discussed in
>>   the "Open Questions" section of the patch, initializing to the minimum
>>   allowed alarm time could also become part of the "clean slate", so that
>>   this exception would be removed.
> 
> Makes sense to me.
> 
>>
>> - The requirements currently allow a "grace period" after disabling through
>>   VIRTIO_RTC_REQ_SET_ALARM_ENABLED, during which the device could still
>>   give the alarm notification, or execute custom alarm actions.
>>
>>   The draft spec permits alarm actions to continue for a short time after
>>   the alarm has become obsolete, in order to not unnecessarily restrict
>>   implementations. While I would not consider a sporadic-looking alarm
>>   notification (which the driver can easily recognize as such) to be a
>>   problem, the spec does not require to immediately cancel an obsolete
>>   custom alarm action either.
>>
>>   But the requirements could be tightened so that all the actions have to
>>   be completed or canceled before the device marks
>>   VIRTIO_RTC_REQ_SET_ALARM_ENABLED as used:
>>
>>       If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
>>       VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
>>       serving any previous alarm expiration event for C before the device
>>       marks the message as used.
>>
>>   This would remove the second exception.
> 
> This makes sense to me as well.
> 
>>
>> I think I will just do the two above changes, if nobody objects.
> 
> Maybe also add a sentence that describes what the driver needs to do if
> it doesn't want to get existing alarms? That might make things easier
> for people who wish to write a driver, even if all of the needed
> information can already be found in the spec.
> 

I will add a corresponding remark.

Thanks for the suggestion,

Peter

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

