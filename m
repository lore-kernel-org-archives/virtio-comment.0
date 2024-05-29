Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36853802
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981176; cv=fail; b=CUhLsGJwOjf4dEWFW0NoLWa11E/eOFacKX75WgPiW9WgHDViFIyj1BXKen1H6X7YcTL5rrc9CIIjzO6Kru9Y5ggSKwPU/8RxfqPNLkFya4EYrcpda8dOgC+ipaPWbm24GOI4GiMLHvcLF2BMb43r2lwpM6z/R+UIZmf0K4ABHEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981176; c=relaxed/simple;
	bh=5SnZ6B5TeLcGY1XrcI09SLt/9pa7zQ82FtX6zeqg61k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eqzdrtUOM9uqhHtuodzyPMxUGsq8RNJaidpliTwB5pXuY216vUGsMZcSLKPaZF7XYtTT+7oJaje2PKeMEFORam+UPcnKaEAuLh9Prf69ZAk3TXqr2KxtRgGfbI6csyZP5oE6eIObuS2KIrWU9WUzG9d6APUOv3NVPOb6+WUkRyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=qybM7N0+; arc=fail smtp.client-ip=18.185.115.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="qybM7N0+"
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.10.226])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 3C5E810047FCD
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 11:12:45 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 13C0610000D15;
	Wed, 29 May 2024 11:12:37 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716981156.705000
X-TM-MAIL-UUID: b4bb0274-0bf0-4046-89c4-4965b1737ee7
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id AC62210000317;
	Wed, 29 May 2024 11:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j631jOoL30LpUIt7P8VQ91IF44OAVfvJ1OFlDY4VDBLW4/LWQrAvoNP3f2TdHaMqQ5b7XgJibG4FV/UqD7KRF3Bk0Vq75uPOtZL+IZ/5ZkrcA2rCLLvS9V3vn6s/PzXcja02CkQ1fbiaVCA/YwlNhHE3eoo0S3hGtMeRGD18d+Uk5jqhkeWFOKdms3xdoqKglkoRzh2qNIkCS38xIx6sGKuvJyVgjVzaYzp55XKUSn/0W/2Jimr0S4sKGt1/ivCchvD3vDaZZFHNmd0CJOPPLn3MOYZbtqaBw8ABdKh/5rScwtsDvIF3yIoHIWMAfD7FB4h3U1VDZTInLhVdYeB45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRtAPolIbTGfQ2X+UQ3I1H9HsfUV3n4ghZYsw4UfJw0=;
 b=YC+5MtV8KHa9hxldDkFJaVyG6PJ4RSgQKGjfCq/B15j2bI9nDQTpFiag08QLBjYKZsnnix9yJZee7zndel9tHIt6gq8T5tEei1MsIXYaNiMAuAj1O56emhePE9DO8sPobNcl4SpFLWb59FkjIRVMPNsVyh36C0CpEuHg9Ooy5X//iDZBA3VISIg2ap6+NgCaW7CfvcPdcH07Zq9PIVY15pBxkNJqTeustrY/PN/RaNoSR99XqKbau0LtNaQ+2cqZ8WJIEu6Smn6aCeNlimDzZsJ2QsNE1V9vMExT+GNQgDJLdVoxfe21ssoQfUKylgSyexMhX48+qCKu1ZeHHdj0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <55b0e4a7-7d79-40ce-a47b-32b457f1ab97@opensynergy.com>
Date: Wed, 29 May 2024 13:12:33 +0200
Subject: Re: [RFC PATCH v4 0/5] virtio-rtc: Add device specification
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <b4b198baa16b492a1273131e80d3f80a08835b79.camel@infradead.org>
 <46843279-58cb-4ac0-a50b-998ecfcc2c30@opensynergy.com>
 <019bc484576f978a0b8a2eb62c56abf27bfe730d.camel@infradead.org>
Content-Language: en-US
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <019bc484576f978a0b8a2eb62c56abf27bfe730d.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::6) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BEYP281MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1238d48a-d8a9-4750-6057-08dc7fd03e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODZKSGRPMnJ4TEpCOHZNc2VSZVJZTHpGYjVyeXBlM2ljNmVFSTVidFk0US9M?=
 =?utf-8?B?SFV0aWplcHB4Q3hQVkEzMVJPMExpREN0TTZtNGd0VSt1elpFTm8vTWtpVTY0?=
 =?utf-8?B?SUtucGpGVmxlVjlzMm8yVUJqN0ppV2tVYitUNHNwRFF4YkJodkRmSWlOOFBw?=
 =?utf-8?B?Qzg5N3BzRXNaR3l4dzBNSTFJQzV6M0tvNHNkZG14MFYyVW8xTXVqaEVtZEZi?=
 =?utf-8?B?V3pKSWkyeEpCRTlxdjRGTzlOVlJXOTJNamM3M0tGUmkxTlJnbzMyUmRvUGh5?=
 =?utf-8?B?dHJtVmtpNW12U0lEWElRNEg4bkkySkw4WWFRRG5JeXg3Z0FCQkh6SFV5Vnlz?=
 =?utf-8?B?Zkc4a1hseE92V2hLR05mU2U5cU92VHd2UDBSRm9zM05XenNvcVpwYW5aM3pm?=
 =?utf-8?B?cEtSNGhvWGtjN2djV21rSTRGWkhPdkp3WXdFWDNjWVhPVjZ5Ukc0TnZoUHN2?=
 =?utf-8?B?SzliWEZ5N1k0cVBTVHhmcWZJMmI3aXJBczhhR09ReTRxZDBzZ1pXMjBhemNu?=
 =?utf-8?B?SnFUeGpPRWJxbjNrcS80ekNBeUFrUm9PWlErQ21heUNlNWNjdjhETmYrWGxK?=
 =?utf-8?B?d1pKUWRnNlVreFdPSGNrS3dEQ0JJekdVK2tQMHllYnU4VERqdWtPRnBKeXh2?=
 =?utf-8?B?L0x1emM3YytzQVhMS292WDhjKzVTeDBOenRCeWg5aUx5TWpuRFJyVUhrbDZN?=
 =?utf-8?B?cVM5cjBTT3dGM3R6cjRWWEJtZkd4QXpBcVZUS2wzV05JMU9LOElBd0NCTGJD?=
 =?utf-8?B?L2FDVHErcFhlL0JGUW1qb1ZzRjh6STZYanY5ZFFHdk04M3c4b3UyNERUUnkz?=
 =?utf-8?B?Q09rNStDdjBjTE1vN1RjTndicHl3MGZ2ZUh6UFpWcjNveGNGb0p3ZnpQSEdS?=
 =?utf-8?B?dkUzYWk0MktPdUxKclNXNDlib3N1N0ZnU3JnZEx6Z2xzZlFtOGdHcUlpVXJQ?=
 =?utf-8?B?a2xWWXNDSDhNV2lwZVk4d0lvUXBRZGRZOW05Nm9kK0VGclpaMThIa1phNTNa?=
 =?utf-8?B?a3NscTJlMUhyR0pkREJXQWNDcHJmaVh6THhRTVdWbHpHdi92M0ZKWXEvWTFC?=
 =?utf-8?B?S3dkUmdpcUw4b2pzYk5mc3NHWVJPZGZrTVBPbGlJenhZMFo2UkFXZzZveEl4?=
 =?utf-8?B?dVJsdkc0akVBVkI0OHBCdzJGTnZDRjZsSmx5NjBoQ1h2aTErSGJGdWx6cExN?=
 =?utf-8?B?ajdXWnFCMGd1MnArWlBXT3YrWExpRnB2VlVvY0x2L2hJc3V3SjFHRTZGM0lN?=
 =?utf-8?B?NVoyRjBPVHljYUxpa0ZUSDhPT2tqSmRvSlR4LzZVN3E0OXJFSGo4bVJLTXJm?=
 =?utf-8?B?ODhOV2J4TXlvWWZLYnV6Tm53MDBqMnhJZi9pdHNqTGJyN3dueE1vWlBMWmxv?=
 =?utf-8?B?bE5LQTZGTjltWEZLcGhNS3B4ckV4TFlhVVlBbXo1bmhPbGE5MElnRnJFUDFU?=
 =?utf-8?B?bzM2cFE5NTB3eHMxWDU0UmNEelBxZDN1VkN2cDVxZGNodFYvQVE3Q0Fvbk9m?=
 =?utf-8?B?WWltbThDOE1LZjU5cnY5eDhGeGJoMDY3QW51ZlJoWlVxNG1tUmRxS2xOL3RD?=
 =?utf-8?B?SVNFb2VTUkpvWEoxdnJwK0RUYkRNREI5bENpUEhJOVNDb1c1d29WWGJyanE2?=
 =?utf-8?B?akt5UGgxaUJZVk9hYmc0UEVyTDFmN2JjdTNtUzJ0YjFvNE9KQmNWNFpISVIv?=
 =?utf-8?B?ZEV3dnYwd1RxT1BHbUUvbEFEZlR5ZCtaVk9CeWgwNUl3ZnBVNDFuVHZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUlKQnFadCt1K3NrY3NvU2htNThWMWc4bU4yTXhRTTBDdS9CYUFBdnhtYklP?=
 =?utf-8?B?dVpZeXBGeUp3d1A2SHVKZXdqN0s3ZnYwdXJCVzBkbnpHTHBDdUZtNFpUTU4v?=
 =?utf-8?B?aFg2WmthQnBGdUYrb1hXakk2RURNN0ZWdVhCQU1TTDlWUWo2eGh4S2hXYW95?=
 =?utf-8?B?eHBHb3ZWbU5xenRNTVdieENpbzgva0tva2VWN2F0ZFNZZjh6R2lBajVJWXdi?=
 =?utf-8?B?MW9GU3ZyUlFVT0ttMWVMMGN3Qjk2OWVaMVNsaEJOUjl2cFZjMmg2QWN3RU1t?=
 =?utf-8?B?MWZqS2JrVE1URGlxNlMrSDhMTnRucFIwWXE2Ui9ZY3poNE03c0Q4SXU1aWJC?=
 =?utf-8?B?TE9sYlU0dEdoMFNjdW5zd0hkTDhzRndVWnpWc25WV2dIdGJoWm1BakoyaWRJ?=
 =?utf-8?B?cUhMOVk1TGtJRG1GdHVzOUcrSXpRaEhoRm9PSlVLZGp6MXV0OENTRzhlNDFj?=
 =?utf-8?B?eUN4S3M3UHFVKzRDeW5iZndLWWlCeFlKbzl2Zkc0K0J5bFB0eHBxbHNFRzBa?=
 =?utf-8?B?L2dlVUY4NTNUQmlBbWlGc2FyVDNTRWQ0MnBpNlBEK1Z3L2pUbG5FOTZSVEJP?=
 =?utf-8?B?cHA0bG0wSmtZNFVHQStLa1J0aHpKL0hzWHRodGtxRmtiL0hsQVloVThBZ2s4?=
 =?utf-8?B?ZStpeVg4RGQ2NGE1WXdSUHRwb2xSV1VpeGtQUFNVMzVOT2ZkYXlrdUQwT2VI?=
 =?utf-8?B?RTB5UEU1NmJoa3NGRTA1SHlTeFFNaUcwU0EwMnJETUMyN2dzdXF4V2d5YzBu?=
 =?utf-8?B?UWJ5aDBPVG8wdEpPaFN1RDMwRENWMmdDbjh5MzdDWkhEV21XcmJmWG5Heldz?=
 =?utf-8?B?Y1NFajB6UncycVBWcFRLL25ITFJyNGc3Y2lLbWwzN1VVWE9ZQjcxR0JiTDVT?=
 =?utf-8?B?MUdJUERvSEFsVS9TWFAvaDVqT09PM3VrZWwrcmhrUzNQcmEwTU51OXF6ZWZX?=
 =?utf-8?B?Q2N6cEE5bEc5S1lJOVVmeHdHeDRJbkJVai9kbWlnVjNXd0ZGVEd0aXNRWmxZ?=
 =?utf-8?B?ZEorTVlGRC9ZOTI3NmxEWWVyakcvWGFxMnU3Z1Q5dHhhSHpGQzJRQUc4YWdj?=
 =?utf-8?B?c0h1WEpnN1ZIVU5UVUJJSkFFQUd1VEFiZUFmMDlSbUFlbUlxK3U3dVVOUlZn?=
 =?utf-8?B?WlErc3laK2lEc0V6YWNTWklZN3FPTDE5a3BORjJ4ajBTYlNuVkQ2bElKcVZz?=
 =?utf-8?B?NllqQ1hTanN2TVFjV0JLNTNva2ZYMzVRclhJOXRrelN0SlJST1A0dFI0UWQ3?=
 =?utf-8?B?U1lZQStRWGR4SDZhM2xvRG9lbkt0OGk5ekxacE5pMk9vU3hac2g4UUJtYkcy?=
 =?utf-8?B?L3RIbGhkWGVFQlJMNmV2YlZPN0k4eE5WS0wwMDdYM0dxUFpWUGNoSXNBcCtM?=
 =?utf-8?B?NzJsUzFvZVFTblFlYldyMVloWHRuRk5SNUhBLzNRekNqUTNObm41VWtiR21m?=
 =?utf-8?B?ZUlJMkZmYnAyZm1kbjRabHFzTGNTY0g1TURKamoydHB2bDhHdkRsZ3VTODhE?=
 =?utf-8?B?TkpodEVGRzNGSmd5SC9kOTNBZjJpNW9EdjFwaGxyVTdiMnNQU3JjREVzbXdH?=
 =?utf-8?B?YkRkV2tzQ2trdTlTVzluNkRQdEc0ck15MFRRME80OGV0aFdtRXhIVFAzamkx?=
 =?utf-8?B?NmVvWWtwaGN6SEZFbkNXNEtHRmJTaGJFZ2FOaXF3R3hoOEExajhTY2lLZnpE?=
 =?utf-8?B?eW1FRTZYN3VLNTZzSGwvK2xHazhyckJNWVFsVC8wV1lzWWgyYkVyNnFrOUpk?=
 =?utf-8?B?RzRyTmJPaklSL3dkUlZaRzR6cWhVZXhHdHNzVjNWbTlOd09MQkZ5L01OU0No?=
 =?utf-8?B?MktiUDlibkNmRngwOXpaMmZHMHpFL05mODg5NzBmT3grTlRzK0QwYm5kUzlm?=
 =?utf-8?B?YkQ5YWE3NWVRVk0vUElvUytzMVdCM2NpRVlGWXcyRkJKU1VzTks5WnlEWWps?=
 =?utf-8?B?clh0U044OStNV09YOUxnenpQK0Q1T3BsR2ttdUk2bXJZUlFEaUJaRk94N0Rv?=
 =?utf-8?B?WU02cHFvTTBqcjl0WXQzZ3Y0RU1hSTVqNjhYVyt0QjUxSUVjMFVkYm9SYlZh?=
 =?utf-8?B?cUNIZjV1THFBc0xxOStSeGdkdFNwT1hveXRxdi9xVk1XUnVaU2hwdkFIRXJj?=
 =?utf-8?B?VXN3U2JYQUNhY0NJa2hNbU5pdkhwT2FYdnEwNTU1ejFGdmJwYUVDMlRMbVJY?=
 =?utf-8?Q?a05UfsMxD1q/99xQXI8NEXEoVHmiebO/pOAozpsU3Pz7?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1238d48a-d8a9-4750-6057-08dc7fd03e0f
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 11:12:35.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1h0S6xioELZVbNf8Ww3n2G7idkZsZOQsz6fNx9FmSfzFbTIFzceS9QCBhwQgBKtjly3LqLOchp0oLGdoirLVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB4495
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28416.007
X-TMASE-Result: 10-1.905700-4.000000
X-TMASE-MatchedRID: VPleTT1nwdT5ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWFPW
	JnavNRHKwUr7375NmjS0cJDxMXg4qdZSVIh2F3SJO9AbTF0WkMKgn19QHAlOzLG53EQ9QCTJQbC
	R9RgFTxdkJpSRsbItI5GOudnIATlu+qv5IZjEiWxCPQBD3xA/3aryV/2jRq/XEgg3cwDHl/1qdl
	V1LmbEfGwZG2qI2OBsl3eanjCn1nM7+YHb7Xac1Vo7GmCOJYd1w1tMVU7ONTxXkhg5NWVat3HHJ
	L41EjVo5trgwgfAEy6RO1HxH90pyg==
X-TMASE-XGENCLOUD: 63513d0c-87d4-42df-ae5b-d2abd68af9c2-0-0-200-0
X-TM-Deliver-Signature: BFEB889B8211256424C8E7186FCFEED9
X-TM-Addin-Auth: md0tCndFWsygxpfbFk1pPN6hrn8ryVPrPuUPLgCAz4SfVmAU0YpYGPE1Q3Y
	npTZFFMXsOP6qbBSvUmKmHXp31WA9n61hdVX4USIsxfQULrCB6Vfi2kizWJ5onXuRljJs4Vxst+
	2RkrjLjMtIwjDbN+VZz+/e+A6Tj8GE11Ww1lHojFK8MRdWNRceQf8heHbPCI+WMCaX4AEAm8J7s
	Aa+ZMx6tcvmG4VqxqGZLkOkbB7R70RKZLj7Sifnq0PCDrdGh9pBh5fQ7tAOuz5gpKPZ2kErWyAx
	AZc5OGNsMc+CTOU=.W9MYMoeSI2yMpHIjcOa+lTP3vfdSudGFEl+wIsnyNTWHz4UOGkE7eD1k0S
	KYF5hFwWtT/5P9sKMjOMuNe/cJSpH8V5DChqi5G6bPKxz4h9yoh/AuDAiSD6oeNym2bSdF+GM2F
	O0foMBLfBm1+fnbZbu1U4A9Q5z3XJ7dVwWcNf+bD+qHZ9XU2D8S6oSTBzfyKP47D12sSWCS5VcM
	XE2K6qwlMUXHu9bqa4/3/iWTYxLdmvVTerhY+4r1RVooQ0e5FF+XcHs4J+zeASCuJLKPw19a2dV
	PJhdxGhc/F+xePLD5Zi+GCXcWFaxq0uzM2bOqM1gwnv+1hIXBv/x7BoEfEA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716981156;
	bh=5SnZ6B5TeLcGY1XrcI09SLt/9pa7zQ82FtX6zeqg61k=; l=1080;
	h=Date:To:From;
	b=qybM7N0+NAmBX1cV2/sAd+ro7cyyjSvOCbJcrMXS+L9aAku3J2UqLnvTY5BbUKPEV
	 v8a6onNklGknl2rvONsa0/xoJz1lAFhmQiPsCDxlnwQBmAb2yhyPYTL1gxuVuZiCux
	 KgNfKTmI6ad9TiaJEU2X/+mObyPCT6xZwiZ6QSOn8xBk42LM9PhnppHnfaq7BUOWvA
	 PlXEMRSGwXUNMtdV/QNOgKmP87dPDYwLNx3Nw948pAPlCZbHRfLjnKEx05pEe2cqjC
	 vznRM8Nzr4Q0TA6PMLiAgpLIuvSJzbJNRJw2OctkRrM7n8LpnrjIOKc344hEZqchB4
	 9oRmst8V8ymDg==

On 23.05.24 19:49, David Woodhouse wrote:
> On Thu, 2024-05-23 at 17:26 +0200, Peter Hilber wrote:
>> On 22.05.24 20:37, David Woodhouse wrote:
>>> On Wed, 2024-05-22 at 18:59 +0200, Peter Hilber wrote:
>>>>
>>>> - Drop distinction of Arm Generic Timer virtual and physical counter.
>>>
>>> Hm, why so? If you're giving out paired readings of the counter and
>>> wallclock time, surely it matters *which* counter? 
>>>
>>> If a guest has access to both, how can it know which is being used?
>>
>> I think it should then use the virtual counter. But maybe there are some
>> corner cases where this will not happen, so I could revert this.
> 
> As long as you explicitly *state* that it shall always use the virtual
> counter, that's probably OK. As long as there is no ambiguity.

I failed to come up with an elegant implementation-independent rule of
when to use physical counter and when to use virtual counter. So maybe
the spec should indeed just keep both counters separated, and it would
be up to the driver implementation to select the proper counter.
