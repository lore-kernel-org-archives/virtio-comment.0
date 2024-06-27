Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E3187325
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719496312; cv=fail; b=evfAyRMxMaRRad/HfiXTeh7wqtuvsPF1GzV3rHsZPiMTJFgpnWsg2w4bn3BRwAxQHXBTVzI4ZsdGyrmxVyOKOfdnDAPCcPjGP2qs/41APn2weigLIr/NApDQuzWKQnqUIR8HzscEDCarZBC6CY78mCa+JW31JNpXQ17Tvdg1yDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719496312; c=relaxed/simple;
	bh=TwEetEGl9DBDr0rKPH9loY6LVipr7rQ6+QZUXq/83PU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RDD/gPf2n1ztCf41iqPva3L9Ve5GFYmzd9ewsQ7i233C7URuwWOGCWGTFUua4T8JoZL7FctNiCTn1Mb8bYiZiOLs8HKyYejo8eIZRrpJk9Byt6jazybiOpznR1A0TPPjxGZJRnCk0NWDd6Zl2JMlT+4wvPvFI4gdfz8mdVjrqRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=XH2b/rTe; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="XH2b/rTe"
Received: from 40.93.78.7_.trendmicro.com (unknown [172.21.10.81])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 3BC0610147250
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 13:49:58 +0000 (UTC)
Received: from 40.93.78.7_.trendmicro.com (unknown [172.21.173.61])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id D88E71000114D;
	Thu, 27 Jun 2024 13:49:50 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1719496190.516000
X-TM-MAIL-UUID: 9f46b5bd-79ce-4237-9098-bc2fb738b8c7
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.7])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 7E3A5100058F0;
	Thu, 27 Jun 2024 13:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8hvY3IiX6hNTPjQhpqM8wjsTGmkM1oFAxF32K+rBL5wgvBSKhIrIkrpDcVLIwKQziFeHHwxTrVVYEppSFhP8IQh9DA5vITLZbRK8wXVa/9jw2Al2IbcaYARGg7rX/Uapv9tqscVmD0RHNbDGb5jzEYhJJcxLldgkozD/yIU14pSnE6+Qr5gO1sxpdqt/RZcjbTQRVwNkOhfg7G1E2PjJojcgHn2INLPA1mV1OOJNhjpHzsGweBcZFZHYAczvl8ZcMwjcD/6W1Hpe7n7m6i/jqFqUiyEEKpjJP9gbeewXTwF1wCdqyRL3I/+/d1RK5U2IbkkUO8eWjDUoiGIP55hWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CoP5H0to8LG6M2/CMP6IyOOYeaWfHwQZWwoFD8lixQ=;
 b=AvXkLxQtMuVCdP4DnIcoxCzoU85DG7KDiUhbfRdMxU282i6eg82ezP6B9csZeGnOMBMy76o2nCipKnKVz2tVcpZn0SHEKyQDkvan7CCbZKsE3+jmWdB/nqsx0oMlOju62TxbjIZxs1tl1M9uEFx37U+dUW4in0YjV7n9AaN/7MEoUxTQZ0HVe9tDzEhK6IBZNVN2AfBO8+vgrnal1Ig2ONuDCNHCsbcrA7pnGwQPT5TmX0RQSl/gjWaZ52f1ACkkvzen7NpQ6oLaSWPOXL42nfO6j6t75nNIRMQouFIoGs+utTek802734ZBogDZE/AkD2NLzOkEX1gJQM38nHNNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <8595d22e-aa0e-488a-81bd-9191a678e4cd@opensynergy.com>
Date: Thu, 27 Jun 2024 15:49:47 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <20240522170003.52565-6-peter.hilber@opensynergy.com>
 <d9d0ea80934b024c7c3d8a1204eabcf40279a620.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <d9d0ea80934b024c7c3d8a1204eabcf40279a620.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::13) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BE1P281MB2258:EE_
X-MS-Office365-Filtering-Correlation-Id: 560bd731-c5d7-4832-60c6-08dc96b002c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjNJWmR6NTVrUUpvTXFPNU9QZmNLMUUxelVmaVd4TkZxbXFVRWtYR0hHUXkx?=
 =?utf-8?B?R3F5MnRmMTIzYVl0VFRhSkFEaGV1SDV6aUJKZUJqUHNLRTQ0RE5FS0Z4bmo5?=
 =?utf-8?B?NnhJKzh3K3djNU5XbjFvS1ZBeU1uRTlIdk1jN1JzOUZIaFZrbkJsM3VHWUhz?=
 =?utf-8?B?T3p3UFlWK0RsekF6dVVCMXVkY0YvVmNjVWdpanhsRWtOZmNDRVIxTks2dENT?=
 =?utf-8?B?SDY5ZmxVM283ZkZJTnNyc09GWENpT2VmR3lZMFlEZ2VXcTdKeUx1ZXFNNjdw?=
 =?utf-8?B?bDVTSndoVnEzZGN2L3EwL0NhS3BxQVNzK2FhdFhWVFF3RFhWQ0trcDg2ZGJ6?=
 =?utf-8?B?TGg5MU1DZm05YlNGVnJPSXYwN3BwOFBBUFhCdlRpVUpkR21GUHo5R0ZTVFhH?=
 =?utf-8?B?a1dzb2dTNmljTjhLN3d4ZlNvenUvYXEzdjNVNkRXRjhicWhFOXNqYVc1c2RU?=
 =?utf-8?B?d0wzZi9RTDQ2OTlQa0F3TnQ3WjZmUnREWkhpUnlxbnZBNXNRbCtFTUt5bVpM?=
 =?utf-8?B?YUhXU1VvT3pEQ1VBa29waVN5emZ2RW1kUzhMelUzY0VKMmE2UzA2dHFURFdU?=
 =?utf-8?B?T0FoNlBMNUkwRVVkekNNZzFCOVE2TklvQTh5bVhOZ2hTVVBHZE9sUFZqTERY?=
 =?utf-8?B?RUswMTJaWTFtYjVOZGYzeExDNWt3dGZXc09qYm5rRkFzWE1pbGxGT28vYWZj?=
 =?utf-8?B?WFBBcG9Xd1EwYnoyTndYRlpoZ29jdDk4QUNZS2E0RW1BRUczZmJROXJrZHh1?=
 =?utf-8?B?azg0M0pKNGxHNysvSGswRitBS0ZtT0IrS1hVL3VySG1KOUV6dzY2SUJScFVD?=
 =?utf-8?B?RkI4VzFZRnoyT01WRjE3SnRPd3g1ZkpVekdtWlFhUGhYNlRXMVpxOFFyRWlM?=
 =?utf-8?B?WVptU2FVdmRNOEZ0d0pTU3QxWDczaXEvbkxNdFU5YWswMk5wSGF1MGVUVVdW?=
 =?utf-8?B?d1FyRHl6dUVMV090OEluYkNuOHRSNkR2L2h4YnN3ejNoYjV2VXJCMmZReWRY?=
 =?utf-8?B?bGN3SjhwVm9yaVFsV2NVODhQVkJQV2QrelVnZThyN2xnSmNJUzRuQjJNNUZs?=
 =?utf-8?B?NVRtMnFSOTNoQ1c0R09Db3BXUzZsSDhWNkdsTnZLN0p4anVOR2p3TVFFaGUy?=
 =?utf-8?B?RS9oaVdpLytpZGVyTFJPUnd1Nk81WVRmNFowMHFSbEQxdGpYelZLYzFQamY5?=
 =?utf-8?B?WmhaWDdNREl5aWpueWV6WWtUazdPQVowY1FESzAvTDdBZHgrd3laQlB2NGY5?=
 =?utf-8?B?eFNIbEJRVTFBYURDT3FlcFJLamN2TzZ5Snhxb1RpK1hIL0VZL2Z1MHZZOVdV?=
 =?utf-8?B?dEltcjhtSDFQdnJOejZHd0YyMFFjdTZhZTU3VysxaGJMMUhjN3ZqRldJK1pt?=
 =?utf-8?B?RkovZEZqOGJQNW9iQkVvaldvOXNYNzJtOWM1cVpudlJ5YTlBSnN0U0dESVVR?=
 =?utf-8?B?TzNtekNvenBKSGJxRHkzaUNYOTU5T1Z3UkVtdEdPWTNCOUNOK1kzK0xoQXVp?=
 =?utf-8?B?SkJsTnNnWE41UG03UkFPWXZ6UVBPQnlON0NXU3IyVXNWcFNWNGErUCt1clEr?=
 =?utf-8?B?dHNlcWJkS29hWUtPT2tjckQyekNSdEtiNmVKT3ViVC9pTng0enhMUUsxY1Zy?=
 =?utf-8?B?ZzdGbGVvOWJlTGhPSnRBWnRIUHkxak54ditRV0VGeEVPNk1VclQ1VXpRMWY1?=
 =?utf-8?B?Q1c3MjVyMnJTdEl0Um93RVMrM0JwUXZreG55RjFuSTJFdGE1UWoyaDJvREFE?=
 =?utf-8?B?OFg2eWZFdHJ0ZkJSOUNVS1Z2aW1XQWRlb2hWZGxiOFJPKytVTHA4d0c0L0lZ?=
 =?utf-8?B?a1NGMk9iWjNkQ0cxM2lLZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L29sSmQ1dzBvWkl2TEhLdS9KT0VNNktQOXpVK013Rk5tdkpxRWpzM2llSHI4?=
 =?utf-8?B?OW55eDhBNVIzSnZyNFdBL1ArQSt1QVFrdHVhOEZ6Y3JXa0k3cHJvazlWdUR0?=
 =?utf-8?B?T3R3dkw0bG04M0dtbzNUMnhtcWhmRVVLdEEyK08yNG1OT25hMjExK2kwMzhN?=
 =?utf-8?B?TGRSN0NqZUNEMGtIUVlzRU1CSndzU1ZaUzNvckhNc3FXNWszRjN3dUxDZUdC?=
 =?utf-8?B?T3NEZlJvMTk3NFVFVVgxdmVNNkRNcFlXaUNGYkwyUlIwNFRYbDVSSi9MbHc5?=
 =?utf-8?B?SHFicXJEVjB5d3EwNXloa3VaYjJWdFhRVjk2aHVvbzlrNEl3YkJERlNUcFNP?=
 =?utf-8?B?YVVVZXUrSEZCLy9pMlhoNi82VnIrRUxadFcwamJ3UVAyS3V3cjN3VHlaUDd1?=
 =?utf-8?B?V2MyRGJTQlBjUElGa0RCSnNvc0F6K2RqeitaQW1ub05uellIb29oRU03SEcw?=
 =?utf-8?B?SW1XV2ROZHhOTjAvTEgrWmxNd2pXR09TZU10S0ozZjlka2U3RVNPRk5XTWxi?=
 =?utf-8?B?QXV6TzNtZXdwak45OGIxL3JrUU8rejRyNW9pVDVMZGtwT1lBbEVxbXVtaERU?=
 =?utf-8?B?c2FKMHNyRy9tS3J6Y3RubE85UXVzVVR5RTVmRXlDeTVLKys5RkhvN0lDRVhv?=
 =?utf-8?B?dW9ZUWhFT0J0RkVXaXh3ais1RG9heUw1ZXhzV2o5YVFVZzRCN2dmS1dULzFq?=
 =?utf-8?B?SHE3elJTeGJlZ1liMHlQYnY2MkIweXhGMWI4N282MHhubDBRb0dPOVJSaFBQ?=
 =?utf-8?B?RU1yMDNEc2lldmlkbVdwZ2lxU0FrRnlJdnVMZU5OWUVTUkNxazhWd2JxR0ll?=
 =?utf-8?B?RWEvYW9lUWlOaUNrdFh5STYrZWMwS2tlZ2VMWGtHeFNNTitGa3ZPUms2SDNL?=
 =?utf-8?B?TW9UZC9YQ1VibGQzNU1JM1U0RjBoVy9UM3hTa0JDM1FyYzg4TXNYWjdZNzl0?=
 =?utf-8?B?ZDBEbHJHdnBRU3Iya3FIYXI0eStwdlVUczh3dVpSL2V3TXg4emZiNWZMN0RS?=
 =?utf-8?B?L2xJZlg3eHpvZytsYm80eEVKSk1mTERIQURoeUtvYTE3RjF1WFp6dWhhRzFv?=
 =?utf-8?B?dG5CcDhqakw3VkdGSC9HOHFRN05HclplU2NrUFA4QjBuY05YNFB1ZDlNNXFr?=
 =?utf-8?B?NlRtWCtWM1I3QnExdlhVd2JRWTBhZmY2TUt0YnRtWHlmbVFqOGdIVXJ5OVdn?=
 =?utf-8?B?OUo5enQ2UCtYVEpGQTJldmYxcjRSQ0RrNzhTZk1OYW15MFkzendSaVRtNC9J?=
 =?utf-8?B?TDlvc0kvNngzaGtmaEFRYXk0K1Jzd2p6TDNSZGVBRWROdHZwSjVrWkNFeitP?=
 =?utf-8?B?ZHBIVkNqbEUxdEZZRFFDUDZYRyt6Ni9DbkhrTUFzVTJWeWUvb0Y0TkVCZ3JN?=
 =?utf-8?B?SmV4UTk5elV0MzZkSGNiRzZ5NDIyT3M5RktETGpYbEdUeDQ2RmxlR00rT2dC?=
 =?utf-8?B?Y2JYbDMzUHcvbVF2T3JQR3VkZWNxbnlWMW1DdGYzRkxsTDNFM0dtK29yOVRa?=
 =?utf-8?B?L1I2bC9TazdvN3JHYk16M1JXSVRjTVEzME5wbE9xTEViem1VR3J4dldyTHA4?=
 =?utf-8?B?dU10MTc2Vks0TTJoYzUxVlNNdUlaNDlxS1ByaVhSMGxCRnN5UTB2eEJmQVhO?=
 =?utf-8?B?dVQ3bXg1R0RYSFZ2bGJLTGZxUm9KK0lSRk84MGQ5bUVZMU1XelBOVThrZmNk?=
 =?utf-8?B?emVkZTNaL2E1M243YW9adHhyd3dGTkJGd0t1RzJ4WTlhZS9oQi9RTFF1RGlL?=
 =?utf-8?B?WjJTRkRvcFVuWkhKU2pkZXM3K3ZSUWUxbEhFaGU4QmkzRWtzRTE3VFNEamhy?=
 =?utf-8?B?UHJMRktEUTlhUWpHQTdKTWIyVW1nWDVRUlRUUGRxQTNjcHpXVnk1U2NlTlNz?=
 =?utf-8?B?WUdLTmE2MkF1MXQ2dDVsU05GTXNTL20zOE8yMWlKTGpqdnBjc0EyU3RVL1d0?=
 =?utf-8?B?SWo5Q1IwWVI5WEo4WFVkSmlKcDIzaENNNkRpaTVHS3YxYmJvQXgvcHdLNklr?=
 =?utf-8?B?RUVyRlQ0TWRoYWtIUVI3a2NUWGYxYUpvOFRZTnF2VThLVTAvVnp0WW54WDBr?=
 =?utf-8?B?MTh6UjRtSWU2TFp2SndGV3VCN3JzOEJuRzMyZ25rNmxXL2ZSSzIyM3g2WDBK?=
 =?utf-8?B?TWJldTFRR2pvakJsVW5xV1JTL05BSVllV29PSDBzQjJNdDhLMzBRaEdUck5X?=
 =?utf-8?Q?4YOiymWsyO5d0VNns8XiMytK3bYuLxJma8MfDGcLgNvN?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560bd731-c5d7-4832-60c6-08dc96b002c3
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:49:48.5527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6/7dxgLENo6YSQl+ht2/cmoiLLlrkYO3Pk0YxLmi57ikEt1IJ4cy+jPdMnEjfHQHs0uMB/mzwkU/O6qMFHTAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2258
X-TM-AS-ERS: 40.93.78.7-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1026-28484.007
X-TMASE-Result: 10--11.745100-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/1TzAVQ78TKJRhvdi92BBAu/Y5e9Qia1Sm3UJJ8+n/4Rf5Y
	pWeu+BBe5fM9sYH+1A96F32OFjccDfhmJ4lOca9uAZiMK6zpatURPnpJog/Uz9D2Tk/Rj3ovaQP
	tVHF6B2dqePnj20rfTIKWg3O4a0kRi6niFdI/HYX6a0NEvI0IWpqk29Yc2cK/oS8p4LVgO5BmyY
	2rAmnM4lspjExxhc2iUYX7pb8z0y9rJeX6tElh3DvQG0xdFpDCuUeJCuB9aL1SMzx3ql2YQ8yfx
	QnKP1ktupoogdfVK+Jd4x1IUlKnFI1g3zDt1sv5WWSz4drjSLhimmowi1sSA4j+QP7WhY0Zv9rS
	d36EgUIj80Za3RRg8Jx6jcceOUj/NXBiai2URYrN56OeEaiuXp/VVoufL2mUqrfV4SAcA/4=
X-TMASE-XGENCLOUD: deca8451-f731-4f54-a23f-e5aea90b5fde-0-0-200-0
X-TM-Deliver-Signature: 5566908A622D9D934C0DE5074B21BFE1
X-TM-Addin-Auth: 1wXcss+PWkYzIz4w/XSg8U10efbb/f0Biei47+RgX1nrrareiYwjJ1eR8kN
	FFI7CDLYm9R5wvUufQJEpwS01Z/d5U5TYKcQMDBrKiqrwQzgOelFfZcHWfqPFAcwegLZ2S05Q+i
	csUrN7o81Jovc3//Qk1Fz9IH93QYyGurm0z8Tqg6UcyWM7tPS3Z771eOH5lPVMJqUupUBoIaoaU
	stbS9mWfFqXcz4xYXhEwPz2GGZ04NEmv3OOqM3Ggo69Tstd177CtNtasYD6vK2fnNhC/PdsiYkN
	MWNTWE/aYhFAUcc=.YP8fkAMpswl0VLmoBYiEKvAJ853CJorbc/ETkHQpsTxkGrt7kfJadEnnAJ
	sNddJ2AWJFXzjpB5QtA+/T88iNfJfyW60AE7aSrqbdwXurfpsu2dZPqL2uiWC+KVjWs5hXo7EKq
	7j01jvdYs2CvTP0vS5tQSR3spu+z/ed0FI4VQF1DlSTpg1oaQFMc8pB4AcOZ5UxsP8LHY/7k3yK
	/PSBYZwPP7Kc+GqTTSBg/xQpw4y1uETF4ZR2UkqnJi5UXEDisFUpCmCHyvKWEx6J3P/ck/nYE9a
	7TKZw9q1VqRHj+crSpypO4c+M7A1TIliJK1ey0aVM2MFFHbmNzXCsEx0opQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1719496190;
	bh=TwEetEGl9DBDr0rKPH9loY6LVipr7rQ6+QZUXq/83PU=; l=2755;
	h=Date:From:To;
	b=XH2b/rTeS166XzEOjiF2gQtngtgrT7ut5V/Qy6Yoqr/OX7/8BCtf8AaqCIKZDCQBo
	 ZDHa/m6KWG/sMZSeYYG2L4jfqPMQZvHuJL/ThV/Zj5tdm0jwAhsQRdMmDtoO1jQmVx
	 2m0CNi/JVVM8zq2gpj++voBHahXdqUX9QWq7barMHYURg3C6uRwHDgVjFpLhhOBSOa
	 ctzo3DMG9xvTuBJQZzH9ySg/rNjKU5vWu5DKTIs3Wo8Nv9ALZKazWm88x4KUyGKasr
	 XkerVdPm21bVqF2Jpg+AYUz9GhVlBlv5WDN+kc9WGqs38N2s/vKN8qJ5tdaWGwBljO
	 CoYWq2WILrgaA==

On 20.06.24 16:58, David Woodhouse wrote:
> On Wed, 2024-05-22 at 19:00 +0200, Peter Hilber wrote:
>>
>>  VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
>> -standard. The device uses the time epoch of January 1, 1970, 00:00
>> -UTC. This is the same epoch as \emph{Unix time}.
>> +standard. The device uses the time epoch of January 1, 1970, 00:00 UTC.
>> +This is the same epoch as \emph{Unix time}. For VIRTIO_RTC_CLOCK_UTC,
>> +the clock \emph{subtype} specifies whether the clock fully adheres to
>> +the UTC standard w.r.t.\ leap seconds.
>>  
>>  VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
>>  standard. The device uses the time epoch of January 1, 1970, 00:00
>> @@ -290,9 +293,62 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>>  subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
>>  epoch is before or during device reset.
>>  
>> -Additional clock types may be standardized in the future.
>> -Implementation-specific clock type definitions are not recommended and
>> -use a clock type id greater than or equal to 0xF000.
>> +The \field{subtype} field identifies the clock subtype. The clock
>> +subtype provides additional information about the clock behavior. The
>> +following clock subtypes are defined:
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_RTC_SUBTYPE_STRICT 0
>> +#define VIRTIO_RTC_SUBTYPE_SMEAR 1
>> +#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
>> +#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
>> +\end{lstlisting}
>> +
>> +VIRTIO_RTC_SUBTYPE_STRICT means that the clock fully adheres to the
>> +clock type's time standard (or to the clock type's time scale, if the
>> +clock type does not refer to a time standard). This is the only subtype
>> +for clocks which are not of type VIRTIO_RTC_CLOCK_UTC.
>> +
> 
> I don't think this should be done as 'subtypes'. Just make them types,
> as *alternatives* to VIRTIO_RTC_CLOCK_UTC and VIRTIO_RTC_CLOCK_TAI.
> 
> Anything but VIRTIO_RTC_SUBTYPE_STRICT is *not* actually UTC. You
> basically say that in what I've cited above.
> 
> It shouldn't be misrepresented as such.
> 
> 

The idea with subtypes is to be forward-compatible with other, yet unnamed,
leap second smearing variants, so that the driver can still recognize them as
UTC-like, even if it doesn't know the particular subtype.

But if only linear smearing (and perhaps cosine smearing) would be supported
(apart from "unspecified" leap second handling), and the start and end times of
smearing would be indicated explicitly, then there would be no need to
distinguish subtypes any further.

Then, the smearing subtypes could become designated types.
