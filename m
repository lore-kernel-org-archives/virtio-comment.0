Return-Path: <virtio-comment-return-8903-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716D2C4707B
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8969C217AB
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 814C09866FF
	for <virtio-comment@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 75FC79866A3; Thu, 11 Jan 2024 11:43:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 619C29866C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 Jan 2024 11:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1704973408.155000
X-TM-MAIL-UUID: 82f83f28-d11b-41b9-ae5e-7a78bdc49bc1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuTCF1g7HcupOhg/gUJAIvK0A/bzafBJoWIpYZlRD/QxpZzpImis54j01IAaLdppElstr6mgXK7OHpUknNBnKr8RDQMttJVTMSoXeUA6SyFHUBqjpeTbEVGjpZZvWry3Y8ui8zDyMd3kGllbeTdeziyB9T84Ecjca8GCmkNYXAp2SxVWw0Ojjr4rVJq1hG7JWfUuctMKh8j8Caajcd2q0ylFgJXTFW1j56HDf+kaFEQsstCB4FVyz6c/bml4iV8RxgXgYl7ibGtotze3lUhLdjsVoQINCuYOxzWnwClqCOEuwe2zlsYMVIcDsJT7an0Eb+iH5pYm58VnKNK2sgJVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSQ57bbHbKmtS23NxjGPDug+j+iv/aDwvc9LY8N5JLE=;
 b=dtmAAK5MyQnOFT9BiuzyI+71YUAEI/WTqx5Ysc7cxQfGC1NC8oL7eYhcN0fiwLgEdYFyAU2pMpeBG7tqNUETc63HTBmeWFndvIG0U+JHc6xF5Rd0/YMl5cahq2sdLHxE5eyfGUumjF44qf2LTfWKVgOw7KfmrZkMZWE5ir54HtnE6FIdhoTwLZBRhrAv5TlozrbpIB83lSm1XHPWoHmbJsMoyAVEeBsfFn1tKmQb5eiIzSGTuRbQ91g+FnUsT4g2F7o0DkaognWz5FX5j+q7VtURTocFlV4VDgY8/nozKRaUo9fdeVUaao5A3FqMt6ns77ai3kIu7r9yt+kSVD/yxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <d141531e-635e-48ae-a4dd-eea3b2e7fa6e@opensynergy.com>
Date: Thu, 11 Jan 2024 12:43:27 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-4-peter.hilber@opensynergy.com>
 <87wmt63w1l.fsf@redhat.com>
 <CACGkMEtCc9n94WCmsPBA2NOMbuXmq9b-M6J02CO9884_5q0nkA@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <CACGkMEtCc9n94WCmsPBA2NOMbuXmq9b-M6J02CO9884_5q0nkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB2370:EE_
X-MS-Office365-Filtering-Correlation-Id: 784d25b9-b083-45fd-d397-08dc129a869b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UjuTPFsvzNzQHaePAtwLwrXuOAMmprfZZvHWklkec3/Mp9Tku5mCcUzcvAqTgWS0OY2hgtwxywqEMd6MiNHc8ctHw2B+7L+gtn/MXLV0aGmkoJ1V7Qlkv16J84ridtHPU0GfkCoryFztYX7WdIlCl2SlfOS2wHXKp0//GXMVjOoZ5aGXUBg9Q3sUVutktIgT8zonbbgOAbm2qW2JZrP5bl960TejzjmL6czCzNlfbg68c2ErcmzX4hk3VZ43KeQzALR4/M7czi1BgrlsaVm4gwcs7Fpm0OPIb9nH08vxD3+KjImmpfpK5wqZLSRNfiCSslSp0JrEaCuFvevynpzgiS4i0YiEak8FLCwoYqXwwn18xBLPxe40EQJk/mzb6rYVQcIZZUSDy1jNutA809jzAkGD/IT6YYjmBhqzu5iMcbuWf0vXhVia6QRUIxRtVYxnpZktt2styRnEE4tSeBDTjsESJ8ajYAD7Dl17Ht7ORL/Kp/l63BKOeDnciH+t3Pd5YyIyz/ti8Z/6sNiN2iK7hBShgxLsdyy1cY/Mjzv134GDQnIGysujmqoOMImr7dobpJHg5XxsS/gN0VChiI3mTtdgO4tgPQKfqGF1M6fhZX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(2906002)(110136005)(26005)(31686004)(44832011)(8676002)(4326008)(2616005)(8936002)(5660300002)(478600001)(36756003)(31696002)(86362001)(66556008)(83380400001)(66946007)(66476007)(42186006)(316002)(41300700001)(53546011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTR0U3ZWRDlQb214M3dDZ2JwakJUdDcxK2RMcGhVZU16aVVJMUhkbml6WGg3?=
 =?utf-8?B?RHlNMUJ0WkVpdFRnNlVjb01pOXFLWlNVT3BDMEx3czZoVzJYT3FaTFF6UFR6?=
 =?utf-8?B?NHBYWUtIbFNmb0FCVHhsSGh5UGNOUEd5MmprRjQzaWRyMjJpblRvRVY5dXlH?=
 =?utf-8?B?YTBhVElUN1FwQWw3ODZlMmh0bG82aVUwY3dWaGR6UzgyUC9yN3FjaFdIcERm?=
 =?utf-8?B?Njh6c2VobUxFUE9SNXQ1NjlMNEQrU2dPY0UxcGg2cTJGbWt5TkZzcE94QVRi?=
 =?utf-8?B?U1c5OWxSM205Mlpqb3RBWmRyQklJTlhFbkY1L3ZoOUdBM3dSa1dRQWRSOUdJ?=
 =?utf-8?B?QUlUOW83MzJ1cHg1alFEd2lnU3hBMDRKSGxOZVBaa1E4SWJtdDE0NVNOSDFQ?=
 =?utf-8?B?NFRILzBnUFd4dm9VTTNhMTZQRmpGbzZ3RWphTjdWbFkxTFRiL0RmbFU5RkhP?=
 =?utf-8?B?K2haZDVEWGJDVWNFQTk4aktwZTkwNXlpN3hkNTBPV1ZUSERLUmczbHZGSTRH?=
 =?utf-8?B?Y25TV2J6RDRSZWlTd05FVkE2MDZSbVY0akw4UWdrdWtoOHB0dUJ6STVkVUYy?=
 =?utf-8?B?cnVPSnpzclJlenp0U3dNM0REVTZoUHBRWVY5bE5UU1VEeWQxNnRaY3JiTFZO?=
 =?utf-8?B?bkl0aGtpcUx4NU5uWmdTb0tNRUc3T0VwYVp2MWZMVGlKdG4yeXh1UjZsamds?=
 =?utf-8?B?N0NSODlreTFmTGp0S01vV1NlUGRIQlhua0tPNmN2RWFoMnd6SE9OYWhOczVH?=
 =?utf-8?B?TkJFMFJxamVIYXN0WStUVldhOXdXS0xnTjZ2bUFDV1psTUNCYmxCN0F5ajBX?=
 =?utf-8?B?VDhhY0RZek94ekg5amUxY0kxemxLdjFRVkQ3YWlyd1ZVeWt5U0w4cURKRVhz?=
 =?utf-8?B?dGYwMDl0cFYyTFpNZFBpY29IV0VXQWk4andJL3dNVExaNU1kM2Rua20yZHFQ?=
 =?utf-8?B?VCt5QjBVaWcybDllRHRiMEs3bjJXRHlBV2tBb2xLV0IzaEJNcGcwK3Z1NzhR?=
 =?utf-8?B?UjkvdGlNVHlZempraFhXeU5IWVFvOUx6cFJJemQyS1hOakFKZERDSXlSdlpv?=
 =?utf-8?B?blZFQVdKdnIvTzlQLytmY2VXbG4zZlpMdXpwei9ubzg2RzNxZFYrSlo0L2Va?=
 =?utf-8?B?UVRkZVlYNUdCeFcxaXZWYTBNT29xTHdkRkNhQVFQRlhrRVhDdldlVHZmbldj?=
 =?utf-8?B?MEgxTmZrNXVOS2E5R004ejFMTWthMzhrcnEzd1crZDJud2ZES0F5b2gzdTcr?=
 =?utf-8?B?ZHJGQXJFaDVjZmNnK3JDUmVoelJVTHdsRVJuMTQ0YThjMXk5MGpXcXZnWmhh?=
 =?utf-8?B?aFpvYnJWc1ZiSnY2ZGtUTkl4emFmTnp5QktxdFJncm9LVE9MWnpycmdhMkNI?=
 =?utf-8?B?bm9uMC9LZTZiOU84bEZYQkFjM3c2SC9wVEZKREk3UUJ0WWdCL1JFL1M0RXRs?=
 =?utf-8?B?OHRnZWZ5U2w3MHNVR29BOEVrMlU0MzNXTFZEdkY3Y2ZMN1JSRnJlZ3VwSVRk?=
 =?utf-8?B?VjJFSlpHWVRodnZzVTJvdzJBRTlBUmpBWElHNmV2cy9zbVRWK1lBVjVjVVhQ?=
 =?utf-8?B?MW8wWHRKQkNDVzNQSjU3dzNUdmNISkFRL2xFSHFiOEdOMGhuOUxWWS81SjdV?=
 =?utf-8?B?V1MxeHVSM3RrbGYrNUJMdjFXSkY5dG5RTElRODdPbnJoeEtMUEZmcTZNcVlj?=
 =?utf-8?B?ek9FYWtSTVFxWjFmdmpvb1I3OFFyNUtQYXA3WlBRcmxxSW5sOTZsTDNOWUpL?=
 =?utf-8?B?c090US9VUHh2UUVqRXZGeFFzMHJuc09VREVxU3NGZnEyL0p4UU13ZnRXSzdz?=
 =?utf-8?B?SkZkNkVVMzd1NllvTEdSNWw0bXdrWWo2cFFGWHAvbDZnQVpKc2JJdjl2UlFR?=
 =?utf-8?B?akcyVkcvRUdLRXdpZytWNWVZeDRBNXRCeTBJbE84R1BpOFlITngrSUZYOGxx?=
 =?utf-8?B?TmNaY0hHWlZBOEowK3E0VTBUSGZoSHFGZzJWVGZGUFN0TEJTeTkyekxDS0Nw?=
 =?utf-8?B?MTdKYm1qVUJIWFVJcDFuUVRhbnBtTmMvUzdscW5GemxGWE1LdXA1b1NLRWx0?=
 =?utf-8?B?SXluMW5XSDByRFliOTBSb0RYd2F0UmJRczdFWlYzb1hVMmJyV1YvSTEwVEJR?=
 =?utf-8?Q?foE8HuaK5S4GTMsFXLywSErOl?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784d25b9-b083-45fd-d397-08dc129a869b
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 11:43:27.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toN8qMV5dLy76PcA2qcbSZLS0nstxRt8no2bxy2+R9qigZiVpc+loOJOATfUvj6y0GSuORc2sTLmAOiYRENooA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2370
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28112.006
X-TMASE-Result: 10--12.326100-4.000000
X-TMASE-MatchedRID: QW5G6BKkLTr5ETspAEX/ngw4DIWv1jSVbU+XbFYs1xK9i+/f9tLGG+R5
	pI4Y+w3PsRle9BeadcNh/hSyPxRTdu7cQoOH30eiITytpp/jrEyHjXoKyXN5xuTyjZldzR9GJQk
	txNYzOLNcfKlz8KPRQgv2Ir6I906fcfF9xsCM5pkJ9830SX03A14hokZSGr/J5TQA00qx4JWfNe
	3CI663SxOpYVwUHMq1R+qepGrpBvCOQ93bXIg99nlrH/TkKCsRN0X64jGy2dar+T68C5Nr709AU
	WTSPmMGwDaIN9ul/L7VzTgENjEoti1i3WRyj1AdOfEmq6feyfNuRXh7bFKB7gL5uFw8a0lnM6X9
	pUTrI117jfySBQLzCYGdPFkbyROEvuvB6gAgryg=
X-TMASE-XGENCLOUD: 10fd3b72-bdd7-4672-9b37-c590f8fc9fe6-0-0-200-0
X-TM-Deliver-Signature: 19F5F4898653515662542255CEC19721
X-TM-Addin-Auth: cYD8xYcqKBhAgIr8tnK3uCQS5Zf76iiue3e0hBaYnRcGTu8lMU1zxvkZm53
	LRoU7uXd4ESivSG0U0u6wG/GjCZuBWx7zacEXIiXJf6dzdv5KSwQq32/lvHj5qwtU2PPWjn/G62
	qJJYga9bi6nq9hc1zERJnDpZjK9HC4vJk/ppv5MDNKSWR5wpSAHzTU6olqKr1YNKGKrMP2V20V6
	5rVe7O/30OWzOs7uKDqPNAxq4xmK+z6wdZWB+eIayKKSooi4pplAcWwArO+rUUwrXZBCuQFsHYm
	6A+qEwAp/clNhQ8=.uwcs1RxPJ+SgRs8Y1qkrAD3nUfB1LI0rbcUDgNkLk9cZgunCktsiqYqRwK
	eH5IGmfVpgi3umnUu4qmZTCkVIoVpNvotOxUxIvWA2ZG9zvIxxCu7T/9CLWwE1xplpr6JE3v2Ke
	Xnp4d2AVaNH2e9d92GDUBk0O17tKGYko72PcDiKkUsv4Uji3Ry7pb5UdI4h+PG5RKrKOYMsvuMY
	7ExAdr8TaNJWn2HgF4oXzXhr5Dud2W38CNxXQnZ1nUDBzIATrGQrwO61a9jjmuduABrDp93vTCx
	S0nFWiTWD+H+IwbUbA5aEraXYW0pOstssM3M6M3Z+ICOwwZcyzbhblFKzcw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v3 3/4] virtio-rtc: Add alarm feature

On 25.12.23 05:18, Jason Wang wrote:
> On Sat, Dec 23, 2023 at 2:57 AM Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Mon, Dec 18 2023, Peter Hilber <peter.hilber@opensynergy.com> wrote:
>>
>>> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
>>>
>>> The intended use case is: A driver needs to react when an alarm time has
>>> been reached, but the driver may be in a sleep state or powered off at
>>> alarm time. The alarm feature can resume and notify the driver in this
>>> case. Alarms may be retained across device resets (including reset on
>>> boot).
>>
>> Does the driver have some kind of control or information about whether
>> alarms are retained? I.e. to start with a clean slate, if wanted.
> 
> It might be otherwise we may have security implications?
> 
> Userspace driver set the alarm, and the device was shifted to kernel
> driver which may get this alarm accidentally?

As per my answer to Cornelia's comment, a driver could avoid getting such
an alarm (at least after tightening the spec a bit).

I can also add a requirement that the driver should, on an alarm
notification, read the virtio-rtc clock, to avoid misinterpretation (also
due to race conditions such as when setting a new alarm time while the old
is about to expire).

Thanks for the comment,

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

