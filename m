Return-Path: <virtio-comment-return-7724-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3CC41513
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 15:30:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F28C22ACA3
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 15:30:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E096898683B
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 15:30:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CAFAC986838; Fri, 13 Oct 2023 15:30:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9C3B986839
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 15:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1697211028.569000
X-TM-MAIL-UUID: 91e2440b-7e1a-47d4-8de5-8407960179f8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTPHfRC0Ry+7Df+NhiJQ4lP+i0z6SDN8N2sG4VQbp9T0h8l8Tb5gLA7mpDCkePs1Cn9fWv/EfpiYWSGNKqwgXETDwglUrB7/mkMr+G1oyDEt3f0WsWAXZbV5OF8SLPj0SfNwehKaEcnMOx5+80UCL+GjKEda270PM0QZ/tq79JDwYoTEOFnbtBMZnt51irboB1+Z6LXKnso4zcYJa2haEVYmobjKSU4KoIOcujwCBPI3zr6uon5c9N8YKxflesCtVUb7espbW/yBtUR0tbvXqdY6LX6G8UI6m0f+URRPkYshBNZHvwcTNYw3+5ohv8pYuEAXNhj0Cspc3R+P35S9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Q/X9EgAdc22B7h+r1YkhUb/ASs05Vg4D3ujjy7asI=;
 b=LwcrhBcspK+6mcrqLJafGbdn0rPbq4OooY/5rA3q/SJemRtP4P14qrYC2svKua0+N5WGhkwJiBoZQXsQa8ENqQBIVMS1wklNifsny2waIYa/MobR8PHqJNV4uu/OJDKbigmmP76VNz2s5n70quGNqOc+WVDc0zM7KtJt92LrqbwxZJeZIH5esjUjJDMb1PAmxamG4R+LmqqbSpfdvPcEqzq4reVUgWhmyQ681EBNKIz9JIxjO38LKzp+QqAVp/q3xh/pkh3jt74MVUrW1dNcIXcjuIpy8Yn4umYiCNYyDcxrvLsS1ysgD8Y/rTeFr3OINtiOY1jk1rzG8T4uc2k0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <0c7bec47-8a21-4a1e-80e9-43740a72d427@opensynergy.com>
Date: Fri, 13 Oct 2023 17:30:25 +0200
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
Content-Language: en-US
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <PH0PR12MB54815BDBEA7E4DE1074B167DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::28) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BE1P281MB3139:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efb934e-99b8-45cc-cdb4-08dbcc01537d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Hj0KeYR/IMd8I0OfUns3RZWwmv3au6s0ycXXKiMGKzHhKqoy3F61fmBjHTUYxVCzFk1l10NbedsyZjmWDdBxpqxoXHXlHx5l9xsSkqhLjPh5Vd7qNVa9RmraOu6yhlTFpfPl+gBT9jmSc4cnBjhbwkQ9kYW9UsbXs+z9wBtAG6p+wfZY1HztapAMzuny8aNPZ1t7DIoG/K3gsWb/byRpBltMLTrKA6s7X3X9QJ5Wlci8tvKFosMwYxvgNsKbGV0bNE2R7XJxxdsNZj3JQDVmsbH51V8lZQXvXSZpyfCtP+c7yBZFyte0Rd4yBeKtCXF/nTQrvBt8ZabsLzU5kwKjitd5u+lX7i2zk8V6RsPsh+imumI7dN+tKV1sMNxfvkLIWlYGFA7j41v4YW8d5dl2xxSBLWPH4/2PCygAvNvsy6RNFB74eJVLlhCdfDsOeHXId7MKzUEjZRG842UHJGv2THsuHwdlgcEhSf/NJBxqO0qa4oqOqloAX1Kx08WfyF5LX8y0I4mt+N7vHciJe7VfX8641A3SNsdka4LthzwFvaUUbruGXda/rGGkjAYmz4O+qCfA2hcFXlNXq2hQmzIIydYWqj1YTIolhdXB81BKzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(39840400004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(53546011)(478600001)(83380400001)(2616005)(2906002)(42186006)(110136005)(4326008)(66476007)(66946007)(66556008)(5660300002)(8936002)(44832011)(41300700001)(316002)(8676002)(86362001)(36756003)(38100700002)(31696002)(66899024)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE1OYmxJN2FHWGZDVWcxTWlnOWRiOWdDbGF4VmpHRUI0L0RGM1dxOEJnQ2Uv?=
 =?utf-8?B?WTJVZ1pOeXpVUk1LWElyWlNoNFYxVmdzUU5qUnQ2aEhFZEhEOXlBelMxR3JL?=
 =?utf-8?B?TkxaZWVmck5XYjV4dnh5MUJWUjlDZjlCYXFkbHdiSjJaZXZ1bWNvS1hZTWk2?=
 =?utf-8?B?cEVJTHNYWUNoOURiaExWMTYwR1JxakJZVzNsaTJNMG0waVNhYXZNOGdFVDlk?=
 =?utf-8?B?bjNlOHU3SDBaWFVTSGpBdFVMWUhVNlgvK0JGNmIyYkNhN1FFM29NL2I3NEdW?=
 =?utf-8?B?Tkw1MDZUaDZnNElkN0dFdmlXQlhiNGVqZENTM0xucnN5R1NyRVFUVFhWV3pQ?=
 =?utf-8?B?aXhNT2kwVjBGaTdXU1FKTFR5RE5wZVBSWkFUeUNXT295K3oyWXkwRDI3U3A1?=
 =?utf-8?B?end1RUxONWpZMm9ZNkhCa2I5emxUb3dnK1dmYS9CeWFxN2lsV2RJU0pBWWpm?=
 =?utf-8?B?dDFBR1hpU0pqL08vR0VpVC8zOWRXOUF2VUN5OUVGR2ozR0MvY1ZsUVJOaVph?=
 =?utf-8?B?RDNTanFGNE1OTWNJRjNTV09IZ3hkaWlyVDdySmtKYXA1MWtDRml3SkttQmM0?=
 =?utf-8?B?QkR5cG5jTW5WQ3JqaXNaMmt2ZU8wN1M0Z0RXcTh0YXdnSitueGYvRGZxZy9V?=
 =?utf-8?B?SU12SVBVbmpaRVhxaW95dmhWSGlET0R4VitISkJqMHpOM05MeStUMmdhRm51?=
 =?utf-8?B?R0F6djJlVEU4TTRVcm9Bd1BrVjEvSUlHUnh6QjREbzh3bXRGU1p5QkZNVTlX?=
 =?utf-8?B?c3dWZWpNR01lWEVIdk8xVTZURmdKakdqVUFNeHNaOHp6NlB4V3VvdW51d1NP?=
 =?utf-8?B?YldnMEltd0ErbDZNWjRTRmVOOWR3S3dTaUZDb29XeFdXZmxITnBiS1BQQXk2?=
 =?utf-8?B?ZlBVWnpuYSsra0tsU0JyTTZ2OHpHUnhnTEJaQjVOUnpVajRpd0VUV2RDWFlK?=
 =?utf-8?B?WlVtSU55QTRqWWI0TXZlZ2k2RWVYaGhCN0hxRWVzbXBvWW1TQmtNa050MFNy?=
 =?utf-8?B?amV3Q1hhTERrNXN6MHdNSHlpSW9UVW96aTVlNnNHZ2NRcDd3em5qNG1GdUNH?=
 =?utf-8?B?RjhCb1ExYzBhL1lNMkZSaWh6eFU3azFNMkdGMHM1MGlWQWY3TytSaTE5bGJv?=
 =?utf-8?B?VTlGaHBvVElYdG43YTR4SjN5R3ZnZ2xVZFFxeDFtTWRjKzNNREcwM3c2dlND?=
 =?utf-8?B?MUdieU14aDZ3Z3U1dUxjcUpIdEJ5aHRJaFhFOHBydExQSm4vazhaQ3h1dDda?=
 =?utf-8?B?SkRycm54TEplT2ZUQmN3V0dGbHJtMWxEMUVyK3hzSm9meFBodzFaUkNvRmtz?=
 =?utf-8?B?L2grSTMvb1dTb1pTdEdPZTdMbEh1UGptNXREWFNOVFZVM0YyVW05UXU0T0ky?=
 =?utf-8?B?RVpVTzYvUGFRaFF3MkhaZW5zbGhxa2h6czRlMjBxL1pRcW1UZzZWUWl0TjIr?=
 =?utf-8?B?NytvQitNRXgrZHJCQ0JwUDJCTXlDOE92ZTg1WFptL2JnenlTRFg1ZmVaQjZo?=
 =?utf-8?B?d29qTGwwTTFwOWlXa1hCWU1Cb0tSbUtiMWV0a09CODZxY2NiTU0xbm9WQS9u?=
 =?utf-8?B?UG0xN0o2MG5FaGpVcVNyWG85WURGdkIvdVZ4THRjaVJsaDVBb2NNaU1sQTVG?=
 =?utf-8?B?OUNhcWJYZkJPUGhvbzFFbG1IRlpVTklOSUZlb0VKVmFSZ3FRZFQxckM0aXcw?=
 =?utf-8?B?THZDd0ZjQ2RhNC92RWRPYkl4L3VFckhybzVGVFhxRHJZQmQ1VUlKdGVoaDRP?=
 =?utf-8?B?QUxDeW53SXFSbmdXWXJXeWVqOHVha1ZJV215VGlrT3hUak5ZL0xOVGhrSFNL?=
 =?utf-8?B?a1N1YUw5M1QvTnNSanZ0YjI1MmZMa0dhZEVNYU5Zb1BTK3R2azhSb3NuQnpI?=
 =?utf-8?B?b3JQdEw2UzkyRTlES0JHTk0ybFd0NU9PdWJCV09BVlUyOEZBakp6cW9BVkhw?=
 =?utf-8?B?Y2c5Q1NweTNnRmRLUGxOQ01jUlA4NVoxeVI1VHkvY2FZakRKTGVldVFXOEh3?=
 =?utf-8?B?SGErcUl5bkF6N0VKY1RPRlA4T0VSa0VPR1M0NURROTBsY3ZjTUx1cFRYNmNM?=
 =?utf-8?B?WmN2KzZRZFFPZmpxcHFNd2s3bWhaRVJ2bkc2c0ZqQTFveFd5NFNKY3N3OFl6?=
 =?utf-8?B?eHBSdGVvSUtLZnBmU2h0SnVYbU9ZalVDVXNuOStsSU1KcXV6VVBOSzVtUnI3?=
 =?utf-8?Q?AtYxSZzZB82QByR7vy+Wju9qqTgFZ+x9wG15vQqAQPre?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efb934e-99b8-45cc-cdb4-08dbcc01537d
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 15:30:27.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYC64IL+S5gnC9DPVNMHuE6iKkSWCBJDUb8DtbgSwdiNfBesH+1N1DE/tyxRMrjqsJ9UIjsjftpaU0jLTWEr2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3139
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27934.000
X-TMASE-Result: 10--27.132400-4.000000
X-TMASE-MatchedRID: Rp71wniPtoP5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxopD
	1fUwav/s08q4PMUbAPjqbgLdOzv+hsGCQMGZxZ96Wyx0lCurExpWEpmiB2wI24kWhfwArNwDtk5
	AJDC2NoFhbKuwJkPkeN/G/99j10NnqXznQZPTNTgJ9830SX03A1pMWq1GqY9jHyNEnetUnYIVzW
	aohW2+5HJNU5HQ7ekbK0/7K6bcv+4qviA4Srv3FlrnBGaGznk0kXHxUEanQfYS4dPOs4ek9ffff
	h8//DW2zB/DvEFSH3QvLlSeI2VK92GKrZr8rbgFjTQ8guCmq1vuB3lKociGMp4zNUsxUVyfZUBa
	NU33sRCst5ABKIWDsbEpLU4p86Vd7WQ6WZTVoOAjaco3SnA/ATC80pT88ZyZxlsGA6eTSFIqirY
	F7amZuiJVJlhvrDIUTvQkOmp2Nh9TEzb6emRzBbEGwwlGI5qhJ/4tLvLYXKQ32MNYHthSk398qi
	Blns1LmB1hasJH7RtOiIsMDkptfEb9Nv8XZH8e4SJVL9/THkRlA1b7yNeDy8d/JSkHuJ0X1PyfO
	EjuNy02vloDwxXReeNlU9LK5MHTGCPnX21M5x+Rj0jujuSQmnJ8bM38R9gpJsfJJdVp3fqvngkj
	HjojpAP5R/zL3aImJpK4F9wnIiZiyuQOZndK/bpcTKsMs1ZRIbZSWXZZ520=
X-TMASE-XGENCLOUD: 28514b68-f395-445b-bf49-1effeb70c68c-0-0-200-0
X-TM-Deliver-Signature: BDC1C5A86B8E0E91BF09CA68EBF1D04C
X-TM-Addin-Auth: SA0O88Ew9Puh5sedIT10OpxvugH6sQ+Vkxu+sJT6CySNqvVlcLMgNxGENm8
	ihEzcdg28Uzqzce30STNjQYZIYG4u1saCHhFn44lLpXJTAZqyM+t5fyc8dfh8b5tFhuX7sj0ztP
	EmXfGTOJd7/3Eu+VVYg9mRSBvvtarFrBL+ygsHBQ3m5HEKYvRWPafM4vEX26eF0Fd78Mr1Ncgio
	+rMSIKhj47xEoVniroBHQtuZLAefcEIZFIMCAljn3QpNUaUoP4JD0+sc3pj4ADD36fJ4nQFnj7h
	ndyjvo+63lOw66g=.Xaf29XxiongTI4lObzYmWpMBy7y5we4l6Ifo489FNGHK8J/6uX2VCI3dj5
	6hx1C4fw3Lsvwk+DrwBiY6uUqZNa3gFqor8AtyMVKTnsG/kB8u2fx28HLle83V7oCr3mq58G/Xv
	JmhzKFreCy5dPcSqiRGnTdoV6f/20KEzb6Dd1+FWki/0zGYtZcrp//S4p6vJXvEj+3QExQ1yx+A
	FeoBOOYlK9DgX5hwZH+1sEFA4y1jisnDviNTHlr36SmPObDsIn+C13eN6JNuVDDY/WOyOf5qgu9
	xt0CyGp82rIt0lhstrCDvE95Ukybrw4RPKkyHY7rOCGFlWHe9ICOae14tgw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 13.10.23 09:40, Parav Pandit wrote:
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com
>
>> Sent: Thursday, October 12, 2023 4:26 PM
> 
>>> So am I missing something?
>>> In an arbitrary, interface, once unplug is successful, i.e. when the
>>> device exactly know that unplug is completed by the driver, It can re-use the
>> id.
>>
>> But this would require the device to remember previously unplugged clocks.
>>
> Not always, it can do when the clock wrap arounds.

Sorry, I do not understand the reply. When the clock id is wrapping around,
in the discussed scenario the device would need to know which clock had
assigned id 0 in the past to avoid potential misinterpretation by the
driver.

> Since this interface does not have the complexity of hotplug and unplug of the clocks, we should just keep it simple to a reasonable number of clocks.
> The 64-bit value is not hurting at all, I just feel it is built for unknown.
> 
> Any reason to not do hot plug/unplug of clocks now?
> 

Current use cases do not require hotplugging, but I tried to make the spec
future-proof.

>>>
>>> This would work with 8-bit too.
>>> Not that I have issue with 64-bits, but the use case for large number of clocks
>> under single virtio-rtc device is unclear.
>>> And if there is no use case, we should have reasonable range.
>>>
>>
>> Using a large id range might help in the future to avoid dealing with the whole
>> class of id ABA problems, cf. the above example.
> In my view the clocks are expected to give precision and accuracy, so number of clocks in a system that occupies 64-bit wide sounds distant.
> If it is used to not_care about finding the free id, it is ok.
> 

Not caring about finding a concurrency-safe free id was the reason for 64
bits width.

> Is hotplug unplug the clock (instead of device) is critical that drives the clock id?
> 

Clock id width > 8 bit was only considered to be able to easily support
hotplugging in the future.

>>
>> To me using 64 bits to avoid the potential future ABA problems looks
>> reasonable, but if others disagree, I can reduce to 8 bits.
>>
> It is not must, I just find the 64-bit level clocks a bit too much specially at hotplug/unplug part.
> 


>>>> With "unclear responsibility" I meant to refer to the responsibility
>>>> for drafting a spec extension for virtio-net,
>>>
>>> You can count me to draft the virtio-net spec for responsibility.
>>> I am sure others would join as there is common interest across multiple device
>> implementors to support it.
>>> We know at least 4 stake holders have interests in it in virtio-net (Alibaba,
>> google, marvell, nvidia).
>>>
>>
>> OK, thank you for the information.
>>
>> I think the arguments on how to have the RTC spec interact with the net device
>> are now on the table. Maybe the discussion could continue on a draft spec
>> extension for the net device?
>>
> I didn’t follow the comment.
> My suggestion is lets draft the spec _now_ that covers rtc functionality as part of virtio-net device and as independent rtc device.
> And if that requires me to work and draft the net part for you, I am here to draft it.
> 
> Would it work for you?
> 

Of course, work on the net part could also start now.

I would prefer if the net part could be discussed as a dedicated patch, on
top of the patch(es) introducing the RTC device (and referring to those).

>>>>> I would prefer to first try to upstream the RTC spec without
>>>>> altering the net spec, while trying to avoid conflicts with the net
>>>>> spec. Maybe most of the RTC spec could then, as a second step, also
>>>>> be applied to the net device. The responsibility for this second
>>>>> step and the related proof of concept work would need to be
>>>>> clarified. To me it still seems better to not share the spec and
>>>>> address resource problems at the
>>>> transport level.


>>>>>> I think the concern about redundant queues could be addressed by
>>>>>> merging the RTC readq and controlq. At the moment separating these
>>>>>> queues would not yield performance benefits, so I think I will just
>>>>>> merge the readq and controlq RTC queues in the next spec iteration.
>>>>>>
>>>>> Nice. Ok. lets have single cvq and related opcode range for RTC
>>>>> device and we
>>>> will place them in the net side too.
>>>>>
>>>>
>>>> OK. In the net device, this queue should still be distinct from the
>>>> net controlq, which has a less predictable usage pattern than RTC control
>> requests.
>>>>
>>> As you describe that with cross timestamping, the predictability is not
>> important.
>>> Or did I misunderstand you?
>>
>> Cross-timestamping is very robust to response latency, if the driver timekeeping
>> is good enough. When not using cross-timestamping, the response latency is still
>> important.
>>
>> The expected RTC control requests pattern is that the driver issues all of them
>> during device probing. For the net device, it should not be assumed that the
>> driver makes all net control requests during device probing.
>>
>> So in some use cases sharing the net controlq with RTC non-control requests
>> could still be problematic.
>>
> Net can issue when it prefers to on the ctrlq.
> Rtc can issue at driver probe time on the ctrlq.
> 
>> Plus, the name "controlq" isn't really appropriate for non-control clock reading
>> requests, which the driver might issue several times per second.
> Net has control q for query and set.
> Statistics commands are added to the ctrlq as well.
> It is single queue symmetric interface for get and set.
> 
>> Existing net controlq implementations might not match such a use case well
>> (the Linux driver is busy waiting on controlq responses).
>>
> Oh, that can change surely change for the new use cases. Should not be a problem.
> I remember there were some patches too to improve that.
> 

OK, so I assume you still want to use the net controlq for all RTC
requests.

Thanks for the reply,

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

