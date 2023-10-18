Return-Path: <virtio-comment-return-7819-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0310CCDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 16:14:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 242C93E56E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 16:14:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1F409868AB
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 16:14:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D2E199868A8; Wed, 18 Oct 2023 16:14:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C34E59868AA
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 16:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1697645655.100000
X-TM-MAIL-UUID: c16ab0be-fff1-416a-93b4-f6b35ec3c8e9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZKJotM3luQhnsdVJXYgP6LeMz4Yy5SrOqBceMlLS4nObqXl8taymMJ4d2Aupcx4WN9LMCzNqkIkZt25lHtuSsWUF+FvkiJyyZAkp6xH0ZShrrGUojTjKyB9YoR/t7lmNoKHS9eU6dgy8I/juoct93GrdJdcuFittCynA50OvyBKfh2JrvV0XNosjYd9/k+gZmt/1IKQj7qOyDb1Pt+c8JbuOlpXHJweCwmxUroJzU3zfI07bP/tIw+/BUslYLARc02VNswY5MKqDYnNcIuTzEAKgYftcL2Zs5wA+FqJL5XnrYngGNgOEOcEsd6WkGaXggmjxcl9yGKS0dcIK4ptxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTHZ4jw7ZM9d4b0/BoEa11eZm10HRG3ESmP9FQZhqN0=;
 b=GXQ7mdLMlEl9YLoCxcoo+CWwjXg8P3QqW/B219cZ31VRtwLqNsOc0YKhejQsbXuFY7V8DOxG2KSuntYmscQ5Q7l74x2+o57CIbs7wHGM8DcQ9cY9Nec40qfSRzgioIBuKrAtz/Y4M3fH5Y/8Sr/acGUY45fpfcKGndz1YZw5EtKkTeU0atsAkQ452JhW8/KQm976YeEwhLSgj7AlYMMvRWJgyfN7Ukh8C1fRJzYTZzZQx/5bD1/cKF9FLAjpALt8qDQHwESLzvAAPJtwrO7HBsYYp4ScLYoaYNbRNfvRfUKIaHEuXiUaXKseIVt4jBsjzO2Rdg6qQ83qzyvGpb1gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <6d6f0c19-9a08-4b1f-9796-bf9c1ce09eb8@opensynergy.com>
Date: Wed, 18 Oct 2023 18:14:12 +0200
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
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
 <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
 <PH0PR12MB54816E8AEE2AE89148076542DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <PH0PR12MB54816E8AEE2AE89148076542DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BEZP281MB1992:EE_
X-MS-Office365-Filtering-Correlation-Id: c30ae8bc-59f0-4cdf-6479-08dbcff544f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aiPJViSLlqcZXeIH2bUjgSFgJLjAUxK9eondYLAUP2O2UXs0YQVyok968b55KnW0sIL/xhaNLFkQDsCXmN0GQBV+O87QO6TENdsldko2LVZ26Ay/Inaf4DLoyYqHwPvjV3Ft/ELUOLFpFiq7/0mhE5tgfX+WbwgKmryHBs+ZlPGUfuC4KppEmqvEU2s3Mf/8EH/IYxkvqxw0l/iRbGVfTl+8wV9XcyMVa59Ls1uZuy4/o3AspesXElEalMfnFCU8yxaVGsd1OOoFGTCG5FiW8+J2vMgOWQ58YwDFSpPVs7udqL/Fu0E+SOePqDDrKvcOPVhjxsIJ3dyxGJ3BcHCkBl7CviDpZlZVoOxqbbiQR0GCJjytw0+/SKjQ7nxqAdvmPZ3xC0WUoZ4gz4ZnDz0Mvzmzu5BwQs/FtsF05dYFS+PEHGFPmt9jQbj0ZaNpMlw+4pWcvTZDxHf6eRR6rGrlp+brvlfXt3J5IIINsiRZMT4ddne6+yYqQp8tKo9fnaI9TNxdJrE4B9s9VcUOVhmIwkwzC2x/Pkkl0i+kfHGw5Jt9WM65cTFsgBiPCxNQ7cm6jnt/VOmQTC73BNMHlO/YpzHhroBPRgClCr8gy90FmHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39840400004)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66899024)(26005)(2616005)(53546011)(966005)(83380400001)(8676002)(5660300002)(4326008)(44832011)(41300700001)(8936002)(2906002)(316002)(478600001)(42186006)(110136005)(66476007)(66946007)(66556008)(31696002)(86362001)(38100700002)(36756003)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHBXOG1UZ0ZFQm9pWDU1NjVMTW9qOW41a2RUN3VIUlVDVS9UaXlKd1ZRYmRj?=
 =?utf-8?B?NnFBVXNNWnp4ZmpOdFE1a2piVWFqYnBPblUwKzQxQm5tVkhZZzRzbUlNT1RQ?=
 =?utf-8?B?cWhDKy9wVlNqWXVaZ3JBTlJOaWQ1eWE2UHgyeHBvbGl1UVZFUmZkdk94WDNI?=
 =?utf-8?B?Qi9PaU9EU1BCS1cxd3ZyUUhNTDB3Q01WVE40SExyTklzYjM3K3U5dEg4Ym9C?=
 =?utf-8?B?WTcvUjRsbElmQ2lHVm5ubk9NVEJjQTlPVlBFU0pBRGlFcnQyOStGSDBmWitO?=
 =?utf-8?B?eGMvRHlvWEZZSUR6Tm80dmZnUFJmUUNaZGp5Q2h0bFZZWmMrak95YnlhbGp3?=
 =?utf-8?B?djlYaG4wb2lkdEVpaW9xTlREb0hyb1RnWjJ4clV3TVVBdkljWHpvQy94WGlN?=
 =?utf-8?B?R0ZYcG1FYldDM1RxZjFYYzdVOCtRRVlEU1FnYy9KaW5jZE9SR1dMdTdGNlJH?=
 =?utf-8?B?YktDUTJVcno4WUhMemJ0bzM0OEtQWFA1NSs5K0lmajZxS1FVZDNZUHRrYlFH?=
 =?utf-8?B?UnNCZmJVVTNDZ0E3VzRpcjB2MCsyNWxISGQ5Y1YwVE9URUtqS1dLZjNSVk9Y?=
 =?utf-8?B?RTlPc09tOW4rMjFreDQ0RzRURyttYmZIVDFmcll4VkNWeE8vclQ3VEdrd1kw?=
 =?utf-8?B?VlhmNjV1b3JPSFZzcEtjcUlxZDk2MGF4V0oxZXluWDVTTWVNdGwwMlQ0WWEz?=
 =?utf-8?B?YjR1Vm1tcTI3MUtrbjAxbUJpMGZUZ3NXNThUZkJKV1FleHFoZkh0ZzVON3dy?=
 =?utf-8?B?d0VrUzJCUWFRR3BuUzhMYWhwN0hEU3Q0WnZrUHJyT1BhZzFFOGhtNzQrakR4?=
 =?utf-8?B?T1BPNW5hVXp2bUl2K1hQR0ttREZLenFrSG5HNlRKTFBFR3hlSUVDQmg4eDZH?=
 =?utf-8?B?a0xnLzc5SDBGeGxPWk5IYysrNE1DNU5CZVI4cW0xdlA0eFVKV2NHcE14NWp5?=
 =?utf-8?B?aE1OOXY5UWlQcXVuN05vckRMMmcvM29iVVBoSUEzQ1l5OXYxNlZtZ3Y5L0hB?=
 =?utf-8?B?bHJyR3ZieG5BYnNtdldlMW4yTVRCeVFQVUgvcWQ0TFdXUVg2STBJMm8vMUxP?=
 =?utf-8?B?TTBPdkFiZHgrb0JXMERUc3dPNGdTZ3lDMi9zUWlBcGVUOXFCZ3hwUjZyNmh1?=
 =?utf-8?B?UHFJYnRIdjFqNExSeDZJbWNpTTVGV3RNNi93dlV0YXdEbjdONnBrRXZ6dzRH?=
 =?utf-8?B?V1loVHp4UXRMenBwSlpTSHBWMTRQdWxvQlhzek5hQ2h5WldjdGx6SEhadERO?=
 =?utf-8?B?b0VjdUtVN0dLZDdyc2gzWWppcGljQXRDUndiNncxQ1ZiZzZhR2s1RHJJc0xV?=
 =?utf-8?B?WWZNUndYNW1PbXRkREVDTlFIUjRkYzlNQWhiWGFteDE2M3c1WWtMNVo3Rkxi?=
 =?utf-8?B?NTNIcE44MlJJWlJNc3Y2bFFWUUIwTHpwRFdYR00vL2VMc3I0SDYzWEV0ZjlI?=
 =?utf-8?B?NGIvN0NjV0E2RDJjUStDazJHaWdpTk00RVJCVG0zcXVFVmRxdU54K0RtL2Fk?=
 =?utf-8?B?Tmk2SWtWUnBSUWZkT0lHZzJMVUwwblpteWZvcWlOenNGSm5wa0UvMlJVL1gy?=
 =?utf-8?B?UXZuU2RHNW9vVUVER05QUXdoM1V2TFIwNm9NMm8zUndXcXMwc1ZPSUdiMW5z?=
 =?utf-8?B?dTcrYUVScmFDNENQU0Y5ZWZlZGdUZHZtVjBlZTlyOGhxM3kxSHZqRnJITG9s?=
 =?utf-8?B?ak1NY0o2YUtWWmpmbFVFTkNhR3l5Yi9JVVZ2Tm1RMTNrMjB5ZXdydU9WUXRB?=
 =?utf-8?B?TGVKQzAyNjFTOUFpMzYvT2h3WU1yUDFpekZpM0pvdmJMNFdQZXM3Tkl0TTBF?=
 =?utf-8?B?dnc4enRCVlBHYTVUOHJUVlFHVE9qaTB4ZnVnTSttREtRK1dqMmhqcE5XZ2s1?=
 =?utf-8?B?VlVCYm41MWJneWtsV2hDRFdRdVBRNXdwWnQvNmduOUZpcGxLWndCaUl2Y3U5?=
 =?utf-8?B?QVYvVnlPWUFXVW1WWWJIQlJJajM0RHdOZUNzRDJYZ1RCaWxKdk5DQVgrS3Qw?=
 =?utf-8?B?U2plRzNnb3cwb0tlU2wzdG01ZElnL3RlT0hkbW9NUVU1Z25zdld1WjVVUEtY?=
 =?utf-8?B?RDNtZUoraEVRUG5QaVVJVHRtOFZWWWd6NkloMnNGeTBQclM1aXZOSFpGbjNn?=
 =?utf-8?Q?So0BOKKWI9SzUOLRnJIYaeqa9?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30ae8bc-59f0-4cdf-6479-08dbcff544f9
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:14:13.5855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1N77j8zNjyYXLHBeGzyI9mdpe2EyRRA1Fhr5KE8xmUEt7tpN3xhaMLcuMHnzguTgrprPgqfJfwA+0BUCFIJ6sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1992
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27944.000
X-TMASE-Result: 10--32.188900-4.000000
X-TMASE-MatchedRID: /77LoUQXvQ/5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxnN+
	oMXXTg4qHs+LxydrDnynpwUPOeRGUDXdwrgapElsnRTJpY7VAKfn0oaU6WM++x+7SZ6NGLptTE7
	W75WhKMdcDMuRhsa3awSOo31TJujX+2gzuAk01wGheJ4X7s7SmgVGwx2b8My2TWyDQcBBlE1OTZ
	XdQjYSNkUl7WuNG5/y0j1B4XMPhRwdQ7f6LMvpVyJPlyIC6RpAusBvtbk1teCIcOmd382XO1ER2
	TPZDZz6JFTARvPvd+sBIMQgkovfhu3jnHsws53sxxh6MdbXuKCRcfFQRqdB9hLh086zh6T1999+
	Hz/8NbbMH8O8QVIfdC8uVJ4jZUr3YYqtmvytuAWNNDyC4KarW9HTGxr9mbot+mag7XH0T2k9JbA
	SR9wla1aw7t4y5tWKTcLIuHr2Ss+U8+AkVynQBKThw+fhHBJ8Dhj5HZt+peeP5h5bkhZzsYZSK/
	CN4znQ07VjLlKrYNZ2YEME5D6vCrIq40uliOiwWj/U/cEOmX9HIm3ZMHHpY9VwVFL7iTibkyB3w
	SjYyPkKELIt/NRlTXVGPf0MaYgPdmThAhTVltXFTQGAKRxj5No+48giqZwn6eHzLh/npgivngkj
	HjojpAP5R/zL3aImSrAS31ETvZA58Sarp97J8yUIayx+Skid
X-TMASE-XGENCLOUD: 9f483cdd-f8f1-4573-bf49-a809f9eed231-0-0-200-0
X-TM-Deliver-Signature: F3E29C286359821F9F563755802F9D8C
X-TM-Addin-Auth: JpLEbbQWxx+uzPZQRxcPWWG9fTbFIyZv0m4ct4l9OCXi0LxPz2wc9k0b903
	mpnNFC0L/+x2XyynKqMxhCuHyo69E6joxCIEnGyRO4dIgp+SjEv5++vryfFqVpDCjIFoLhDBMVS
	SLlY8u49lt87psVBlXfPuQJ+OhCWq9V8QHaIBRVoOEPfBm3n15SiKI+k0nBxhe8GP2stf1r4zDA
	n8WS3eBQEsWdfaOivQvzXZtBvNeUE98HBU3RwEoAU/V/LaeILsD3DBaGIXiZhWCF/WTs3BfS3tX
	yMKmKpQ9NM9hhJU=.EHmD5keDLdYMuct5eMabdG1BRGPSWzhFt37pD5L5f81RgG/qXc6k0yESk4
	ZgZNURfH6/M2v4jywIZhbVdWQpNH3toHcXbCv77e0Xug/KGUh0TPLTic0P8EC0gKUJWm4jfSwem
	Is7mMXcraQeoXw9HwcJAS4nmNQVOYj9nHkNOQa2EPldud/HmPEM5OrI5SK7ZQLy3y/yqP3cowjS
	f+dEVSM8bNnmKaOu8FMsCYZAHMIahy41nQTDXh209U4XF8Xv6zkFUa+IxufOLFMWoLwkJ2GXuDm
	zTmaGmV29E9jqmAvZKtsGQPiHREVCWm4+GJlGZJ018t47xf/181NCVuCpWQ==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 18.10.23 07:36, Parav Pandit wrote:
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Tuesday, October 17, 2023 9:36 PM
>> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
>> specification.
>>
>> On 17.10.23 06:06, Parav Pandit wrote:
>>>> From: Peter Hilber <peter.hilber@opensynergy.com>
>>>> Sent: Friday, October 13, 2023 9:00 PM
>>>>
>>>> On 13.10.23 09:40, Parav Pandit wrote:
>>>>>
>>>>>> From: Peter Hilber <peter.hilber@opensynergy.com
>>>>>
>>>>>> Sent: Thursday, October 12, 2023 4:26 PM
>>>>>
>>>>>>> So am I missing something?
>>>>>>> In an arbitrary, interface, once unplug is successful, i.e. when
>>>>>>> the device exactly know that unplug is completed by the driver, It
>>>>>>> can re-use the
>>>>>> id.
>>>>>>
>>>>>> But this would require the device to remember previously unplugged
>> clocks.
>>>>>>
>>>>> Not always, it can do when the clock wrap arounds.
>>>>
>>>> Sorry, I do not understand the reply. When the clock id is wrapping
>>>> around, in the discussed scenario the device would need to know which
>>>> clock had assigned id 0 in the past to avoid potential misinterpretation by the
>> driver.
>>>>
>>>>> Since this interface does not have the complexity of hotplug and
>>>>> unplug of the
>>>> clocks, we should just keep it simple to a reasonable number of clocks.
>>>>> The 64-bit value is not hurting at all, I just feel it is built for unknown.
>>>>>
>>>>> Any reason to not do hot plug/unplug of clocks now?
>>>>>
>>>>
>>>> Current use cases do not require hotplugging, but I tried to make the
>>>> spec future-proof.
>>>>
>>> If there is no use case for hotplugging a clock, we should keep things simple
>> to a reasonable width.
>>>
>>>
>>
>> I will change the width to 8 bit, although I don't think that makes things simpler.
> If there are no hotplug clocks, than 8-bit or 16-bit is just enough right for reasonable number of clocks.
> I don’t have strong opinion for bit width.
> 64-bit width without hot plug case seemed very large.
> Please the practical range that you find suitable.
> 

OK, I will use 16 bits, this should in the context of the current spec
satisfy all imaginable use cases.

>>
>>>>>>>
>>>>>>> This would work with 8-bit too.
>>>>>>> Not that I have issue with 64-bits, but the use case for large
>>>>>>> number of clocks
>>>>>> under single virtio-rtc device is unclear.
>>>>>>> And if there is no use case, we should have reasonable range.
>>>>>>>
>>>>>>
>>>>>> Using a large id range might help in the future to avoid dealing
>>>>>> with the whole class of id ABA problems, cf. the above example.
>>>>> In my view the clocks are expected to give precision and accuracy,
>>>>> so number
>>>> of clocks in a system that occupies 64-bit wide sounds distant.
>>>>> If it is used to not_care about finding the free id, it is ok.
>>>>>
>>>>
>>>> Not caring about finding a concurrency-safe free id was the reason
>>>> for 64 bits width.
>>>>
>>>>> Is hotplug unplug the clock (instead of device) is critical that
>>>>> drives the clock
>>>> id?
>>>>>
>>>>
>>>> Clock id width > 8 bit was only considered to be able to easily
>>>> support hotplugging in the future.
>>>>
>>>>>>
>>>>>> To me using 64 bits to avoid the potential future ABA problems
>>>>>> looks reasonable, but if others disagree, I can reduce to 8 bits.
>>>>>>
>>>>> It is not must, I just find the 64-bit level clocks a bit too much
>>>>> specially at
>>>> hotplug/unplug part.
>>>>>
>>>>
>>>>
>>>>>>>> With "unclear responsibility" I meant to refer to the
>>>>>>>> responsibility for drafting a spec extension for virtio-net,
>>>>>>>
>>>>>>> You can count me to draft the virtio-net spec for responsibility.
>>>>>>> I am sure others would join as there is common interest across
>>>>>>> multiple device
>>>>>> implementors to support it.
>>>>>>> We know at least 4 stake holders have interests in it in
>>>>>>> virtio-net (Alibaba,
>>>>>> google, marvell, nvidia).
>>>>>>>
>>>>>>
>>>>>> OK, thank you for the information.
>>>>>>
>>>>>> I think the arguments on how to have the RTC spec interact with the
>>>>>> net device are now on the table. Maybe the discussion could
>>>>>> continue on a draft spec extension for the net device?
>>>>>>
>>>>> I didn’t follow the comment.
>>>>> My suggestion is lets draft the spec _now_ that covers rtc
>>>>> functionality as part
>>>> of virtio-net device and as independent rtc device.
>>>>> And if that requires me to work and draft the net part for you, I am
>>>>> here to
>>>> draft it.
>>>>>
>>>>> Would it work for you?
>>>>>
>>>>
>>>> Of course, work on the net part could also start now.
>>>>
>>>> I would prefer if the net part could be discussed as a dedicated
>>>> patch, on top of the patch(es) introducing the RTC device (and referring to
>> those).
>>>>
>>> It will be separate patch (or patches) in device-type/net/description.tex.
>>> It should be part of same patch series as rtc and net so both devices agree
>> and reserve necessary opcode ranges etc to utilize same infra.
>>>
>>
>> I plan to send out RTC spec RFC v3, which should contain all the agreed changes
>> from the v2 discussion, in November. Maybe the net related changes could then
>> be put on top of that (and become part of a common RFC v4)?
>>
> Sure, we can possibly converge before posting v3 itself so that v4 does not require rewrite due to net.
> This can be done by drafting v3 in such a way that it fits the v4 scenario.

AFAIU the only interoperability issue which was brought up in this
discussion so far, for which there was no explicit agreement on resolution,
is how to encapsulate RTC messages in the net controlq. 

For this I propose to encapsulate the RTC requests resp. responses in the
net controlq pseudo-fields command-specific-data resp.
command-specific-result. (command-specific-result is being introduced
through [1].)

This handles natural alignment of the payload in a way which is compatible
with

- existing virtio-net controlq commands (including those being introduced
  by [1]), and

- with the standalone virtio-rtc messages.

Best regards,

Peter

[1] https://lore.kernel.org/virtio-comment/20231009013135.55890-1-xuanzhuo@linux.alibaba.com/#iZ31device-types:net:description.tex

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

