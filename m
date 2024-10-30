Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A470B1D278D
	for <virtio-comment@lists.linux.dev>; Wed, 30 Oct 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284303; cv=fail; b=caPcTmImgzevq8AYaDDKTmbYNrQ3vn/i6SFyR0MJRgyJzhLiv1+T4Mqqx/9qxbsMjFs6P6d8Py/ROPBqhfCO97S0G7Plc4MG11/ud9FYZR5eEeqC8eSGG7NqQQdblZ4woFE4xB7vS5Wc/VxS9QWUHRGaHRtMVg5/B6MYKwEHWmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284303; c=relaxed/simple;
	bh=HvcTt4XTNrS2w4R8W5AgCwhpIV2x8LCKXPZPpEiTBh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dXHQLDaLyMBP71bbcFzrmHJVBvhfoZsD8yEiszc7lcykJ3AA5N+BQvYuvu6swOm1tcA6oakKJfhACogtxiBNHUJr05mA6JACY3vt5eqkhxmny9zuKeaisYb/c9IYFKRRMnoU1R3RfaYxCXVOHUBX3L+A7klJr4DLqs0i9Pg92wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eGgw8HeK; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eGgw8HeK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8vHcZ013623;
	Wed, 30 Oct 2024 10:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvcTt4XTNrS2w4R8W5AgCwhpIV2x8LCKXPZPpEiTBh4=; b=eGgw8HeKcI73/aXy
	gIFRzSzWmUkShw3d+ETZtz74MM/Kp2O9SbfWsDAXFYoMxipoqqJn2ZrZka71FDZl
	egKvJvYzj9M6HySnS4Gsg+O7tuV1DKLX+Oz03nXMFfhQdjJMgh6lmgSdNMSlIyhQ
	nhak2Yf0C/dS5CBdZ8oE7CEmJky5WNBZIDiZE/ooRny7OD3SEG48er2Vc6U/81DU
	pKapcuUmNaUavwjSFCt2xsqEjhZO7h322ctsAxUr8NCLSqAnWRTbhMvrwiZCYQiJ
	Sl5SH/yWMX6F2G9QNyl+0CMeQqb6lltedVW06UzNP2DTjLaXCIRogBGy1nF5QyJY
	SIhC4Q==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rphxkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 10:31:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeQFwY+6wD0KKC2knAC0E1JBYsKzaz9vZtYmIkOxzXIwv7Ll/H+0Wu0g9AE0cMs4pv/gVQVmVkCxOps1xBi6LymJj5vfd0MaOfmMOGh03ve6mFdo2/MmLIOybUpWAOcs9lOolO4laE0GNub0xd9PSP3xr2H5oLWSSBSypoSCQYJh75qCIfoJBKx/Ja1f//MMTCvKvrWbAAnGObvyz3RI0SND4fUlkO/Rrrm8zEUKRv9Vkix0SA7h3rybbvDBCfeTBETsDGGktBc3QqH07CAThPpv/XZTxdIu4xBC2XDordHYqRp2+i5Dfr5K7Mfs+FHXQvCnUcSb3KYykoYr2DcNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvcTt4XTNrS2w4R8W5AgCwhpIV2x8LCKXPZPpEiTBh4=;
 b=IdJpy10jKyRuZkpA4zt7RkT/urONcsxMXdMvxKlw6MTYrxo1oMInNyYO7ActIDX6SacVzBr/lD5eXLCdIpIvI9twz85uO/XDxl95PgK+fcFuok879QcB/y97CiXt5IxHorfinsQWTZiqKR128ApLUWUWEiw+KIBvfKLbaBRveO1EUsg5ncCxG90MdS+dtdHqn09eUHF2fRjUz+dDGxUxHfi1OYFveTTEcBYDYPCoW4uHPtZ1s5W7BrNfqpgZvtTSFuGGEnO1rBBcQWbUXJSppzQrEdEY5qhanMJpeq0y+GAH/1bu9klg8kB8se8f+8kA1iMydsptgIt3dxapl+w+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MN2PR02MB7007.namprd02.prod.outlook.com (2603:10b6:208:207::16)
 by BN0PR02MB8205.namprd02.prod.outlook.com (2603:10b6:408:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 10:31:34 +0000
Received: from MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b]) by MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:31:34 +0000
From: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>
To: Parav Pandit <parav@nvidia.com>,
        "Aiswarya Cyriac (QUIC)"
	<quic_acyriac@quicinc.com>,
        "Alexander Gordeev (QUIC)"
	<quic_agordeev@quicinc.com>,
        Albert Esteve <aesteve@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbE/HmcELoI5U5U02p413zR13gCrJxyOaAgAxe4SCAIPgPAIAAJCDA
Date: Wed, 30 Oct 2024 10:31:34 +0000
Message-ID:
 <MN2PR02MB700715AED141D3C27D9F332690542@MN2PR02MB7007.namprd02.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB7007:EE_|BN0PR02MB8205:EE_
x-ms-office365-filtering-correlation-id: 5113eba8-2738-4c69-d40f-08dcf8ce0709
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UExya0pwVHRpa1VZblVqb2NCUDljbWJzV3gwVFBySU9ZblY4b1VDVUpQcE9Z?=
 =?utf-8?B?dTRuSUZsSTZETzRoeSszWGJZRU51S0dxVnFpQlJEZDdyc1hDRHBkWjJsdEJi?=
 =?utf-8?B?TUl3L2RrMHZXU1M4bE54WXdmU3pDL084dUt3STQwL1d6blE5d1A0M3R6M01z?=
 =?utf-8?B?LzVyMUgzMFV0dUFFMXJ1M2hWUndOTyt6WHlqdGtCaEQvN1MzeURIYXB0NGxx?=
 =?utf-8?B?ZG5NbkJJaWFhc0crVEdCYk8ybU5yVjVPdEZJQ29Lakc5dlJOVG4xdjhraDZS?=
 =?utf-8?B?OHBlOWNwbWFzSlFlTjlpb0FyZUg3ZWxEMUI1YXlOYmxiU1l3VUl5SzdEQ3Jq?=
 =?utf-8?B?TmJZV3I3bitGSml3T3JRamg2RCtLVW9GZlQrRkRJelNnMjVvcGZSNGErc2gz?=
 =?utf-8?B?Mzl4ZXE1aWxNaklzVE5LT2tvVTV2ckpFQWtvZEs1Q3pVMlluTGt0TjVzRWVl?=
 =?utf-8?B?ajZmcFFHV2M3SjNjYkwzNzkyVjVWeEZEandaRW5hTE80T3pUVklqNUNxMHZI?=
 =?utf-8?B?Q2NOTS8wL0xoK2Zoa1lGeXRzSmR0Vi9TMGVPcUFCOVdMSVI1QlRIZ0xvVzlv?=
 =?utf-8?B?WmZZekZPcENBWjRld3N1eERyaXRWWHZ1cHpzUVdidUFLaVZxeGlVNnRDL0l2?=
 =?utf-8?B?U3JydFVwT1V3Z1BBdlJaUFFFNUFvdTZkMjhMVWtld1hBRGJGeWFTOUU5N2gv?=
 =?utf-8?B?YUp4cVNBdC9MYkc5L0dOa1U0Q3pSakoyWnZsdGdrR1N2MGd5aW5hV3lBbVI5?=
 =?utf-8?B?N3pHMTlwY05tblhkZW9GVGdUYWxyZDdHZjlBTnRUUnVrZXZoV0xXRDh5N0Na?=
 =?utf-8?B?ejdjaUtuNVV1UmxjemJwTytTc3ozUFpmNytaNlNBM0xJdUdRc3hoVlVqMWZW?=
 =?utf-8?B?bnhuclpkeGNOc3NXYkNEQWlzcXR5YXA4c0JnMW1IKzhEWTdCOVduUmFXWjh0?=
 =?utf-8?B?VU1kUktJM0dTWnNpcU1wcDFTM2k0ek9hNFhZYTk4N0VlZ0ltSVJWb0Q3V3dG?=
 =?utf-8?B?ZHg4ck5mV2RrNDM0N05md2VBUkJPM2tKY2JxeHZFZ0FZNm5XMThhWXpkbFdy?=
 =?utf-8?B?Z2pqb1c4TkpqWlNWM0MwaTRsV0pMMWlNeG1jdC9MY3VTWk5wc25WR09aWTdm?=
 =?utf-8?B?WWJnVjhoVWR2TEN1c1djZFpibjNuSWNxclh1NEpoWUp6MUNNTVJZS1NrWmF6?=
 =?utf-8?B?S1NZZWNhcDNWWUg3K1pFa2IwdERUYSs5V3VyZUQ1djNFU3RyQ1I2K1RqZ2pt?=
 =?utf-8?B?enV3UExlbDVlWlpsZHNzdWo3OWJnYysxVEQ0UzA2enBGaUZKTHBDYnllRkth?=
 =?utf-8?B?NXlHb3F4dXFwRzNTWklHRENPZFZ1VnB3N25zeVdJQUxkbHhCYS9xU3VDUzBt?=
 =?utf-8?B?K1hqUG45RlVialhKTWxpK01FR0NDUCtnSUJrVDFkK2ZUMzE5KzN4RUxIT1Zh?=
 =?utf-8?B?WWtjc2lXZERSWEg1OUlSY1FPRDlqL05hOXdwR1Y5TnN3SnF1STQxc0l0SXVu?=
 =?utf-8?B?QkhrNlFPYnUvY3NBSWgxOVpFQ3lYNDZrdWVNNGxpcWhiQlF2L0tlck5yakM0?=
 =?utf-8?B?Zkt4Njk3aXpGTGUvQmtFVHU3ckppTXZaQmFDMWZEUHd0bEFQSmVmdDNRS0Vh?=
 =?utf-8?B?WmtIdGdUV2Y2bDNHcjNoVFk1SmE3L0RWNHM4OGppUUE1MXRXcEFoaStPaGZi?=
 =?utf-8?B?K1NoOXFRcWdLbVB1UDRNdlRtdmt0a25LdGlZR1B5ME5nNDJUYWtLaTRDeXo5?=
 =?utf-8?B?UytmU05kb2xNYXZYVVQyNVdSd2NnWTgyRkZ2YndYRUZOcXpWVkNzRU5TSVN5?=
 =?utf-8?Q?8ZppUO8O2JMVryCSrrAua/hfTNz2VXjQdECgI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7007.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFdHWjlCaXRDSSsxRlRiWmRZRFN3TmhFM2hLc1lHNHlHUFROSXFoM1JlVnhG?=
 =?utf-8?B?c1VPTCtJbnpJOHQvYm8vYkN6dzlYbWZRY0VuRkh0VGpFVFpQWEJNM2FLelR6?=
 =?utf-8?B?WHNpQXd1bXF2RkRmMnVMRHcrSlRZc01ZZ2NKcjVwb1I2Y2xUTjdEaTFoZzlm?=
 =?utf-8?B?aDMvR1dpYUdIWGFkcnZmUHMxS0NrcEMyRVFNTkp0amJ6UDhJb3BJV3VSeEk1?=
 =?utf-8?B?eVNXNFFSRndjZ1N2MklsbUVPYXJ5V3VGbTNFS2NBMXZTRk1xZWVDSXFsVlk5?=
 =?utf-8?B?aEQwbnE4amxBV3JReFNjVHYxL2J1MzBGcEFWbkJ2cUdPcW9qQnZ3aXdQTzFB?=
 =?utf-8?B?L3dhWUR2UVZJYlk2dFlscVZMRy9BVlRqVXRSOUdzdjJrR0xtZ2JxNWNvalRv?=
 =?utf-8?B?MTlOeGE4MGhaa2JseHFCbHlkcU9aY1hhaTRpajBsT2EvT0N4SlI1clZmMUY2?=
 =?utf-8?B?TEplalc3T3A2a0FhZExiWjBXYllTdkpwVUd6VllQdjNtZitaNVFxRDRYemx0?=
 =?utf-8?B?QSs4UWtHWlBjcnhkZE5HWFFZTlUvSkN5TXAzZmRBMlZjMkpCZkpnTERlcWo3?=
 =?utf-8?B?UWMzMXcyQktjeG5aSjhITEt5UVFZaDd3YlhVR3Rid0tXY2NPQUpYRHpGTy9F?=
 =?utf-8?B?YW00cG1XUVRSUDZsMFVWVlVGek9HOFpxMGxIendqWVdBM2ROUUNoNDZoMTVS?=
 =?utf-8?B?cEpkd2YrMm13ZitJaTJ6TWNwZlhtSzBQYTZUWk91QXVuQkF5WFdsUjdYejZV?=
 =?utf-8?B?dmZnUitEUXJ6ZTZEQnp0NnZ0SUJzNmFEaXNGOTBRK0MyOEg3TEdISkxXNEp3?=
 =?utf-8?B?aGV6bUhySDdUK2puUU1Qa1EyQmRqK1lHcCt2OCtLRGRiZ3N5UGg5L2UxS1hk?=
 =?utf-8?B?T29lMDB1d3pqTXdQYTgyOEdFRDFPb3p2amhnSkdoYVowMkhEZ3cyTkVHSFVo?=
 =?utf-8?B?U0t2d09tYklqTFBmZmhXVEtGdDU5TjZLQjFQcWlwVTFoMU9HTG51Rms5SUxj?=
 =?utf-8?B?ekIxUmVaTGQ4Yzh0UjIxSzFXNWJ1dmFOVktnYmxrTFJGc29lSVBNTWg3a2pH?=
 =?utf-8?B?SGhLWk9CYlpSMk5RUzVpR0UvSkZVN0k2RDVoYUkrMnVGWnZUaStwSnRXdy9h?=
 =?utf-8?B?YzV4dDRnMkRiK3ZwRmt3V0EwdkxYY1pqU3hHejR1aGR3NzVjdUxjU3VlNHdP?=
 =?utf-8?B?cmNMcmZFU0NRS3RueURyUFBkaFBvRXdUb1hFYStxT3UyUUVKZjIxbmdWTm9K?=
 =?utf-8?B?U3p3TUhVdGlBSy9YL1pkNk5jUllLZk5sWXhJcFJrVVgzVXNQWlpSWS81dTBw?=
 =?utf-8?B?TUtrTE9RWFlsK3pDQVVpckxiaXdHK3hUcFExVDFkY3BaLzh2NUQxZVFhWTBk?=
 =?utf-8?B?M2lPZk1EeTB3Ni9mVTlmTkxOaFpKNkVWWGl3cU5URmFqa1VhZktTTWhnalZl?=
 =?utf-8?B?ZFRYejdMc1Q4WHM2NHEzSVpneUlYMmF5R1FoRjJudExXN0xUSG10d2dFVHA0?=
 =?utf-8?B?ZUFCWDVZV0kwYUtNQmh1eHIvd3RTd0JvYXZjNGhsdlpWVjU2dURyVWl6KzNa?=
 =?utf-8?B?YW9TNm1GTUFVWDFndExOVXhvL09wR0t5S2M3ZmlnSVpGUWp2K0owemNEanNj?=
 =?utf-8?B?YkdpY3pKaTUydG1xeUtKQ1pHakliNDQyakhFcGEwVVhzbjYxVzFLZkdGNWlX?=
 =?utf-8?B?S3ZtT2ZiVG9JMGtDdi9HRGM4a2kwZXZDWFVkaFdqQVA1cUFMMzNzQStDOEVu?=
 =?utf-8?B?cTkyWWVqdWt1eC82ZjY0V0MvUHJlUXM4a2V5TitGcDNoTGpLeTBtOEUvUndM?=
 =?utf-8?B?NUQzcHRYL2V3YVI0M216bXg5ZHhCeUQzNlZVZHhubUpKZUwyMnRaL3JPWFIw?=
 =?utf-8?B?NW1nU3l2UDYyK1ZvYnF1R2xDeW1odnZjMy9iaXdaYzEyU1BsS1R3NlI2OVN0?=
 =?utf-8?B?NEhLR1dmeWovdTU3eGw3S2FZNGpRMlBWWDA4R2NQczlVZGdybTBnUkM5L3E0?=
 =?utf-8?B?TDRFblU0UGFHUUlJaVExMGpNaEc2cUFsenU2UXpFR1VsZzdqSytsUGlZek5Y?=
 =?utf-8?B?c0QxeUxMcURmV3VVSmkwUG51aWpFcXNMYWxJSVRmRWpwSWpQYk43N0lVRVJq?=
 =?utf-8?Q?nt8urH9mBA3Lpa0ECLEHEewjJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JnKZH17IU3nlBLqOusQ9KXVkbH0N45EGC6xVhmipkRyfQOWXxUCv8VW8gc8VbXm8Y9n28ZUMYEGGk2lOvS2TD7HoOpGsawhkU+d6gMQKR9TFfXxXlST0Tb2F4f4qR3lXNlG7PtUSW8+Z62x/ASfKDRV6YHJAKN0xUNNCI2GuH+oQ3fyRG1I+S5R2/I9jFoC3qFTGoZiYhSJwsJMGA0/kH5dCENLK+r3lE7wX+7Z/O9twMBV5uMYrVVO2NokUzuv4PXK/ie8V1uNWruYHICVlgGt3MFP98C+XlbVlKcK3dSUt0XVwZU7lWlnyQhXiIECDDSCZpYqpeejAOmC2A/uQdAGkJs4RAXeVo15lp/vypdqzcFB0lg4XdMprUx6m6mAvak7spJnRHtjTUSBnBq7BQoz3k5BNAsB+SxKjje1W+Z4OhPxvT02Weh2wJ/foUQ2oLuD6rd/3JSt8SdDalsehSaP6wJDA4r60SW+So5x9RTqRGqAeZN66unSrfghVSNSvgv8hJ4bsQw6UAZSHTqIyOvFQsabDvf3l/Ilh0iWDyDIdq+4FpDlMJvJL1ipRuIVFcD0YVtJJw7jTTu4l9KnHcTo5J3g3vWHjzW4wvhLSVLfF70zPkc1lH2U1p8OVzEZD
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7007.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5113eba8-2738-4c69-d40f-08dcf8ce0709
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 10:31:34.4561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB0/Li0t8o+RXtaOgDykfbJ63WWQTPy9hw3KThT20yg1uS0Pho9OhW8At06tZ1Uwaj+5T0Oo3KP1BWbBOakN2UN++BfvD1eFOPCnCm7OlP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8205
X-Proofpoint-ORIG-GUID: gbuioIYKOeGjxM1_jMFBTtHkSHCg6Kwe
X-Proofpoint-GUID: gbuioIYKOeGjxM1_jMFBTtHkSHCg6Kwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410300082

SGkgUGFyYXYsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFyYXYg
UGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAs
IDIwMjQgOToxNSBBTQ0KPiBUbzogQWlzd2FyeWEgQ3lyaWFjIChRVUlDKSA8cXVpY19hY3lyaWFj
QHF1aWNpbmMuY29tPjsgQWxleGFuZGVyIEdvcmRlZXYNCj4gKFFVSUMpIDxxdWljX2Fnb3JkZWV2
QHF1aWNpbmMuY29tPjsgQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQuY29tPjsNCj4gdmly
dGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2DQo+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEg
ZGV2aWNlDQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRl
IG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVu
dHMsIGFuZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IEhpIEFpc3dhcnlhLA0KPiANCj4g
PiBGcm9tOiBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpIDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+
DQo+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDksIDIwMjQgMjoxNyBQTQ0KPiA+IFRvOiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+OyBBbGV4YW5kZXIgR29yZGVldiAoUVVJQykN
Cj4gPiA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT47IEFsYmVydCBFc3RldmUgPGFlc3RldmVA
cmVkaGF0LmNvbT47DQo+ID4gdmlydGlvLSBjb21tZW50QGxpc3RzLmxpbnV4LmRldjsgQWlzd2Fy
eWEgQ3lyaWFjIChRVUlDKQ0KPiA+IDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+ID4gQ2M6
IGFjb3VyYm90QGNocm9taXVtLm9yZw0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRl
bnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRldmljZQ0KPiA+DQo+ID4gSGkgUGFyYXYsDQo+ID4N
Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIw
MjQgMTo1MyBQTQ0KPiA+ID4gVG86IEFsZXhhbmRlciBHb3JkZWV2IChRVUlDKSA8cXVpY19hZ29y
ZGVldkBxdWljaW5jLmNvbT47IEFsYmVydA0KPiA+ID4gRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5j
b20+OyB2aXJ0aW8tY29tbWVudEBsaXN0cy5saW51eC5kZXY7DQo+ID4gPiBBaXN3YXJ5YSBDeXJp
YWMNCj4gPiA+IChRVUlDKSA8cXVpY19hY3lyaWFjQHF1aWNpbmMuY29tPg0KPiA+ID4gQ2M6IGFj
b3VyYm90QGNocm9taXVtLm9yZw0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVu
dDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2aWNlDQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4gRnJv
bTogQWxleGFuZGVyIEdvcmRlZXYgPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5jb20+DQo+ID4gPiA+
IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCA0OjM2IFBNDQo+ID4gPiA+DQo+ID4gPiA+
IE9uIDAxLzEwLzIwMjQgMTA6MzksIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4+IEZyb206IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4N
Cj4gPiA+ID4gPj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDI0IDE6MzUgUE0NCj4gPiA+
ID4gPj4gVG86IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT47DQo+ID4gPiA+ID4+
IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldjsgYWlzd2FyeWEuY3lyaWFjQG9wZW5zeW5l
cmd5LmNvbQ0KPiA+ID4gPiA+PiBDYzogYWNvdXJib3RAY2hyb21pdW0ub3JnDQo+ID4gPiA+ID4+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRl
dmljZQ0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBIaSBBbGJlcnQsDQo+ID4gPiA+ID4+DQo+ID4g
PiA+ID4+IEZyb206IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPiA+ID4g
Pj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjQgMTI6MjAgUE0NCj4gPiA+ID4g
Pj4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCA5OjA44oCv
QU0gQWxiZXJ0IEVzdGV2ZQ0KPiA+ID4gPiA+PiA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4N
Cj4gPiA+ID4gPj4gd3JvdGU6DQo+ID4gPiA+ID4+IFJlc2VydmUgZGV2aWNlIElEIDQ5IGZvciBt
ZWRpYSBkZXZpY2UuDQo+ID4gPiA+ID4+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNvZGVyLCB2
aWRlbyBkZWNvZGVyLCBhbmQgY2FwdHVyZSBkZXZpY2VzLg0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+
PiBTaWduZWQtb2ZmLWJ5OiBBbGJlcnQgRXN0ZXZlIDxtYWlsdG86YWVzdGV2ZUByZWRoYXQuY29t
Pg0KPiA+ID4gPiA+PiAtLS0NCj4gPiA+ID4gPj4gIGNvbnRlbnQudGV4IHwgMiArKw0KPiA+ID4g
PiA+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+Pg0KPiA+ID4g
PiA+PiBkaWZmIC0tZ2l0IGEvY29udGVudC50ZXggYi9jb250ZW50LnRleCBpbmRleCAwYTYyZGNl
Li42ZDZiM2Q4DQo+ID4gPiA+ID4+IDEwMDY0NA0KPiA+ID4gPiA+PiAtLS0gYS9jb250ZW50LnRl
eA0KPiA+ID4gPiA+PiArKysgYi9jb250ZW50LnRleA0KPiA+ID4gPiA+PiBAQCAtNzM5LDYgKzcz
OSw4IEBAIFxjaGFwdGVye0RldmljZSBUeXBlc31cbGFiZWx7c2VjOkRldmljZQ0KPiA+ID4gPiA+
PiBUeXBlc30gIFxobGluZQ0KPiA+ID4gPiA+PiAgNDUgICAgICAgICAmwqAgIFNQSSBtYXN0ZXIg
XFwNCj4gPiA+ID4gPj4gIFxobGluZQ0KPiA+ID4gPiA+PiArNDkgICAgICAgICAmwqAgIE1lZGlh
IGRldmljZSBcXA0KPiA+ID4gPiA+PiArXGhsaW5lDQo+ID4gPiA+ID4+ICBcZW5ke3RhYnVsYXJ9
DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IFRoZSBpZCA0OCByZXF1ZXN0IHdhcyBtYWRlIHNldmVy
YWwgbW9udGhzIGFnbyBpbiBNYXktMjQgZm9yDQo+ID4gPiA+ID4+IHVzYiwgbm8gZnVydGhlciBp
bnRlcmVzdCBoYXMgYmVlbiBzaG93biBvbiBpdC4NCj4gPiA+ID4gPj4gQmV0dGVyIHRvIGF2b2lk
IGhvbGVzIGluIHRoZSBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiA+ID4gPj4gU28gaWQgNDgg
d291bGQgYmUgYmV0dGVyIHRvIHVzZSBmb3IgbWVkaWEgdGhhdCBoYXMgaW50ZXJlc3QuDQo+ID4g
PiA+ID4+IEFkZGVkIHZpcnRpby11c2IgcHJvcG9zZXIgdG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBp
cyBzdGlsbA0KPiA+ID4gPiA+PiBpbnRlcmVzdGluZywgaW4gdGhhdCBjYXNlDQo+ID4gPiA+ID4+
IDQ5IHNlZW1zIGdvb2QgaGVyZS4NCj4gPiA+ID4gPj4NCj4gPiA+ID4gPj4gR2l2ZW4gdGhlIHZv
dGluZyBoYXMgc3RhcnRlZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZA0KPiA+ID4gPiA+
PiB2YWx1ZSBtYXR0ZXJzIGFzIGxvbmcgYXMgb25lIG9mIHRoZSB1bmlxdWUgaWQgaXMgcmVzZXJ2
ZWQuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEFuZCBkbyBub3QgcHJlZmVyIHRvIHJlc3RhcnQg
dGhlIHZvdGluZyBmb3Igc3VjaCBhIHNtYWxsIGNoYW5nZQ0KPiA+ID4gPiA+PiBlaXRoZXIgb24g
bXkgbGF0ZSBvYnNlcnZhdGlvbiBvZiB0aGlzIGhvbGUuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+
IEkgdGhpbmsgd2hlbiB0aGUgbWFpbnRhaW5lciBtZXJnZXMgdGhlIHByb3Bvc2VkIHBhdGNoIHRv
IGFzc2lnbg0KPiA+ID4gPiA+PiBpZCA0OCwgc2hvdWxkIGJlIGZpbmUuDQo+ID4gPiA+ID4+DQo+
ID4gPiA+ID4+IE1pY2hhZWwsDQo+ID4gPiA+ID4+IEFyZSB5b3Ugb2sgdGhpcyB3YXk/IE9yIHlv
dSBoYXZlIGJldHRlciBzdWdnZXN0aW9uPw0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBBaXNod2Fy
eWEsDQo+ID4gPiA+ID4+IElzIHZpcnRpby11c2Igc3RpbGwgaW50ZXJlc3Rpbmc/IElmIHNvLCBj
YW4geW91IHBsZWFzZSByZXF1ZXN0DQo+ID4gPiA+ID4+IGZvciB0aGUgdm90ZT8gU28gdGhhdCB3
ZSBhdm9pZCB0aGUgaG9sZSBpbiBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiA+ID4gPiBJIHJl
Y2VpdmVkIGF1dG8gcmVwbHkgZnJvbSBBaXNod2FyeWEncyBlbXBsb3llciB0aGF0IHRoZXkgYXJl
DQo+ID4gPiA+ID4gbm90IHJlYWNoYWJsZQ0KPiA+ID4gPiBkdWUgdG8gYWNxdWlzaXRpb24uDQo+
ID4gPiA+ID4gU28gbm90IHN1cmUgaWYgdmlydGlvLXVzYiBhbmQgNDggaXMgc3RpbGwgcmVsZXZh
bnQuDQo+ID4gPiA+DQo+ID4NCj4gPiBXZSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgdmlydGlvLXVz
YiBkZXZpY2UgYW5kIHdvdWxkIGxpa2UgdG8gcmVzZXJ2ZSBJRCA0OCBmb3INCj4gaXQuDQo+ID4g
SG93ZXZlciwgSSBwbGFuIHRvIHB1c2ggYSB2ZXJzaW9uIDIgcGF0Y2ggdG8gZW5zdXJlIHRoZSBy
ZXNlcnZhdGlvbg0KPiA+IGNvdmVycyBub3QganVzdCB0aGUgdmlydGlvLXVzYiBob3N0IGNvbnRy
b2xsZXIsIGJ1dCB0aGUgdmlydGlvLXVzYiBkZXZpY2UuDQo+ID4NCj4gQW55IHBsYW4gdG8gcmVx
dWVzdCBmb3IgdmlydGlvLXVzYiBkZXZpY2UgaW4gbmV4dCB0d28gd2Vla3M/DQo+IElmIG5vdCwg
dGhlbiB2aXJ0aW8tbWVkaWEgY2FuIHByb2NlZWQgd2l0aCBJRCA0OCAodGhpcyBpcyB0aGUgZmly
c3QgZnJlZSBpZCkgYW5kDQo+IGxhdGVyIHdoZW4geW91IGFyZSByZWFkeSwgdmlydGlvLXVzYiBj
YW4gcGljayB0aGUgbmV4dCBmcmVlIElELg0KPiBUaGlzIHdpbGwgaGVscCB0byBub3QgY3JlYXRl
IGFueSBob2xlcyBmb3Igc29tZSBpbmRlZmluaXRlIHRpbWUgaW4gdGhlIElEIGxpc3QuDQpbPg==
