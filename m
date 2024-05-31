Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B47156223
	for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152422; cv=fail; b=bgWPcdCG807M+7nu52mwwdBz1PeuxxBnETqJgUpkEOoIQzB1bTpz7XiFLmXDJAtcsLXMpfjokI719nMl1IKL/4SOWFbfyxaBQcEpFlBiJdUoljZDjYqUzTv6cTU2f2CEn97Wz0oghutb4Xu9/XM3UwwdD4zLa0zVaITA2KLGlUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152422; c=relaxed/simple;
	bh=eaxkwdLWN94Zu4Lzo9m56xFyr5U8gHm1lPaHM5BlIwU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Yepcgy94lzuiWNcxRu1gZw30LpFI5B0vleIm12xcGZQj2KyeQM6dSl16duhQ2LvTn/XIFrYVrYiZFLaO2tym/RXrCo0fZsQtbtNsw97l0ASxV0L7QSZ4VF1wnzhb4VRp94b1NENOhT+YFU5GpdOk8FTryp14L3/iIrBpTtgOYmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=ldjPvcyZ; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="ldjPvcyZ"
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.10.81])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 9A1A21015795B
	for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 10:39:27 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.162.72])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id B29BF10000D9F;
	Fri, 31 May 2024 10:39:19 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717151955.157000
X-TM-MAIL-UUID: e64ed511-89cf-4c52-81dc-fa345240e2a9
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 26744100010D2;
	Fri, 31 May 2024 10:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaBRHrCAHHIk6Q6OcCeh+Aj5YJIdI93/IaLc8BatVrNgZK58qXDm2OOSO/YQ8wW5cYOrxdUV8gVHHTuAT8lUD8Cpph6RasAUsuqwwLPyY51P2FyccQBuAI0OjbC/20dQqJGbpAuWLxyw1lBcl+lUmzl3GA7i3OfSrpeUeLlHQ7XlT9Nk//xFkKuXS1BJzZC2wE73YTw3AZN0fi2uhPnw41IsoMiiLz8eGha0wjgJzhd+5gr8PI/dQdYjY8ObxjbpeL/ae8sGkPTkAizoR8ZTnMxICzkUDhHFSLqdh8A93lP7WrvdJbCw2MlilFiOG2+IvB1ThAewMx8DYCybqtqeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mym9GFZv3niYMyOCiQIZ15OE4Ym9FDChbbpI9M3J338=;
 b=bBbfrskqfLAsmVAlTX6gH7HrKwaWFq6VHJuDRlA4/qRJdxbxOVgkK1K2yPvLoanUiNVFJeRfWRf8ULH4oeXzqDGqBmuLB8q+H5T15RR5UcAfZ3UqMAlM+A2QcChu/twQ626lHJgy9AbimBZsHziv898vmRP/N1rKXiVclBCZ1HMtp/Fz/Xh3/egmCMfQImeo0yykWVIeVYmLfeBQi72S1ktYnPq3y5Wxs7B5v06E+uIZ9hgNrhih2siwPFvRmQJLfegcV4/74nn5Y7kmDTW/CfdGyOJFJBRx1XjTRpJ4Eic4OZDjzIRuyKfTvXi3qNFgQD5v0rU9J915hoy2GNL4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <b833b3f6-fad6-44a0-a67e-f1cedeeba03b@opensynergy.com>
Date: Fri, 31 May 2024 12:39:11 +0200
Subject: Re: [RFC] Process to request a vote for an issue
To: Cornelia Huck <cohuck@redhat.com>,
 virtio-comment <virtio-comment@lists.linux.dev>
References: <87plt6nlq4.fsf@redhat.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <87plt6nlq4.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR2P281MB1655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6720e218-20b9-4cab-e906-08dc815de9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXlUZ3h6UWtJU0EyeXpKSWQwUTBzZ1JFUlpJVWp2NGFYa2VOSzBCaCtRVFVu?=
 =?utf-8?B?Qi9DTUpObnNkUjQrM1kySldJeXAxN0dSMTFudVJlWGZIUnNmcmZsd2FoajVT?=
 =?utf-8?B?R3ZrSDFQM0NpMnR3WGx6Z2Y2NGh5ZGxTV00wbEt4NDZGa2RTaUlpRnZxM3c0?=
 =?utf-8?B?OXZ0WUN4TExVTnI1OHFCcFk2N0F1em1waSsySUcrSlVoQnN1clJZMWxPUlRk?=
 =?utf-8?B?b2JxRWdvcmdsK2R0WFBmT3hqa0FYZFRCWVlicVhWY3RoWHJsS0ZBYmZHc2pJ?=
 =?utf-8?B?b0N5WEtGZk9VL0c1UTdJQVdIbFl4Z2cxUXB6VG9DcU9MY2REWTArZWlHR2N3?=
 =?utf-8?B?RVpWWVNnTlRJZVRsTXFCZDVoRmNobzl0K2dkc01xM25GYU5ZRzJRdHltb09r?=
 =?utf-8?B?cDBielI0cGU5ZWxreTFqNndMUStDbk11cE9idjFNSW4xUVluck9MdTlCZi85?=
 =?utf-8?B?cEY0M1RwcjczYytGZkQ4NW9pV1FTR1d2T0ZFYVAvdTVreENsOS9YZ1djRWp5?=
 =?utf-8?B?ZUtvYlZTNVd5dThmNUNQL2c1U29sTEo1WjRTMndGR1JUVVc2NTZrRUxsRnJn?=
 =?utf-8?B?T2xDeTFMOG5BZlo0Yk11ZVhXRDBVUVp0enorQVhBeWxkZVBUK05TVExFS1pm?=
 =?utf-8?B?cXFOVHBUOTZxblZHOTNwRzdaWHVJV0dMZlVGbDlXSG9JVUJRR2hDNUhPcXhj?=
 =?utf-8?B?dFZ1cSs5OVdodTRaaExuMjBCYzByZTVDYXJnbTVpK2hPYTZic09acVB5Zy9R?=
 =?utf-8?B?eFAvUlBZb0NhVzJDYWJ0d2dKWk9scm5LakcyWlhoWk9NZkZOdVQxbGkzY3p0?=
 =?utf-8?B?TUY5eHA1UERJK1ZmWXIwVmJTNk8zWG52VXR2NkVPR21PRzlmU1Y5blBZb2Ir?=
 =?utf-8?B?SW9YUTBEN3NYR1o4d1lwR2VObW1Ud2E5SVloM2VDenFtbHVob3I2cktQaUQz?=
 =?utf-8?B?bGhPKzVKeVZ4QjI5NHRsbG9XckF2UHBURXBLUDhUSi8vUWxiMmRBcDdVaFVM?=
 =?utf-8?B?dzJsS0FVRWF3ZFNIV1N5UEFyNVNwUlNldmtBUDFodHlmcE1aRzNxWjVIK0Ri?=
 =?utf-8?B?MFA0Y21Wd2VYbTlnN2RCbGw2UE1NTi81ZFdZVzRCdCtucWNRSjVJd25nN2VJ?=
 =?utf-8?B?bnkwaDFKbEVvSFpJMW93NXRMQ1gyY2IycVZob2NkTFNCbWVlQWNwSXBMQits?=
 =?utf-8?B?Wm1aODN4OVl4a1J5TTFYUXN5V3ZDM0VGYmZkRSt6akc3NWcwRksrS0FGSkF2?=
 =?utf-8?B?YUZGMW9ybFlGeHFocU1GNzhVR080ZlZSRXAyNjNEQ3NKNUhLNUFoYkVTZjdk?=
 =?utf-8?B?ckVkbmUvOGcxSWRxOHRubWYyOUFVU1JLMldmTG5ZMnVGYXF1VWF0cSs4TWZv?=
 =?utf-8?B?V1ArZDhCcERoZDdQdUNrYTlURkdVOHJ5YllsdXFUM1pjRmRvUU16RE5kZmJa?=
 =?utf-8?B?ZU5wT0t5Mm53blJ4cWRiUHVwYVRWRWIyZjIvNkNYUnBBZUt3Z3UwaXl4OXRN?=
 =?utf-8?B?SDBNTk9EdkNkQmpnL1QvbGltazhlbk0vb1BoblgyUmxkQzRqaFdaOEI1QzJR?=
 =?utf-8?B?NHdKTjFFL3VKSmswRHZoTlZTckRZYmVmVDBTamJQVDdNY1ZCaHVPRlRLOTBN?=
 =?utf-8?Q?eoZX+uenjowqQHx0RZNco3U0q70VycjalDJJutZjqqGE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVo4Y3BPRnFEYmRuditMcFhXNnNKeDdxZTZjTlVTRFk3d21Pd3E3eW55QTRY?=
 =?utf-8?B?S01KWVdzd1RJVlJjY0VEUGpXTHBmR2YvVE42S1dwZTVzMlZoU1U0NDN1NThq?=
 =?utf-8?B?SnNTWUVlNktxNVFxS1NxSVpYWm80WEN2aFg4SmRaUWJabkYrQVZ5TndSSUJ0?=
 =?utf-8?B?TUlleisyOEN5blRjT1lVT3ZtcHZqYjlIZ0hzN0pFdnQwcGduTm13UmJxTWpB?=
 =?utf-8?B?Y3ZxdVJJcU13U09pQVFYbDliN3VvQ1pSajYzU0ZpRXd6bnM4N2JHTTNzTjRI?=
 =?utf-8?B?angwcXZJMWpETXZ4NUxqektlbGV6UjYwT2Z5SEdrVUE2VVZYTW1DZGNqZFNU?=
 =?utf-8?B?eTdrZjNQbGsrOVAzcUVQVXZzaGxoVXQydDl5TklQK3R2YVN1amRwSGxpcm85?=
 =?utf-8?B?bm9HMVZKbEFVY1VxNDk2cDQwUGl0TURUK1lnMklGcVdOUHpzZXVESkw4K2xw?=
 =?utf-8?B?ZFpqOVhBNVZGc3NEbGVvK3l0cnJzNEowZnRtaFJqRDcyUU42dk1QV3BDcGFM?=
 =?utf-8?B?VjVUQlBlSFRHa1hjQWRhLzUxRHp3WVBncTNhZ0lDdFA5UGF0RTFDSlJSUjAv?=
 =?utf-8?B?N3ZUYm9RcDhiTm9RZ3FCTFUwRS9ndGR2TldUMkdwSFE3VzNnbnY2Y3hLby9E?=
 =?utf-8?B?VW56clVBeXROUWRRT0g3ckV3ZTYvRXNoaXJJekhPd0FnYnphdnFleHN1T1c3?=
 =?utf-8?B?ci9lem9hTXZhaGh4aWxid2Q5Sy8rTjlvV1ZxMnRDNjRCekUrNGV1NS9ZcHhM?=
 =?utf-8?B?aXU4eHA4Z1lxci9mOTBuN1VqaktvV1VibmNHbEdVNCt2eS9YY1QrWXd5TGpy?=
 =?utf-8?B?dzRMUGxkcFNINVROeVhtTkJOOW91emNwUXRzL0pWRENqUDkrZDdTRC9DUXFr?=
 =?utf-8?B?dzZaU0YwKzV3QVYrOWJRZEE4T3pBeFMxVUZUL01yUWZrbHhWME5SOEdJL3Mr?=
 =?utf-8?B?QzF2Y05YSlVlNHZKdnp5RGFsNGdrUmpGYWhXN1ZUMnB5K3FKK09OOWF0V3Bk?=
 =?utf-8?B?R21mRmp5WHpHdktMVzluQW42cWRHUDRpK2RwMnkxcEJadUlPV2hYRG51U2dP?=
 =?utf-8?B?RHVFWWtxSHFZOGxRUUVzQzVseXNIa1NXSExDQjJOZE9abUEvN1huM3JMYUFK?=
 =?utf-8?B?Tkg4M21VbVhhSFN6Y2NDSDdDZUd6N21GRUxjbGlSWC8vUzhXdkR2TDNKL3Zm?=
 =?utf-8?B?OG5KTWhPSlhsVVdSSmhscXI0RmtsdnIxTmJVR2ZsZFcyMWIxSGdocGRraVNZ?=
 =?utf-8?B?eGRUZDhEN3I5TXpKK0p3T0I5dVEzbW92R1RrVlVib1ovd0lZMnhWNkcyWDdY?=
 =?utf-8?B?Y3VERjA5VFM5NmFKclVJSVVGamlISmo5R1RNV1dCdUFhdTZLVmoyd3A4akhy?=
 =?utf-8?B?aDFqdnhySmZOUVpIRU54eWVrQjNlYUd3TTMrdmd5clU5MDEwbTA4TlJVWVpy?=
 =?utf-8?B?WE5NOUd2L1ltcitPWXlHWTh4TkNuM3ZNVUQ2d21Vd0k4VVkzT0JiaUZDTnBD?=
 =?utf-8?B?SGd5TUkzbDZJQ05oL2pYRGZxam00Tzh5eC9aOFpZSlpxUVVBeTJHMkVpM1RF?=
 =?utf-8?B?WDUzWnZHak5GcmUrMXZDamRFM2lGL1luZ3Fab1RpMzU3VkJ0UTMrMURZMlQz?=
 =?utf-8?B?VVQ2WDhPcnB1Vk9JbUNBRHI2VjFINXJiSmpZN2RFU2pPR213YyswMC9nS1Y5?=
 =?utf-8?B?QzdMTlJ4R2JaeUFSTWNCUWhnMU9vSmhNYjZkUGp1SklGVko1YmNWR2IyRVNh?=
 =?utf-8?B?ZmdOZjUwZG90eWJ6dWdJc1J6c3MvV0ZGbEs0K29UREJhNC9YWlVpazcxZ1pw?=
 =?utf-8?B?alV0MXpEM3NWWUx3akRyNWUvdGgvKzR2am54aSs2MG1rMEx2OTQ5RlU2SEMw?=
 =?utf-8?B?YTBML0c3aW8zd1RyTU1wbHdJOWdGRmFyQW9QOTlDcGRPTnFmSTlZZVJnU1dF?=
 =?utf-8?B?ZFY2ZHBYTHQ2UjhrSnZDTmVKTUxvUTNXMStHM2R6anRWQ3lXa2FkNERtclIv?=
 =?utf-8?B?THIxNklCVjdOUk10OXZWZ2NsbzViODZkV3JHTWUvckkxVHNQVTFUUjFaa1I4?=
 =?utf-8?B?ZVkzK3FnTC9HZHViY2x3TWJQSlF3RnVxNmRTSHk4Q0N2cnJ1OEt5WWJTZjZw?=
 =?utf-8?Q?WQiLSpWjdUEAxjSvEiyo01B8l?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6720e218-20b9-4cab-e906-08dc815de9fe
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 10:39:13.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQpwGAa9KV36NsIvVGAN/+wnm82nz4k/Vri3WPSvYMW1Dv9QEtkCoWQQ6NfDjueN75OMl1a70GaZfDhk1RSIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1655
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28420.007
X-TMASE-Result: 10--23.196100-4.000000
X-TMASE-MatchedRID: gzVbiXtWD9tTzAVQ78TKJRhvdi92BBAunsSRXdX/K/t4Ke7EBZv1ozZb
	pOprJqv23Qw0gH5lrHLyt66ldRflrZLAFIcgZWso+mtDRLyNCFoSlFBwyvSaLvJgeLgc7Ld87v7
	BMdRZyXMvqL7iEiu1aDYiXJDHdUv1260XlhNBFbgsRn4AJoblTTCgTL4opfSyu1ZYcpwtZCqLsI
	84HOJoY0XnaOzs4kHj1G9SFzHsLmmFfSMJIbyR/iw5LYnP0VIDiWuvX6uqb1or5FUtBPH7Hu1xQ
	wyw61RvSpBpP3vjmzmlA8a908Iah9/SHCgUCHXvDH4m2ujwCtsKEmq2HWwB6iwDA62lcE2tZAaV
	HzwWV+FhS9a8uSV+8QzQrEPaLWj0m4h/LUfnHjVqO5BE8+h90l6UsWSgw8xYQ70F7tge5c7aSbV
	sRbJaZXkF330Mr086tkl5UCjV+s9cOnqpgy+bqxEuOqgkm3/1mVEKSAFs7pe4ssz2NHTRNaLevh
	caB750GTZsf6fQyic7+YHb7Xac1Vo7GmCOJYd1AqYBE3k9Mpw=
X-TMASE-XGENCLOUD: 1a0a6b22-2cb8-438b-85df-8ee1e7089917-5-0-200-0
X-TM-Deliver-Signature: 5BF419B994653A09B34FD87740379A8F
X-TM-Addin-Auth: FJFOJr8ge1irDqWNyE8e0RNuWeOHKOYvQDNbAERJBpD5uBs0HFhgPhA+gjH
	eLDznKD7sHpqCqjAGsPGbg7A34f5fUX9Gr3kt7wu8xPm5/ucVXYqG8hw+PXHSrGZTosKiUZw089
	sC///jLbxAITXP/QjA/GiTKTKVeWiJ7umqN1WmUb3ocDs43iPxaAYdaNPfcYvmqO8f+MhXdYIVp
	/hjR+6+YVTw6M5YQZ+gRxSWM50hBJXXkLnVd6P1ryCjVPD9AWhXlvE4fF/tcdJXOAiFpCQvxWUV
	vbbQ5MUb3KagMoo=.dMMbysXucCFmIGPxPRs26ABOQouFppZGc/8F1Wj2Eaxjw7mMUiQHnFGvZN
	VwtgmHnbnmUVotUpplMXgQmsvpvJE9xGeFdLu7NZ0zxSr6eBxeW/tY4/ehKaLFpBVWHw5OjtvEE
	Q+KwNbhSGjEzxG35MB83sg9YQ66DtXdhwG36BvrNVw6NCl4/+Ok5ByEBB6nt/jebMbVW+hkz/DA
	a6w5/+NmsI5lymWhWbsN82jxf3VwWl3DIZhZc9iJremSVZQT24axcFs4voCN27p2wWB2uqnnOvg
	cMPRw5MEjJltUkNaoE3Hn4TlFvIT0nPhhb0wet5xnoa5TZhmS1nP64QLygQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717151959;
	bh=eaxkwdLWN94Zu4Lzo9m56xFyr5U8gHm1lPaHM5BlIwU=; l=1867;
	h=Date:To:From;
	b=ldjPvcyZCYRfy/VdHPCN2Mfn5+tXBwAeFsq0xbSzlaS00/rX8+//qnrcgpRrMGcyq
	 yvUwo5KA33ca015tqP0EAXWJEupuYmY48OmUI6HekiXgLWIdjn4NoFrzlao++c+K+k
	 a4SyjwoQPTOFo7Mv2I3ULtvt6+4ZkeL9OFt8xD2hGzshWRDEqUuubkxjMc0rvdymLS
	 54wcRjwelIwIRJU2hdJPyrKBdlGuZQvMif6OW1bTBA3mXtwXExDalOcbtiCfze7WDW
	 0+icXr7fvJxjJL3xY5GXINVB/gb8GPU5+8tUNMhZedrnrmyf9J1m1+71sCTRMBY/C+
	 nA9lUa2omE7Fg==

Hi Cornelia,

On 28.05.24 14:51, Cornelia Huck wrote:
> [first of all: there are still issues with our usage of the platform...]
> 
> [Also, first discussing this on virtio-comment, as this is (a) where
> people who want to submit changes usually are subscribed, and (b) an
> actually working list, unlike the list for the TC...]
> 
> The current process to include an update in the spec is something like
> the following:
> - open a github issue
> - post a patch on the list, link it from the issue
>    - iterate through some review cycles
> - ask for a vote, so that the Chairs will open a ballot
> 
> The last step currently mostly happens in the thread for the latest
> revision; such an email is easily missed if you're not actively
> following the discussion. IMHO it isn't a very reasonable expectation
> for the chairs to follow each and every discussion in detail; at some
> point, it is much more reasonable to expect trusted reviewers and SMEs
> to reach a consensus.
> 
> Therefore, I propose that
> - request for votes be posted in a new, separate thread, referring to
>    the version proposed for inclusion and ideally containing a note on
>    who deems this proposal ready for inclusion,
> - and those requests be clearly marked in the subject, for example with
>    a "[Request for vote]" prefix that can be easily filtered for.
> 
> Thoughts, comments?

Could you please specify who an SME is? Does this stand for the Society 
of Manufacturing Engineers (sme.org)?
I tried to search the virtio-comment and virtio-dev archives, but 
couldn't find anything relevant:
https://lore.kernel.org/virtio-comment/?q=SME
https://lore.kernel.org/virtio-dev/?q=SME
Also not in the spec repository.

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com
