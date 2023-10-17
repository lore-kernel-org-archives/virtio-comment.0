Return-Path: <virtio-comment-return-7761-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F147ECDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 16:06:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 25517159D2D
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 16:06:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F134D986875
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 16:06:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5F85986869; Tue, 17 Oct 2023 16:06:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C730598686A
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 16:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1697558770.785000
X-TM-MAIL-UUID: e3a40c8f-a1de-4be4-acbf-688f9c67b277
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY08dK0CCk9173rspYnuaVDFof4rQ/vNckmTxMPBUMsS0OYxLtfOmekXuHc0p8zR7oneP75TNkR72ys8BwNE2MExnq0VvuGhTe3tdFWZ60bgrha+imUlJ2Eb2HhoifJy+bx9xKEczNqzWm8zxlBjiNlWVwKJCN8jTam3SaIlFsjX8FyrLl05VRZtTBiPP6OWoAfpr8EFJTTHOucglRL3xtGBEHaoRmR10fEqDNywhotWNgoVBaGYXInheU3EdIOqqD22+nUnQ84CHctWB0F97GgT5ma5mlThULQNVym8qpdrdpqIjO+aR7uuB2Ev373rKqloUFc0Twg6a5GUpbDGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jFDm5XD4y3Pv4wxcUxQHfVx+RxljrkAihzteaLPczM=;
 b=HsDf/3HJLT+4yJxFSygvbnYHrfdtGh4JTmVn2KNHVetUdlIXwuPAq/XRnSbAi6wLcCMIF4/sSpJTjmlvHbk7S4exhpJuAakEf+AoH32U/OpAesphRGeuBn2ML8dTD7/Kq4TkklQi/+hBmDCRWFdTfT4VkAJp1D58zSF2hJ2plTMM4LsV34ut7wve3SUeIJyn9wvvmVtTUgoZ3bI6LJnW2425g73sCgImt4i0KRC0CHrjOkFtwQkcC+P/UdRRtdAfezhzqTbMml8o6z6UtEkpnxAVkfhUILr2c+6Iehsd7fWnBdBj6DIbJEgWPC2z1hk7JjLYTfxJj4PVr+QOQ3b2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
Date: Tue, 17 Oct 2023 18:06:08 +0200
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
 <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <026c8242-7dae-4ee9-b9e9-bb52af07c063@opensynergy.com>
 <PH0PR12MB54815BDBEA7E4DE1074B167DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0c7bec47-8a21-4a1e-80e9-43740a72d427@opensynergy.com>
 <PH0PR12MB54812437DFD91F0F3E3CFBFFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <PH0PR12MB54812437DFD91F0F3E3CFBFFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB2449:EE_
X-MS-Office365-Filtering-Correlation-Id: 5690219a-2a7e-4a01-d2c4-08dbcf2afa0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YahSRIYb5jrcZox9lmqIeLArlkLcg+c9+J9CB2ByG4RETv3h1RVTA24oq4O9R/hCDyN9z87dFIusSI9bmLtiwyj2uRk1dQLHcXU5XnWg103JC8Sb5ZKN8QWzjPyaG2npgIB8g1CAXJPVgZ5FzQIuv2rfyBUBvnIW3gR1uzl6yizBpFfXhl6e255J4VCCg6gS0XxZ6fpGjid0Tc1ZVMi89ysi3CgYWosppJL77MDbUNWdQD8MxVAx3ha1KXejCEsvxc5kGFEA12KfUViZyxycDprxE0fejuKG98Ai47llFnvYe9vdjyBc7MJ622NhcH6bZhkwFnR7CsBJ7BmD9m6k0KJJZcZ5KxBZdDmx2pMatLWgytSI6bMW7A7qthFMm9lJKWkfEVfORPDhArFq6H0p4hJmV6y3srXsslvW8QmIlq5TUpjRZC63e2jSDJ2JenJ8XZvG0vxMQjU+V5c7l/6WHZlMAv8n+sdwYp3l+90oe4RDieKzxWOUkALEVVFNiAK66cRUWi+xsmBqnSjoy8E1yT6LJUUWCp9yqV+D2sAD0boXsdWz34JahRHhmhvtLtnfugKfpZ1pLJfEYSRvMzXzo5dNhf2ita3cd7DDZUGCs4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(376002)(396003)(346002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(36756003)(31686004)(66899024)(66556008)(66946007)(110136005)(316002)(66476007)(42186006)(31696002)(86362001)(38100700002)(53546011)(83380400001)(26005)(2616005)(2906002)(8936002)(478600001)(41300700001)(44832011)(8676002)(5660300002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHAvK2RwQ1BwKzUzbFY2YkQ2Y00rY2pQQ1BxZkZaWjhiQWRXS1ZNNEk2c3FN?=
 =?utf-8?B?OE5rRGdlY0hoU0xzS3ozVDN3Z1ZoUlFNWldCOWZheG1DS01mQ25kbnJtU1V0?=
 =?utf-8?B?RXJEMHhhZjBpQlRkOFZqcWhkNW54Q29NaVZtdCsvaDh0TldqNGdEY05FYkdE?=
 =?utf-8?B?bkhxNEZ2emlVMnB1QWxsZzlLTFpJSERlVXpucHlXMzJNdnQxOWJMQTU1cnlk?=
 =?utf-8?B?MEQ1Um5FVC9LVElYa3A5Uk1GWUFXdDFiWGJldEZmcXNSWm5hMmhObDN0aHRx?=
 =?utf-8?B?Y1R2NVRZWjF5OUY2T3I4SVhjanFkZDdML29BTzZGdkYyVUhTZlZtc0NVRity?=
 =?utf-8?B?RVpMSmZTNHIzYU5hK2Rxd2MraTlGa3ZqaXFHQzA1SXZkT085cXZCNDMzZjAv?=
 =?utf-8?B?dFVhbUs0YVg1VmJRc0tnZFExSVEzUkdnOW4xUWUybCtPbnZFbDVVYkJMN0Fx?=
 =?utf-8?B?NmEwSzBmUXRNQ2QvSWxEcm1CZXhCcjBDQmpESWxHSmRLVXpmdWRGb2p3dlRC?=
 =?utf-8?B?NndLTy95WTFUcHU0Yk1qNVJXaXppUEkrVU4vQ3lMdTBZeVpjZWVJRFliKzJV?=
 =?utf-8?B?cU5uRTVJZnpGd2tEZGxvdEpPQ3EzVHFDWnhFckdHdkFFYWlERlhFM1cyYU5B?=
 =?utf-8?B?NGJBU1Z4R0szUmFEWjN6cHI1Tm9wLzVTNVlMcFczYklhRUcrWWlSTmpVbE93?=
 =?utf-8?B?QzJOc0JUQ0FGRGdWdE1Fby9wblovNHRxNElrVGlwQlFHZ0p1TnFUZ2YvUmRh?=
 =?utf-8?B?OWtIcHVMRVlVNXlxbHFtakkxN082aWkwdG9mOEE3ZzZJbTFXVXJFU3c3cVJl?=
 =?utf-8?B?NmIyRkh6Si9ldUluZTdWVmR5WlJZSlZMTXJseTBhT0w5UHprQm13MTB5Q3Z5?=
 =?utf-8?B?T1hyVTRLUHF0bWkvQnhZOWIxZkxINWE3Q1pBNFBQN2ZZblViQ1F4ZnV3bXNz?=
 =?utf-8?B?bkxYQzBNTTNDYmMrWHR5eUZRZXBFVFpmbVF6b3VpcnB1c3BWdzl2VVgvTG1U?=
 =?utf-8?B?YmNZSkpNTnRNVnNZaFhVeGJuWVBKVDVUQWxBcGxnV2h5ZnlHNlpBL3psWHFY?=
 =?utf-8?B?bGZCKzd1NXBjU0RYeTJFTFhIZTBlQjluTDBpcmRaamo0Q29tYXhFQ0s4d0tL?=
 =?utf-8?B?RlN3Vm5YRTJGcWRKSit3L1pnakNvQlVIRlZzZytNc29iOURJOVZCYXRNRHp5?=
 =?utf-8?B?aVdTSDJlSE9sODlhTWt1dDVIVmJuaWVBaG5FRzFIRjlKek9WV3JSL0xYV2lz?=
 =?utf-8?B?UXJVZjFzUjNRd05rNVBqcy83R1doWi84SkRUQ2NGTE5MWVZyR0pobE50TTJa?=
 =?utf-8?B?V0l2cE5iYUk5b0djSE5NUjlaWjU5ZHBORXVmaXh2ckVraC9IUGNLM2Uxb1RR?=
 =?utf-8?B?Y3dsVit4M29xSTc1TFBWRyt0Rmd0dFl4TENNUVozM2x0SjR4a3owc0FESlhP?=
 =?utf-8?B?bUd6VE9FdHd2SW91WFhsanc0V283cHoyUE1xUjZEbjA3alp6dUVkZ21RM0tn?=
 =?utf-8?B?UlBCSW5qT0t0NWpNS2c5WkoxZHZldjE5cG9FbzB3RCtCUlJDTnYwVFlVaGRQ?=
 =?utf-8?B?N2hLckg4cWduMjhwMzg2MWgvWVZzMnN3ZUQvWE5VMldHNVg4YzMrTDJ2Wmo0?=
 =?utf-8?B?SFhYT3JLTTZURmFxemsvVnRsOVQ5dDN0OWJ1cGdTWmR6K1VGdzJGRC92MXh6?=
 =?utf-8?B?bS9rcmQzNDVveHlmb2wrUnpmTlFDdEZ2WkFIYkg0ZGFKMDdwRi9rMkNWU01a?=
 =?utf-8?B?clZsUThjOEQyVXpPZW9Ib3lhWXNXTFNPOWN0ZTBmT1VDaXFtdUVTMGxVV3RX?=
 =?utf-8?B?aWl4LzZFaDRIcGVLVmRVbE90cWtnb3hWZG5kQURuN2lOZVhHVnJQUFBjaVMr?=
 =?utf-8?B?ODRCUWhlZGs2eU1DV1gzL0NzNTcxa2w0MDhCN1JlaVZlYWNiV1Nwc1dPYWxo?=
 =?utf-8?B?aXFQRXd3cG9FODFGZVd4K0c2eUMrZ2JUUDNlTG9qVnZ1cjNpN3dlYkcrcGMw?=
 =?utf-8?B?eGtMVnowNXhaeVg4dlJVbHIwQzkxVXk0OHVuSDNpcm5zTGRRSW4wM3JsL1R6?=
 =?utf-8?B?UUcveDBGVHQ1OVozbHpUUUx2Mm03cmtqbCtwcFh6eEIrNkcxQm1ueDVuZy9z?=
 =?utf-8?Q?AOGIr1CFViFSD2SZwHDC9Taha?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5690219a-2a7e-4a01-d2c4-08dbcf2afa0f
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 16:06:09.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSz1DmQGPBIp8Tn3ym54vT4YD+6JX5ZbOlL4NNUjD4DPts/Ddmc0jv+xUuL0DMdawu1F8zvt3YA9aDspYIC3Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2449
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27942.000
X-TMASE-Result: 10--19.854400-4.000000
X-TMASE-MatchedRID: WMT2WRIkHPP5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxopD
	1fUwav/s08q4PMUbAPjqbgLdOzv+hsGCQMGZxZ96Wyx0lCurExpWEpmiB2wI24kWhfwArNwDehd
	Z/bwq3VY6bQZruhL3u+DcvAdA6M6l0bnjldi6U5JsBBK+dj8AxRKUUHDK9Jou5qrb7yL6gJVcfr
	yzaLevjao7BF4dNTXSK0B4JDvOy7pEVkvk0mxQPpHnqg+UkwTPBL4THNqT0Ng3vJH2ZioNrRNpw
	FGo8YcXOf7Xf/XBKlLFTPlckoWxHJJMxzuqEzfW5GkDZ859WynOKm7oAxeFFYD9HhB+V5lzjo9a
	/ZwcuNDf69IM6MToGRSGNkKyOtOKgHgis3xyFyhZnFiE9hisyagclxRwe1qq7Dpgponlpy658tN
	gXosFxH4zooUqcfnC6xA0Ava73nAPm15xyht8lST5U3lJ4T8KrNJuAjeDQg1aOxpgjiWHdQKmAR
	N5PTKc
X-TMASE-XGENCLOUD: a482c62d-ce3c-4e91-8e96-476700bd554f-0-0-200-0
X-TM-Deliver-Signature: A4A64EFE0DF0A380B2B0818FF8C0A095
X-TM-Addin-Auth: AMPbubmDO6VazsVRYRRS/7Bcy2zbNMghlyonAcQhUCOxd3Wihpfd4zk2cCk
	IRTIkZMTngOr/2bUIaD+Xk/D6egnM+rHxhr4fLcu9khzgtl8RsViYwgza3eYgorAdUa5yfW0DiC
	EvwXA3aICGgjJs4nPryvyA9hD2TLoedbPIPIrU8U5q1fnCpLI+CnYjNOJ3pqesr2+N0Hhdbq6oM
	DkX+RRp6TWF9le6mc7gHgXBqKxMrS+t1C5STvv9i218ZOwQkui6rlym/sYNzSQkwkR7Dydrn4eO
	f+hCFfqagvuOegc=.kseRBr8ihsuTAiYb8o5DHf/ooRK7DgSuwtZ4iPaWcg9tNlUP+HaJh0tOVm
	8adZaaFLNM0Km2tYiC7QivU6Y7h4qbQEx3iMmeuqYSRuGlUohoLYfCqayijU/J8VU+Jr6bLdd+y
	Q0SHz4BlUsrviITnVMU1eX16Gn1gZGZ52uJiFR2tBdlYBTpETeR5Fup+JfddciKocMH/abd+BC8
	BTHORAXj8mIY21HG+ewLZ35k40vd9mfNNB2X/DIA9mNYHccv88dYZeeLcRr31I9yd3x6k3BYvOy
	0cEvprq8uBrlBA3uV5586rbKVNqKpqmHPP02KdJqnvB52AxsmaR81f8JcHw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 17.10.23 06:06, Parav Pandit wrote:
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Friday, October 13, 2023 9:00 PM
>>
>> On 13.10.23 09:40, Parav Pandit wrote:
>>>
>>>> From: Peter Hilber <peter.hilber@opensynergy.com
>>>
>>>> Sent: Thursday, October 12, 2023 4:26 PM
>>>
>>>>> So am I missing something?
>>>>> In an arbitrary, interface, once unplug is successful, i.e. when the
>>>>> device exactly know that unplug is completed by the driver, It can
>>>>> re-use the
>>>> id.
>>>>
>>>> But this would require the device to remember previously unplugged clocks.
>>>>
>>> Not always, it can do when the clock wrap arounds.
>>
>> Sorry, I do not understand the reply. When the clock id is wrapping around, in
>> the discussed scenario the device would need to know which clock had
>> assigned id 0 in the past to avoid potential misinterpretation by the driver.
>>
>>> Since this interface does not have the complexity of hotplug and unplug of the
>> clocks, we should just keep it simple to a reasonable number of clocks.
>>> The 64-bit value is not hurting at all, I just feel it is built for unknown.
>>>
>>> Any reason to not do hot plug/unplug of clocks now?
>>>
>>
>> Current use cases do not require hotplugging, but I tried to make the spec
>> future-proof.
>>
> If there is no use case for hotplugging a clock, we should keep things simple to a reasonable width.
> 
>  

I will change the width to 8 bit, although I don't think that makes things
simpler.

>>>>>
>>>>> This would work with 8-bit too.
>>>>> Not that I have issue with 64-bits, but the use case for large
>>>>> number of clocks
>>>> under single virtio-rtc device is unclear.
>>>>> And if there is no use case, we should have reasonable range.
>>>>>
>>>>
>>>> Using a large id range might help in the future to avoid dealing with
>>>> the whole class of id ABA problems, cf. the above example.
>>> In my view the clocks are expected to give precision and accuracy, so number
>> of clocks in a system that occupies 64-bit wide sounds distant.
>>> If it is used to not_care about finding the free id, it is ok.
>>>
>>
>> Not caring about finding a concurrency-safe free id was the reason for 64 bits
>> width.
>>
>>> Is hotplug unplug the clock (instead of device) is critical that drives the clock
>> id?
>>>
>>
>> Clock id width > 8 bit was only considered to be able to easily support
>> hotplugging in the future.
>>
>>>>
>>>> To me using 64 bits to avoid the potential future ABA problems looks
>>>> reasonable, but if others disagree, I can reduce to 8 bits.
>>>>
>>> It is not must, I just find the 64-bit level clocks a bit too much specially at
>> hotplug/unplug part.
>>>
>>
>>
>>>>>> With "unclear responsibility" I meant to refer to the
>>>>>> responsibility for drafting a spec extension for virtio-net,
>>>>>
>>>>> You can count me to draft the virtio-net spec for responsibility.
>>>>> I am sure others would join as there is common interest across
>>>>> multiple device
>>>> implementors to support it.
>>>>> We know at least 4 stake holders have interests in it in virtio-net
>>>>> (Alibaba,
>>>> google, marvell, nvidia).
>>>>>
>>>>
>>>> OK, thank you for the information.
>>>>
>>>> I think the arguments on how to have the RTC spec interact with the
>>>> net device are now on the table. Maybe the discussion could continue
>>>> on a draft spec extension for the net device?
>>>>
>>> I didn’t follow the comment.
>>> My suggestion is lets draft the spec _now_ that covers rtc functionality as part
>> of virtio-net device and as independent rtc device.
>>> And if that requires me to work and draft the net part for you, I am here to
>> draft it.
>>>
>>> Would it work for you?
>>>
>>
>> Of course, work on the net part could also start now.
>>
>> I would prefer if the net part could be discussed as a dedicated patch, on top of
>> the patch(es) introducing the RTC device (and referring to those).
>>
> It will be separate patch (or patches) in device-type/net/description.tex.
> It should be part of same patch series as rtc and net so both devices agree and reserve necessary opcode ranges etc to utilize same infra.
>  

I plan to send out RTC spec RFC v3, which should contain all the agreed
changes from the v2 discussion, in November. Maybe the net related changes
could then be put on top of that (and become part of a common RFC v4)?

Best regards,

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

