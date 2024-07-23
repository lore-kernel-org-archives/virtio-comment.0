Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25D288D1
	for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721727458; cv=fail; b=THFnDuJ5Y3Tj5OrieZRGbbp8GGkmjcEqVYWezDH3dRQbb6bEqc5cJ7YggZvzeeybYMCLQacTM5y0ZLVIRB6zqKQtVawD4T9VASQjJ8EqZNlo4+R6SfU/xl+gHw8ETYykpLjEZfqFx0HSe9S5TmrS/9Nuv/SjJI+8ORV36u+Y+iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721727458; c=relaxed/simple;
	bh=DYPMXFr/vAGqu8zn7OE+8G2jZB9657ARiPG1gn+S+hM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EBNwTdTTCljwBKb5OrWwplARDDpd/uXvmHM1a2a6a8MPgWrAdrIaOFEwGbydeu4RGFIVTw2Ixi/a1jpnj7mchFnsXzRQ0nwefMtR9lQerBStHzMYKymJSVkDLuAnT8bvJpQQ2yJjyvH3Mk+c6bvRoj+onmmjg5Zo27UvBjXyQu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=lmGAiQPa; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="lmGAiQPa"
Received: from 40.93.78.3_.trendmicro.com (unknown [172.21.19.81])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id B1F971019B8EC
	for <virtio-comment@lists.linux.dev>; Tue, 23 Jul 2024 09:37:26 +0000 (UTC)
Received: from 40.93.78.3_.trendmicro.com (unknown [172.21.186.216])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id C4F3010001354;
	Tue, 23 Jul 2024 09:37:18 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721727436.010000
X-TM-MAIL-UUID: bee4676c-8e38-4efa-b959-a35c1550a849
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.3])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 02A38100035C8;
	Tue, 23 Jul 2024 09:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQxbVBF1yOwnAvCuqPiwLPebeqZsdTugG2S6BDZhI2itnlCTeAVcN6pii2Rj23b8qT1jDog6jAlzjsqcAgnbpVWEab1ZFhn7hu/8609fAV+eOG+oAVOVKEZ9MOcavgxM3Y0StrIiubbGZi/kvFwOHp/KesyJr9TlUREKRa4jnPNlh+xSnSupT/k+AEoUTYrH1nwHE8QKvfmnqXRyWlBggudUqOwCshlfJhLXpPPvSoug5WAnlpbjNzgaErQWPDs1h5Z3gl/amrNg3Jsg/F0MWIdFZO9ukP+uycXxMqtx95/Ku2rM9BHgJ2qTpz5c7bjWayOYdNuQ688A2C9ZR6raYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3Mm8D/cSnawcwa4sdGQPkaAeDZ9FZ8VQwtARlbz5kg=;
 b=Her35F9fl6V5wlWFj4kWK9Io43REizyjRR6bri2EMs5pvypzAbRswpQOef2dsXB9z7QvvTqCupRyYCopq8A1kEW2Kz8r86dOKgxyR69tc8ijZ1PjLgoBqlY8NZLuUCQy+MNa7a8Bsviy7dSYI+AdR/qj+azzCY9h84j8L3JUoaLQ68yXw0MrtoI18HCXByFF3v0isJAHDEALuZ8PBvUl/kBLvcpjcYPYi8+7ipP4BgoqEDbEjVR+RH0LTeonSCSp0ofWSDrg3uGxi3CQ/D55CkyWEYPpgfBNfWbE+d0TQjakRIAxCYYvf+sB7wg63RvYkYL2DvqOj1ItyJtGJSbStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <e1e7c92b-6dce-441f-bc2b-d4c5915d7bf5@opensynergy.com>
Date: Tue, 23 Jul 2024 11:37:12 +0200
Subject: Re: Question about virtio camera
To: Stefano Garzarella <sgarzare@redhat.com>,
 "Wang, Min (Rocky) (CN)" <Min.Wang.CN@windriver.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Hrishivarya Bhageeradhan <hrishivarya.bhageeradhan@opensynergy.com>
References: <PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2@PH7PR11MB8550.namprd11.prod.outlook.com>
 <5x7rthvgxzu456qezrenm2j6t37drzh5chgw4o2uughxxpxbpg@wjbdmb2ktp6r>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <5x7rthvgxzu456qezrenm2j6t37drzh5chgw4o2uughxxpxbpg@wjbdmb2ktp6r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::9) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR6P281MB3417:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be31457-8a5c-41e8-996b-08dcaafb08e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2svWnRjbmpCcG1oWWNzWWFha1pRU2Vma1NvOUd1MDArS0ZKdmdVWFJ5cE9r?=
 =?utf-8?B?QW1lZ3plclFqYVpzWkVUTVJ3UWsrKzU5NkFWYndKQzd4V2wwZW1jbnpvWDdQ?=
 =?utf-8?B?V2RYanQ4UFhxdFhBem5jZWZkMVpabnZTSzU1SmF2V3A3aWluNTNSS0R2UHRm?=
 =?utf-8?B?RE0yaGtpZGl5VFBYVHV6OFhSZDkzUUlOOVVqQTNkVWZpVWwyNnhpS1BzVHhn?=
 =?utf-8?B?MlFaTmx1dE8yTU5XaVBNMFcvUS9ZdWZ0YlVKWHgvMDZxU29jQTdCeFh1ZzFl?=
 =?utf-8?B?VmowWWZodTFicG12d0xSMjF1YzRSeUcwN2FGSHZyYjJRVzFVY1R5R2R4NWNL?=
 =?utf-8?B?SVc5SHFtbVJyWWZtM2JERzROL3liSWxldm9MaThLVUFFN2d2WXViZWZFUjU0?=
 =?utf-8?B?bEJ3UWJBTlF0NGkvRlRpQkw1V3BtdnNBUnlWNDJsdlRIdDJWc051WWkzRm1Y?=
 =?utf-8?B?Z3ZTeXppc3h3K3RiaHlQcFVDcXJaSHpUbWxOVW5jOXFqVC9iQXFmd29vMUZY?=
 =?utf-8?B?cjRMcFZVcXF3OG1Sb1JWdENmRjZkUmpVNEwzbzY4M2JIYnp1eEJMV3I4VGVr?=
 =?utf-8?B?c2tUbzl6bUJBUTAyNCtLM1Yxa3NjbFJnZWQ2OFFRRFpIR25oc21zSGFWNjMx?=
 =?utf-8?B?dldvZWUzK3g0eXZGY3oydG1PYVAvN2JRRFJHL1lyZ05IdEhtbUJvWlUvaThw?=
 =?utf-8?B?WEZIL3lhVkFQZkpPUWlQazFuZ1pQTHVQbEhvOEtGRmV4M0FreHBxcDRXL3Ex?=
 =?utf-8?B?SHpxbUFLOTc3a281WjZPK1JteVhvQVk5S2p0S2FCNWtkaW5wQmd1ZGU4ZUI5?=
 =?utf-8?B?UG9tMTdSOTBDN0xkdytnMjlTdzhXUUhxdWdPeHBIaDFNZjhlK01nVU9manQ1?=
 =?utf-8?B?SmZNam1KZkVvRHFqRjhEbUg1b1hIU3UrVk12RUNxeGVkVW5aRnp1K3dRSEdZ?=
 =?utf-8?B?aUdVaXlIUnNhejZ1M2QwZEEzclY2RDhqV0kwWmExdlBtN2x6eGVhd1BvcFM5?=
 =?utf-8?B?NnRqTXJwd0Vsd2VmZm0rUVVDNUZkak9lMzc2RDBSRk9pY2tPT3hKOE9vQ2FT?=
 =?utf-8?B?RHVuYjZReHN3djhNUXQ4MkI0RXROOFRpZG1EOE5aNzFBZFRhVEN2c1JUZjA1?=
 =?utf-8?B?VEF2QmF2TFpLMVdUOXdhTVQ0RElld3JXTk5FTUFqd2FCTTJFeGdMTG0waDNG?=
 =?utf-8?B?Y0VzR2JZOER2N3g1MnkvdWs4S1o1Y2JjUWM0RHlpUHNDbytCSFdIbUduSks1?=
 =?utf-8?B?RUZNc29iaEtGalJ3dGp6YWVZZ3NrZUkzR1hZelYvSUVJODBhZXRCWkNTUHZP?=
 =?utf-8?B?V1lnUEpXK3pNYktLZnVCMlFwdXNVK3pWQ1ZUU2pMZkNsQ1BPZDJxRWd0NnJC?=
 =?utf-8?B?cm9FZzhxb20xU3ZlUDdza0JGeUh2QkcrM0QrRHNOSjMwL1hMbEZPd1V0SVJr?=
 =?utf-8?B?ZGZJQVMwMGNlMWd3NmZsY1QrREFFQ2tQNVN2MnpFVjlXRWpqT25JZHp3MUpm?=
 =?utf-8?B?cjFwTVpVNzREeHh5Q3lYQ3V4YTBQcm9ZZkxjOU4ybXJaVjdnbmlMWGtjVEpP?=
 =?utf-8?B?VVpYN25GQjI1cW5Mamh2MkVjVy96elhERkxRWUk0aXJYSmZNTHNGUnRNbWVJ?=
 =?utf-8?B?UXBaRGtvemNVbE5mWFdzLzQvVlhPQnJGa2NjeWtzaDUxbHRiL1RFdStMZHBy?=
 =?utf-8?B?SDVpVWNleGI2ajBTSTJzaUxHUUZMb3Iycm1zSXN5cHdOc2hEY1F0VEcvK3ZJ?=
 =?utf-8?B?SFlUbFJkYjdsekR5RENPeWE0WjVCOXo3ZFgrV1RlckN0TENCdW5pbVdBMWdz?=
 =?utf-8?B?M0ZiR1A4V3dkZkVTVEhsQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZYM0YxaStkQjlLMXpNc1VTbUZoeExJS3pjWGcrZzFNVitvUlBVekJkTjFQ?=
 =?utf-8?B?ZWNDVjhPWVVyd3M0U1E2RTBGYVdCRm9JaE45ZloxOUlUN2l5TVlrWjdCS3pk?=
 =?utf-8?B?bndzYjJHQ1lyVExWR2RCWUQ1T1Qra3ZvcDBlc2VuTXlLOU9XSjg0cHFNRm4v?=
 =?utf-8?B?SHdkUXc2NngrRGpkYnN5SUN5SlhjQnVsU3FtbDZPTldTM2tHeEdCa3lhZjdD?=
 =?utf-8?B?WkxGRkdCNjFxUTFwUkJYMFByNkRIS29Cazhqa0ZZaWNEdmdjR3hiYmF6MWM2?=
 =?utf-8?B?MVlLdWpKRlhMdkFCa1BNYTVJS3MvUms4RUdzUnp0RmE3UmVIOTdERGxuTDFP?=
 =?utf-8?B?U2RzdmhlenlWYWMvUVc3Q3VGNVoyRThpMlRyTUVBT1lhWlpibDdZN0xSTEVE?=
 =?utf-8?B?OW1CVjRyYWs3aDUrV1JjVDJncWRTUE5kMXZVVVNxeEVwZDk4b21GRTV3bVRN?=
 =?utf-8?B?TnhleFlOL2pnZGQwUTV4L0JtSGRMS1VXeUlSdXFEc3VMNitYNEhUTWwyNmtQ?=
 =?utf-8?B?dHdURWFNcXZFamdobk81SVVrU3ljWkVpMmZpSG5ubExYb29qdDJScllvaDFX?=
 =?utf-8?B?dmpwR0l2VDVuYzRza1pjclVibnM3bDhnUHIrN2lIOGpKS3BtZklJR0hFd1By?=
 =?utf-8?B?R21WMkRFWnBFdFI4cmczUllWTXN5OXNkRnpxSnBxWE90Zml3STNqRlI1Tisz?=
 =?utf-8?B?cTJXQURFZ2Vkb0VvVXc0Rzg5RlZPY2tlUE5rRVllL2xhMnpzTmV1eEUwN2tZ?=
 =?utf-8?B?a2svTlJ3YzZRdUxzTldzajV4bkthT1c0a1AwWVBSdFpQZDdPMkoyRGNRK3VC?=
 =?utf-8?B?aDBBVFN5a2hwTTBlSWdvMXZGRmZJVERqUWJsV0tES0Q2VjZueU1sZWxZd0ZW?=
 =?utf-8?B?Z2pwc3RsL0V0SDZBMHN5cElDU0F4SERxdTFXTHMrOUtUSkFCQTl2WUM3dGw1?=
 =?utf-8?B?em1JcDhnQWF4RW5qS25wZUpmV0JoVjMyOVBOaHB5a2ptRFpBeURpM2hYdHpP?=
 =?utf-8?B?aVpXYXNKVGNFb1ZXcm1hNUsxME5ZazFVUWlvSnVRQlZyaCtYVlBVUDFJSkRn?=
 =?utf-8?B?ZjhGNzJUMkdOVW44YmE3NEUxU2ZjOVIvcEg5eFpWRHllcVhjdGlEM2FPTG1S?=
 =?utf-8?B?MmpNeFE1QXl3TFBtZUdaWHFJK1lSQTRGVUhsZ3MvSlhzQ0VSTVQ3SmhFcndp?=
 =?utf-8?B?cHdIUTNvU1BiODFwZ09aU2E4MDRNMXhQQzRoNWZ3cko2UGRFeDVSSEttMXI3?=
 =?utf-8?B?N0RFZXU1VzFaOWJTaXh2dkd6Z3ExNjZWT0doUHZ5R2lOcG1TRlVtMnY4Z0h3?=
 =?utf-8?B?T3l3TUtQS3JlWXJiUFNueHh5clBURHFtSzZhNTNGUmNCMDVRMVcwVE5pVno2?=
 =?utf-8?B?TnZUalRMY1FxYjZjU1BCZGpBTndsWU5XSlduOWJIWHgxTW5haHMwMG5BTjY2?=
 =?utf-8?B?bCtaWWJpZ2cyMzNWOHF1L3lzVXFCSGhEVDNFYmk2R0lMUnIrTHNFbnMvVkRQ?=
 =?utf-8?B?dFlINEVrUDZWNHRudTYzUmxRMW16cWVwY2dNenMrQ1NmZlRNczZWM2VkY21k?=
 =?utf-8?B?R1RKSTV5cjRCRHFIWkpGNkdHblBOcU9qa1pUb3ZsZWpMc3A4TVd3Ri9YWm15?=
 =?utf-8?B?U21CMW9zaVUzcDFxWERRRUl2emIrUEhwdXpLZHBLcXJVM2hmTW5TcE1IMzVE?=
 =?utf-8?B?cnBwejBhZ09BNzczbFQ5Tk1wUW1qWjFMTnVKdFA3MzRXU0J0cTNMY2VqeHdk?=
 =?utf-8?B?SFFoNU1ucU8zL2NkVHArZWRwaURlTXdoNWFyWGFMc2R3YVVOM0liVkl5T3lx?=
 =?utf-8?B?V0k1WlNPck0wT2VlSFhON3pkNWEyQlRpc3JzaU91Q015TkZmY3NRa25PSzc4?=
 =?utf-8?B?eERJQVp3SUhTWDhGYWR2Rkg4bGJZVjJWWi94dlZsNXhCS2xreUNVblFQcGRv?=
 =?utf-8?B?ODRuQTdPLzFla2Z0a2RVVGFNbFdmUk4xY2JjczdRd2JFN21rUktoYVp5Wlc0?=
 =?utf-8?B?VnNKNG9JallnbUhsb2tOcGU1enkyVmVqNllHK1NSdHluV0ZoVXEvYlRySzBz?=
 =?utf-8?B?VitVS0JwS0pmT0drWE9LR013aTdiTHAxc054VlkwU05qWjh5L0VLY1ZtMG5U?=
 =?utf-8?Q?rnxb6eIEzkb/S7d8INhjQHQst?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be31457-8a5c-41e8-996b-08dcaafb08e7
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:37:14.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3OBCGCn69xJupiCNrDNqJosOzxD7pB6ty+8JpOJ8802otYhKP7SRFh8I60NgMlYazPFsyAYe6A93F66KQiCEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB3417
X-TM-AS-ERS: 40.93.78.3-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1028-28546.006
X-TMASE-Result: 10--15.103600-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/16u8Ra7Bkp4ww4DIWv1jSVbU+XbFYs1xJ6UlL50ogah9OH
	Nytw90RTkJxdDJhrSolzllvDUDfn64MYpr38Y7kvbAQSvnY/AMWFCkPhi2xezfVG52rL0ActlnU
	/m80XrfnfPVZf3kIQ3vtPAMPr/05qw7dIfa1qfApv4UG/TUKo0VhAFa9hyLt2+EtwvS7X1YEZlO
	FICjaYBQV25jqmgjKKFMHynIQmEeLotZZFLzrVX2sCVKm5hjwd2j7jyCKpnCf6eDrkstFBca+eC
	SMeOiOkrlXFGRYMxXDGHUPAWlejJCojD85jfNIZnHtOsnExa82wuuqc48T66yVNJxt7aXvgmwjo
	r1Nh6wtJFQD69E10vA==
X-TMASE-XGENCLOUD: f6a9b297-512b-49da-99d9-b09b0f414393-0-0-200-0
X-TM-Deliver-Signature: 96829EFFD3CA2734DF5F0E96D1141F62
X-TM-Addin-Auth: YgU24LaXclfyZNQ5vTPZ8YTIGlEMtq71F5Zk+ueL8c3en5FmLATy5tZasx9
	EOkODQbRBB6iKqFk1mDHnzpQtOyoBLgBV7TMC+wIzXW/+2NzpfchHiEP+lG8ZHkfkn9tdn8Dpy0
	TR1du2gAN4QKugjelNxVOgYUehdF4viUKj5QMtZ18ODd+l+2QqEyCgY5FoOXLkbjN7DWJoJ26Nv
	GxjS5EzmajGJXPXLH7ynsM2J1Rxt+IcxD45Y3zZBO1UU3s9xURxeoCPiXmuN1YiKm9kr8tOEILY
	121rjOG27C1nuvg=.wwIVUxgKlod8LXqO8k6oXhdhFnsSUv6pJrZhzv60/+2hpEGff1Aon6J+kJ
	WTPzPjWJnr4aV4m4EZTOzsVFVvsjqlC0qClYqCFymFV2iI8Pc8rvt/e5Q9TAqXRyftfHhyFCGQ5
	UTeBb3FGvBYNF8lIVgAD28jcMATX88oYiAdpM9ZmZPKfReWMDXG8YzXsA8iFyOy0vrkQ8LZ+75u
	y4zxOvBzdG6UHr8LaRxiIK4nGofjyVS/AU0+9PNuApUpAozfSQREf0DmlwjW9oDuXNGMlYSC39d
	pPyxd5hmZYRPUfX7n/C00Lo18Vgfkrc+TeNhSuyN2aCoG9HnqYy7E7PN81A==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721727438;
	bh=DYPMXFr/vAGqu8zn7OE+8G2jZB9657ARiPG1gn+S+hM=; l=1366;
	h=Date:To:From;
	b=lmGAiQPaZXHrGFmri6gkiSJkX8VfHLJjgU11Lznw7GojVfPApLMhU0cK3FbMVyCBs
	 BN+PLyWmxX4kLxR09Hs2wz6kVTJBn+DsXVJX/ry/PniRJFgoQ88bBmWChX2IR7uFxz
	 0IK7BDxE3saTq0BUFrOrF2RshdAT31mxGyer6eOk2k9IT8pQ2hQBqnQpj0p4zpw6eG
	 Z4Io8NA8w7imR3JdWAwLtQnEe10fyp4qlUWep5aSvl6jq2xov3rST8VAmVE7ie0HDj
	 8igHKkX71rIV1jPpbikvO+PpqQW5bNdLyrZquleXCNjGuUpQXzwHTeJLfXZqrfmixs
	 4YCe/9D+7pYWg==

Hi,

On 19.07.24 15:26, Stefano Garzarella wrote:
> On Thu, Jul 18, 2024 at 08:24:07AM GMT, Wang, Min (Rocky) (CN) wrote:
>> Hi Experts,
>>
>> I noticed that virtio spec 1.3 has added camera, but only a camera 
>> ID(43) is added, the other items such as Config Space, Device 
>> Operation, all is empty.
> 
> This is expected by our workflow, so that submitters can work on the 
> specification having the id reserved.
> 
>>
>> Is there any progress about camera part in new spec(maybe 1.4) could 
>> be shared?
> 
> I have not followed the development, but in this case better to CC who 
> reserved the ID.
> 
> @Hrishivarya can you share some news?

Unfortunately Hrishivarya is not available at the moment, but I can 
reply on her behalf.
Yes, we wanted to develop a draft virtio-camera specification and start 
the discussions back in October 2022, but this activity is currently on 
hold because of all the events and uncertainty related to virtio-video. 
Our current plan is to continue this activity as soon as virtio-video is 
merged. This is not an easy topic. I think the first draft could look 
very similar to virtio-video or even simply extend it with a few 
camera-specific controls borrowed from V4L2. But then it can easily go 
in a completely different direction.

-- 
Alexander Gordeev
Senior Software Engineer

