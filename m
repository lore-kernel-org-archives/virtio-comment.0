Return-Path: <virtio-comment-return-9094-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15F7C4828F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:57:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 16F8E2B06F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:57:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 072279868EA
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:57:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE74E9841A5; Thu,  8 Feb 2024 11:57:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E16A99868E6
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Feb 2024 11:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1707393466.934000
X-TM-MAIL-UUID: 1bc2746d-4641-4bec-b266-0699226e4d23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=affkbtwa732IsuyH1XXqVekns+zHTYSLrbA4yRlD1GkmqFeLd6FO2CtBsmdRuv2iX78JHFj/LkP10cU1QArENOjPzsa3tmOd5sBi560j3Ul8xYSo92hs9gjLUXls+pmoYezwwYiOrzGPb5yBv6CfvXn6yNqndSnA97BUzEZn7Zl8eeYjLjdoR9M9Um7Ox6dr3tcIZj06kgCJ4kRHIN6ffhuAUGz1+USDq0I05USUd71vF3iuVo3TTxRIHjz4OLAVpBNYjnW9iJ1bOhNQdPJrGXNbtp5B41n1jiJuIsqSslAo46YzvxM9MU0W6HDAZ8fihe0V8qmvtTMae2Vz9pzfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb79P4fA/N9i8CdweiVedVHWLP3cdSyg6Cf3AcQAX/w=;
 b=i8XJvqZyWj79P0bmSifVqKuIjsy7xFGlALyXmRfxWJk5UMcXlnt++dJ5kJ4Efd772YQt/ukxhlvMApVT9g3PhD5hKepYjBu9UACWuTA0cbqc/ssj5eK+8b+Qrqk2YgJkntldhPGEYTzKvWGllKgViUUhf5J0lM5nA5l0UyT46Ke5axBhCmSst8ElnqlTxdJhBM+VLmANdDP69sFq1aIENhu5BFY+VrC9i0L/UXDLZVbEUExYHsbVjYY4+lIHCBZtJmpD2t4016tFzeGdc9Gj17HZ8+zhoklhwfpl2WnAbANKlGiR9TaUSWXC9oukWz1KgDdj21trE9fnOIB5v45aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <4e39177c-7bdb-4754-a170-5edbb89002e1@opensynergy.com>
Date: Thu, 8 Feb 2024 12:57:40 +0100
From: Peter Hilber <peter.hilber@opensynergy.com>
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-2-peter.hilber@opensynergy.com>
 <DM8PR12MB548058D48443B3B0A89DF05DDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
 <810765b7-db87-4854-98c5-3a6cf43b955c@opensynergy.com>
 <PH0PR12MB54812D669FC7B1EA9EB58360DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <PH0PR12MB54812D669FC7B1EA9EB58360DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::13) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|FR0P281MB2954:EE_
X-MS-Office365-Filtering-Correlation-Id: 304b4738-0973-4ab1-8e7c-08dc289d273b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sqytQioPU+aFrS1y3Qnuu1FirlyW8bzMj3YxXfwHlvSCw66kMXkpbXDkEaHuFn3qCSpQp+pwhe4a9LAl0kSPlHJPrz7bD2TqM5ODZRvykbeJiL7bsLFxK3wFFtz6yZ2OAu8DxQ0C9qgO+dGqgnQncTWvfWdQmdiX+pBZQMitIYpihOWrnBDI1cp07SerokT9i3LNb31JywlShIl37NIWVCFZn85Tt7NEglxLH0iyqI64FaW/RRXffYySvsH6BjKPDr141A28mbPdqVLFs45jUycqVn4feeCx76hlLzLTbI66qcs6681NYMT+taRLWZN112Z6XAdMVnS7mK7I6vrfXIOY9KOIz+wsprVdBY4g7f8S7g1AS45wayf81zvRkw6sRPEyJ2LjjGy69tTf/7DfGqmMLDTpW9l9QqTdP81Kzt1z4Kc79WVW657tEbPZNhH1VtipuDblS6IT0ePbSTkjo2xWEicYKRKyhVS84VyAFZ8GAyH+j5p4Vm9qOUgDo6KcVYlD5zPBi2N4Adqlo8wiVjyp/FH4pTB8M38iEizx2MO1C7OVOXlawHvOCraGQo33ommTTs+Rw5duCVyK6LPtNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39840400004)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(36756003)(66899024)(41300700001)(31686004)(31696002)(110136005)(44832011)(66476007)(66946007)(66556008)(316002)(42186006)(86362001)(5660300002)(8936002)(4326008)(8676002)(38100700002)(478600001)(2616005)(53546011)(30864003)(83380400001)(2906002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdxb1lIcXhNVTJ0cXQ2ZGpyZVJrVW9WTHpqR295bmdUZzV4UGJtTGYxMjFW?=
 =?utf-8?B?SkVIVjg2VTV4ZkJhRTl3cytZVUgrRGczKzNYQXBLYkVCR3lzYisveGM1NXVM?=
 =?utf-8?B?a0E5MWFPNkttREcvQWlMMHdGQkFISkc3MGx2RVQ2SVJuMVFsMTN4R2NTV0FU?=
 =?utf-8?B?c1VlT2gxdmtWaE1pWkI1Vmt2RDl1Qmg3WncvbitNb1Q3ZVVzdEhTYmV4bmJu?=
 =?utf-8?B?bkhiVFhCN1h0emJqNXRibko5ZmJOd3RxbGVCamo3Vk0rUm42L0FRZ2FOVW85?=
 =?utf-8?B?eW1Ebml4U3lrWk1taUJoeE10RHk1N21yQnhXYjN2d1NqWVFaTW83VlJwZGll?=
 =?utf-8?B?RHNvNW9LRVhhWVhqSGlJbDdsYzEwRjBNNngwMDA2emZkMDdJMkp2WWdob2tT?=
 =?utf-8?B?Q0k3MEJhNGdsWVdzVWxyaW1wb3JQZkZaUFQxU1lDR0hJdDJhRjBwTkQxbEdM?=
 =?utf-8?B?U0pLY2hNa1duTFB3WHAxb0t4RCtPeGQ1SDVkQ2xnMktiaHIvUzNSYnd2emNj?=
 =?utf-8?B?UzhHKzJZUStIZzhqZ3ZVMW93bjE4c0VhQVB5Rk8xblZiYXMxYUJVb0NHZ2sr?=
 =?utf-8?B?MEkxbC8yYXowa1VoeldndUJ5K0hGZ2haMExBSzBVay9Pd3NMRGdRbUhaS2gy?=
 =?utf-8?B?MzRESTBMTzVQQXdDaU9uQ1pRRm82Q1F6RUlmOWlrcExOdVhwK0lVZjZwNXFj?=
 =?utf-8?B?UTdDSnZqWGlnQTNBWDNxYTdtTkd2UEpoaVloTlRFMFgvSHM0aG1kY3VJYTUw?=
 =?utf-8?B?ZlIxUldnSGozOTBMTWFnc252QkN2Uk9kSmVjYUMxbDZlV0FianBGR0QxOFJC?=
 =?utf-8?B?NHg0SlducENOdjhwVCtIenRWenVjcDZXeEpzRWZYQm44bkovaEVmc2sybEdE?=
 =?utf-8?B?ZWRVOGF2NkNtZ040YjBuVm5qUFVaY1Iwc3h4NFhjZVBocFJ3OHNhQ0tzb2tL?=
 =?utf-8?B?cHRSZ21wZXVLZE4xMm54ZzFvbHVzeER0MXBTUXhNYWJaV3lUYU1ueGVKWVd4?=
 =?utf-8?B?Y1BJMnZWTkxMNEdiSkpNQmg4Z0dud0RYWEZtMmR0SC9zQXppTHdMYjVXU3hG?=
 =?utf-8?B?RGNTWFdvL2xqOGxIRitveStLVFpiSTJabkplUDRwNWMxMTZDZlZnS2dRMkJh?=
 =?utf-8?B?M2dZbWE4czlDYk8wMDM2aWZnUkp0LzFGUVJYRlFwM3E5dHFjODhGdXRETm1Y?=
 =?utf-8?B?RmhhNzdLNGIrNWNrYlpEd3czMm5BYm5nN0VPL3BTUG1xOFFMbG9KL1gyQ01V?=
 =?utf-8?B?dU9lZXEwTFlVK3FyNVlLbUtqN0ZFS1BNVHpVRzliWW9LZTdqK092WFZncm5R?=
 =?utf-8?B?MnZpR1pNaGdBRFVQbFdLbVY0LzhNMmV2Mkt4SDBkUVBwMU9Bbkw1QlJBckFK?=
 =?utf-8?B?SHRPMlRXTitpUmI1MitLN2s0UTZCUFhBOVI1Qi84UmlwOGdIOUQxbHlDc25N?=
 =?utf-8?B?Zkp3L3prdTJUTENyQzZGY0w5czR6eGJmSUhhTXJGcWxMYndBWVpCcFhYKzBL?=
 =?utf-8?B?WU1PNjJkOXhQVktOakVSOXREc3FPS0FwODZKL2x4d0xmcGVOcmNxdGFZeFpa?=
 =?utf-8?B?NWdRVkRXTjJNLzJPS1ZyMU96ajZTRlg2K1Y0OGNIRFh5andOUjFpbkM1dG56?=
 =?utf-8?B?K3d2SHo1d1hhTEhmUmhaaTI1SUEzSWZQV2NtNmhYZ3VzNC9LQm5ieTlZbWxX?=
 =?utf-8?B?aDRnWXlScWt4MUt6SERJL0ZhOStPdW5mcSsxZ0UzdWp0UXovVUpqTHlHZDNH?=
 =?utf-8?B?YW85NDMra3lWcktoWUhHNDhlaXZ6N1VEbjEyaHcwN1FzdzlHUkZDampoN0VO?=
 =?utf-8?B?bkRtRXNRWlQwamJEdFQweDdRY0hsWTVRWXVIQ1pLZFFkUm5hN3pvMkpEOUIx?=
 =?utf-8?B?YnE1eTNvUklWK0J5UmlOZXhqa0NPN0J5Z2p1QjJJa1AxWGdZV3ZzQnBYdysy?=
 =?utf-8?B?VXoydUhHWmJXMUFZRUZMSTZVUkVjRVpzRlFmN3M4cWNhbjF2UCtrV1FSejNk?=
 =?utf-8?B?Rk5PWi8xMER4R0ZYaXg2TUJlSmVPS2RJQ2dTbSs0aWR1VjQvbmtzbmFObHYz?=
 =?utf-8?B?NTF6V3RtM3dwaVlYRFFZbjBQZlZmRnNHcTJEMWlqWUxBUndZd1orRk5mQVVZ?=
 =?utf-8?B?ZXhDMFFBR2QyMjhTSm1pK0pvdDBWSFNtVGhFeVllV2R5TVZUemZjZjJCTW9M?=
 =?utf-8?Q?RwfAaE1n0rDzyfgKXDd+eqEBEcQMPKgVTNSAnPJIiSkL?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304b4738-0973-4ab1-8e7c-08dc289d273b
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:57:41.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D67pCYTtrGd/IQcJzV/I1npKuzcQ0LHlGucdtop6LIkIvo9i9W5lCNSvS1BnBny19xz+7C5sN8JdX3qeC6byxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2954
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28178.004
X-TMASE-Result: 10--29.197300-4.000000
X-TMASE-MatchedRID: fSYce/2kgDzEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJVtT5dsVizXEqsU
	oosmaFT6JQktxNYzOLO8E4YW3DeBN0wG0A6ErPuy3ofvMrFY+vptJ6O4f4yLXXFfKnMHlm6pPiY
	O7EHc52j8qYXo9dS9IZR8ZAbK+qcUaqOOC3euib4DonurBhe0Es8R4NzG9QOMmklrnN39Lpn7Ba
	min45J3KFKxbOL8Ac5QQOL9w7jz3UqGIIb+jZMO4GPgF12Yg5XjU2h5xrZXerNZ57VOrxNNIvkg
	Jp94NBRCbOiBZ5hLo4L8Pn8NeDCYtwQxQYj+BUI3kILoplJYrsnDrpxCH9HlzdF+uIxstnWy8Nz
	RUdZOSioOXYKZ7lGIQImQFx3Grea/JKFyd1g5iEdjBmukzVYjNKVGtUbacqD10/soz7yB7G1LkL
	Kwws7xSvbbf7GyIYWpwA3uR0eqWyakCEQ0RiTgLwuq7C0ZVS6+mtDRLyNCFp+rvFZ7FWrXAzi15
	COXRBdNfWnA8LBHQ3PeuNvTUDcobxa4QnrymkIgj6wn+CBiO/cMvZsE7nbYpTQP2zJCJFMSIGcb
	D5uYGAvP051SRxlTwRX7je7r8pit9WuMwVoKM91l9Dc98wQwzvQG0xdFpDCcAMIk2JwyIQ0AoHX
	v3VxRsOZ2ctl/jceLYZZ6ScMNow9Dz63wdQYeNdhcqe/XqWLNU4Kh23d7qMWWe7YoABg31Ny5ZD
	Fagkd306luRmxq6WEQ7OPwIn1+uwQdSKrN7oIXsAx9b9b7vwlQx76zly9o4YvRkePEUAe4EXZbX
	g83i53WjIFDXBHVRPZ4/LukAXkRH7ydzGokzwJ4vmrWAiMs0I9AEPfED/dqvJX/aNGr9cSCDdzA
	MeX/Wp2VXUuZsR8uPGi4lv24pxNbAuntgQ5Zjv5gdvtdpzVWjsaYI4lh3U7nRP0DvgcK+Ao/vp8
	hv08lExlQIQeRG0=
X-TMASE-XGENCLOUD: e0fce135-12d5-4736-855e-98ae62d1756c-0-0-200-0
X-TM-Deliver-Signature: 12D76CA6E072B397776FD2C32CBF0042
X-TM-Addin-Auth: 1gQhR4wcDjQ8/FyWZFxVCn/wqhPiJeqqm9kKgMvTyN20HAgF3NM7PpQZsvr
	Dem1jrfFKbeaOZ1ajV1qDVsWfn9R99RrJyj3HbvjKvHXp9s7QuRAbgm3XO/1gyWSAbv7TEPwDAm
	4yl8svGzKSNil0xOicC3rRzy7ZjpR+EG6apkGibnbFa5xALIaCgdMp4nuYSDUbfKhwnHIevttoJ
	LojytWXen1zMSM1ztN7PDE1135jzPJW20uC0cim+I25tpKuVOEraZNY1AWgb3KO2u5/AJTCbUjX
	hQwj7pZBtFA5VDw=.2sVibAMx3s2pwrvy/g5FWBSZ4EFefDmJ+Omyf7jaBC1zyLuztRJ6+EWpkb
	tb6envGYfJcQRdiH4fO3E/Ih+Xlek2cl9uz5oZ/OsaoOZ/ozRE9XGMD3pT0dTnmJVCddAqQ+jNu
	WInLuRWWFuTN4u/azNjxltoEGYnZze4sorVBMhcxG3GL3gKayZYMZl9AgNehTyzapFg38gki9Jy
	TvHDJS65i2NqRkKzxfnIbdCxz8NNQuxGb32JkrVqSoG9wcmDI0RwJ/PjEQPvEGTU1RHRQypykBh
	PVSvdVFW0q2AS8mB6gQKaY8Z/FToRT5Ob3ICnKSXMgSROnPLHzsWOUtgYmQ==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] RE: [RFC PATCH v3 1/4] virtio-rtc: Add initial
 device specification

On 28.01.24 07:15, Parav Pandit wrote:
> 
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Wednesday, January 24, 2024 9:09 PM
>>
>> On 20.01.24 11:07, Parav Pandit wrote:
>>> Hi Peter,
>>>
>>>> From: Peter Hilber <peter.hilber@opensynergy.com>
>>>> Sent: Monday, December 18, 2023 12:13 PM

[snip]

>>>> +\subsection{Device Initialization}\label{sec:Device Types / RTC
>>>> +Device / Device Initialization}
>>>> +
>>>> +The device determines the set of clocks. The device can provide zero
>>>> +or more clocks.
>>>> +
>>> Now that we bring the generic basic facilities to define device
>>> capabilities and resources in [1], Num_clocks can be structured a clock
>> resources.
>>>
>>> Please refer to max_limits in [1] as capabilities.
>>> [1]
>>> https://lists.oasis-open.org/archives/virtio-comment/202401/msg00095.h
>>> tml
>>>
>>> We should bring a rtc capabilities.
>>>
>>
>> Hi Parav,
>>
>> thank you for the suggestions! I think that it is a good idea to standardize
>> message layouts. But I also think this is late and overly complex to become
>> the default RTC interface. 
> It takes out the complexity or functionality that RTC tries to define and puts in generic infra.
> Same was done for net device for its capabilities.
> 

I disagree about the complexity, and prefer to keep the RTC device without
admin virtqueues. Below I am making a proposal how RTC in the net device
could likely be used with a polished resources paradigm, without creating a
dependency for RTC standardization.

Using the resources commands as RTC commands would result in an interface
which is clearly more complex than the current interface. The resources
commands are not an adequate abstraction for all device functionality which
is not a net device data path.

The only advantage to the net device (not to the RTC device) would be that
its top level interfaces have a more unified look. My proposal 4) below
would retain this advantage. With the original resources sketch, the actual
RTC-specific interface would get more complicated for the net device as
well. 

In general, virtio devices have arbitrary command types and it is possible
to add new command types through feature bits. Why should just 4 types of
commands (CREATE, MODIFY, QUERY, DESTROY) be good enough for RTC clocks
(and also not hinder RTC development in the future)? Any existing, and any
new, commands would be merged into artificial commands (typically QUERY).
The current RTC draft has at least 4 commands on a clock resource which
would need to be mapped to a single artificial QUERY command (CLOCK_CAP,
CROSS_CAP, READ, READ_CROSS).

Combining naturally distinct commands will increase the complexity for
specifying and implementing the command. Simple devices also do not
dynamically create or remove resources, so the resource paradigm is even
less useful here.

The many issues discussed below confirm that complexity actually increases,
and indicate that the resources proposal cannot be considered complete and
mature yet.

Also, admin virtqueues have explicitly been defined and implemented as a
Virtio Over PCI Bus specific interface. Therefore, they cannot be a
mandatory dependency of a general-purpose device.

I see four different options for the net device to have RTC commands:

1) Make the RTC device a member device of the net device.

2) Put the RTC requests into the controlq, as discussed previously.

3) Introduce new group administration commands which encapsulate the RTC
   requests (similar to how it was discussed for the controlq).

4) Once the resource proposal is sufficiently complete and consistent,
   encapsulate the RTC requests in resource QUERY, resource MODIFY, or
   similar commands. This must be done in such a way as to not restrict
   future extensions to the RTC device. 

   The QUERY and MODIFY commands then need to have both a command-specific
   data and command-specific result.

   Clock ID fields in the RTC requests would then correspond to
   virtio_admin_cmd_resource_cmd_hdr.rid. The clock ID field types should
   then not be smaller than the rid field.

The RTC requirements about writing to and reading from buffers appear to be
compatible with the admin virtqueue, except for the zero-padding of short
buffers in the admin virtqueue, which could also be added to RTC.

RTC could also reuse the status definitions of the admin virtqueue.

All four above options allow to standardize RTC without depending on the
resources standardization (and PoC) progress.

The latter two options should also allow putting RTC into the admin
virtqueue for the net device. For standalone use, all four use a
device-specific queue.

>> In particular, OpenSynergy has no plans at the
>> moment to support administration virtqueues (and the newly proposed
>> device capabilities and device resources) in the RTC prototype
>> implementation.
>>
> For RTC and any new facilities, I believe movement is not applicable because until now there wasn't anything.
>  

I don't understand why this would be irrelevant information when discussing
about complexity and standardization progress.

>> At the moment I see the following problems with using device capabilities
>> and resources:
>>
>> - Device capabilities and resources were initially proposed last week. It
>>   remains to be seen how and when they will be accepted into the standard,
>>   and when the Linux kernel driver will support them. 
> The first user should be able to implement it.
> 

This comment was about the delay that using resources would imply on
standardizing and implementing the RTC device.

>> Especially the
>>   dynamic resource (de-)allocation seems a tricky topic to me.
>>
> Ok. Lets discuss.
> Also implicit device resource is also to be considered which are kind of default resource exist on the device, which driver would not create/destroy.
> 

This is not yet described in the resource proposal.

>>   By contrast, RTC was originally proposed 10 months ago, and has had an
>>   open-source driver available since 7 months. In the past it was discussed
>>   that the net device could be supported through the net controlq.
>>
> I assume that driver is available for reference, prototype etc, purpose and not to use it in any kind of production environment before standardizing the spec.
> Otherwise there is something fundamentally broken in the virtio spec standardization in 1.x era.
>  

I agree. But my point here is that proposing new non-trivial, draft stage,
transport-specific features as a prerequisite for a long proposed feature
(RTC) can unduly delay or even kill the long proposed feature.

What if e.g. capabilities and resources were now added to RTC, but in 10
months, somebody says, drop it, I have a supposedly better idea, which
cannot be conditional on a feature bit?

>> - Administration virtqueues are only defined for Virtio Over PCI Bus. Our
>>   use cases also need Virtio Over MMIO, and maybe others in the future.
>>
> AQ are like any other virtqueues. So MMIO registers to expose AQ is straightforward.
> Once you have it over PCI, this can be supported.
> 

I do not understand the previous sentence.

Admin virtqueues have explicitly been defined and implemented as a Virtio
Over PCI Bus specific interface. Therefore they cannot be a mandatory
dependency of a general-purpose, PCI-independent device.

>> - The requests VIRTIO_RTC_REQ_CROSS_CAP,
>> VIRTIO_RTC_REQ_READ_CROSS, and
>>   likely any requests added in the future do not fit into the current
>>   device resource pattern (as detailed below), so would need to get their
>>   own virtqueue; or the admin virtqueue would need to allow device-specific
>>   commands.
>>
> Let me read more below.
>  
>>   Also, alarms would need to be addressed, perhaps as dedicated resources.
>>
> If I understand correctly, alarms are created by the driver so it can be a resource.
> I think the tricky part is persistent alarms across device reset.
> Does the Linux driver clock has concept of persistent alarm? Or is this for some other OS?

Linux kernel RTC drivers report whether a (usually physical) RTC device
alarm is currently configured or not, which the Linux kernel queries i.a.
on boot or resume from sleep.

> 
> I believe persistent alarms also falls in the implicit resource category to me.
> 
>> - For the RTC device, using the device resources adds considerable
>>   implementation overhead even for the simplest of implementations, with
>> no
>>   direct gain.
>>
> Practically it is just structured in generic format than device specific requests and response headers defined in this patch.
>  

As I will argue below, there will actually be a need to introduce
RTC-specific nested headers.

>>   Both capabilities and resources can change dynamically. This would
>>   necessitate a number of requirements for RTC how to deal with this. Some
>>   extra generic requirements would likely also be required.
>>
> Device capabilities in RTC generally should not change dynamically within the device.
> For example, following structs and fields which are defined in this patch belongs to capabilities.
> struct virtio_rtc_resp_cfg.num_clocks.

As discussed, there is currently no use case for dynamic clock
creation/removal. But it should be possible to support this use case in the
future.

> 
> Device resource:
> Clock -> identified with the clock_id
> 
> Resource attributes (instead of cap, as resource attribute).
> struct virtio_rtc_resp_clock_cap.type
> struct virtio_rtc_req_cross_cap .hw_counter and flags.

I do not understand this comment. virtio_rtc_req_cross_cap is the request
from the driver, and .hw_counter is a field in the request. flags is part
of the response.

> 
> Do we have M x N matching of M clocks and N counter counters?
> In my view, it was M clocks and 1 hw counter of the cpu.
> Can you please clarify?
> 

As already discussed for patch v2 [8], it could be different HW counters,
e.g. TSC and Intel ART, or TSC and HPET, for the same virtio-rtc clock.

>>   E.g. the device resources draft does not address how resource removal
>>   would interact with resource utilization in other queues (e.g. alarmq).
>>
> Good point.
> We do have explicit statement added in the resources draft that, 
> +The device MUST complete the command with \field{status}
> +VIRTIO_ADMIN_STATUS_EBUSY if the resource
> +modified or destroyd is linked to other resource and if the device cannot perform
> +the requested VIRTIO_ADMIN_CMD_RESOURCE_MODIFY or VIRTIO_ADMIN_CMD_RESOURCE_DESTROY
> +commands.
> 
> In your case the other resource is the VQ (alarmq).
> So one needs to destroy the alarmq before destroying the RTC clock resource (if it is explicit resource).
> 
> We should extend the resources definition to indicate other objects such as VQ (and not just linked resource).
> 

So if there are two clocks which support alarm, neither can be destroyed
without the other because the alarmq depends on both? As a resource
management scheme, this does not make sense to me.

Also, dynamically creating/destroying virtqueues is adding even more
complexity, and not described in the resources proposal.

>>   The only direct improvement I see is that the driver can dynamically
>>   indicate which clocks it wants to use, which is not present in RTC RFC
>>   spec v3. However, resource-saving features such as negotiating
>>   VIRTIO_RTC_REQ_READ_CROSS support (VIRTIO_RTC_F_READ_CROSS) were
>>   explicitly requested to be dropped from the spec in the past.
>>
>> - The admin virtqueue spec says:
>>
>>           It is the responsibility of the driver to ensure strict request
>>           ordering for commands, because they will be consumed with no order
>>           constraints.
>>
>>   But the RTC requirements mandate certain constraints for the RTC (clock)
>>   read requests processing order (so that the driver will not see backwards
>>   clock jumps where there are none).
>>
> Yes. above requirement to be met.
> One easy option is for the driver to instruct this to the device explicitly to maintain the order.
> Second option is to extend the spec for strict ordering for this new device type where driver ordering cannot be done.
> 

I now also saw another, somewhat contradictory admin virtqueue requirement:

   The device MUST process commands on a given admin virtqueue in
   the order in which they are queued.

This is also a limitation, since it would e.g. force the device to finish
reading out a slow clock before reading a fast clock.

>>   Maybe there are more incompatibilities here; I didn't check this
>>   thoroughly.

[snip]

>>>> +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device
>>>> supports
>>>> +cross-timestamping for a particular pair of clock and hardware counter.
>>>> +
>>>> +\begin{lstlisting}
>>>> +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
>>>> +
>>>> +struct virtio_rtc_req_cross_cap {
>>>> +	struct virtio_rtc_req_head head;
>>>> +	le16 clock_id;
>>>> +	le16 hw_counter;
>>>> +	u8 reserved[4];
>>>> +};
>>>> +
>>>> +#define VIRTIO_RTC_FLAG_CROSS_CAP (1 << 0)
>>>> +
>>>> +struct virtio_rtc_resp_cross_cap {
>>>> +	struct virtio_rtc_resp_head head;
>>>> +	u8 flags;
>>>> +	u8 reserved[7];
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +The \field{clock_id} field identifies the clock, and the
>>>> +\field{hw_counter} field identifies the hardware counter, for which
>>>> +cross-timestamp support is probed. The device sets flag
>>>> +\field{VIRTIO_RTC_FLAG_CROSS_CAP} in the \field{flags} field if the
>>>> +clock supports cross-timestamping for the particular clock and
>>>> +hardware counter, and clears the flag otherwise.
>>>> +
>>> Hw_counter is also the resource attribute.
>>>
>>
>> But a clock may support multiple hw_counters; therefore the driver provides
>> the hw_counter in the request. So it would not fit into the
>> VIRTIO_ADMIN_CMD_RESOURCE_QUERY pattern out-of-the-box.
>>
> Right. We should possibly be able to extend the QUERY command to accept device type specific input if the hw_counters are in huge quantities.
>  

But is it then still one QUERY command, or is it effectively multiple
commands merged into one?

>>>> +\end{description}
>>>> +
>>>> +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device /
>>>> +Device Operation / Read Requests}
>>>> +
>>>> +Through \emph{read requests}, the driver requests clock readings
>>>> +from the device. The driver enqueues read requests in the requestq.
>>>> +The device obtains device-side clock readings and forwards these
>>>> +clock readings to the driver. The driver may enhance and interpret
>>>> +the clock readings through methods which are beyond the scope of
>>>> +this specification.
>>>> +
>>> Reading the resource using generic query resource command of [2] will
>> return the time value.
>>> So only time definition is needed in the resource.
>>> [2]
>>> https://lists.oasis-open.org/archives/virtio-comment/202401/msg00096.h
>>> tml
>>>
>>
>> Treating current time as a resource attribute appears questionable. First, it
>> continuously changes, while other attributes don't. 
> It is a resource_specific_data. So it is free to continuously change.
> A packet counter, flow counter etc similar examples, which will also have constantly changing value.
> 

Every time the driver just wants to read the clock, the device is forced to
return diverse data it has on the resource as well.

Also, "resources: Add theory of operation for device resources" now says:

    ++Managing resources using administration commands using administration virtqueues
    ++are assumed to be slower operations compared to data path operations such as
    ++handling tranmitq or receiveq.

But it must be possible to implement reading the clock as a fast command. 

>> Second, it could also be a
>> slow operation when reading e.g. from a GNSS clock attached over a slow
>> interface.
>>
> If I understand correctly, this has no effect on structuring it as a resource of some cvq command.
>  

But on the performance during probe.

>> Also, the query resource command does not fit read request
>> VIRTIO_RTC_REQ_READ_CROSS, which requires the hw_counter parameter,
>> and returns extra results.
> Query resource command extension should be extended to accept this resource specific data apart from rid.

What if the device doesn't support cross-timestamping? What if the driver
is not actually interested into the cross-timestamp - does the device still
need to obtain it?

Thanks for the discussion,

Peter

[8] https://lore.kernel.org/all/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/

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

