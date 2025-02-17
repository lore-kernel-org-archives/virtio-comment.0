Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE8137750
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739770833; cv=fail; b=kt9yPurlHOKy0d1+WJ/5Ugg+NFYrKfwGcAkW26uQqp9Vl7OjOLy8zCvgHGUfUNHCrpaftuDYiH5bgQD1kPfkXqSTZVqqtUqMQ0/QrawPNW90qDns0JLPbquLwawsbVu7G6ggsgZqXDjPF2aEKCIIRGC+6PpVbiHkFAvMjAcmsOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739770833; c=relaxed/simple;
	bh=uIxop8em0rZSMtmibXJCpFFBeX8wOzeRk6CaobryhNI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=uVlBBV5W4pV85AgMQuthkGtnOzJPOlqpbnNhWZzmi/Uw3g673XYt8zfjVP27InIPVP5k/rl5wqi49FDBrsV56v0XpbxhucQuJxBJYoNPVzgr0ghA6s7mzRgJPwlnOQZCqc/gbK5ubGEp8RFArszPGbkcZAblZKeaxvQFFkLqU+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Kr8mw7Jx reason="signature verification failed"; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Kr8mw7Jx"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H4S0No018864;
	Sun, 16 Feb 2025 21:40:24 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44ucja9cfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Feb 2025 21:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiE4FOPuYqTvayp6Bev/UmcvC4xjdJAY3AzVWHvA+WWwNAiM/ByRpMBBs5ErW5mYbagXOIlI1Bark0AAUWkJW1yKcuabF0zWbzZON0nR4KyjqsRPbFMaf1nCytjUvjkR2wrmCO/279t9EA6+rcpveTBTfezsd5Tra3CZgerMRIccB49hjnRUOU30LjUoAy7oRe9eFFzFJBQo9TfFSOHibMBgBkqSJHY3TBwnjA/cpL9AWcRHvc769R78Scv9VwaHpAr4rSm47aqwiD/9C6fc7Vn80pSWU1yY5F6O4841mS9/2/Wwop49Xtfxg71dL9cY1W8m4NqzhxwgSvzyD+1K9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0meLjVd6i8Lq7b2IBuG/t9VeALBNN7G62fLqE1jej78=;
 b=FPAvP/6UwTgAR332rr2zqA9Srqm+pnB9d/WDdyZxZ23lkiSrMzkLMn4lXGu8kD4yep8yzUO5Qehp3GPeSKe0bEokQbQbCSH/XSl6qUL5VTG8xAQ++DWzkV7e8s74bRYsdyfeCCiKziaYkVoqfx+D6hW5jtSFG1kli3UW4pvDVtC1sO0L3dWerimJaFAa6qtNf3fwQqF0bGOUXVZeNGJ/D3YHG1rckoG8PcVlovY78qNPpqY8j/pSmFzz6W9vT5BbJTm/fwKhlEe3xlzr0yEquvALNuMqPm1VP9KWItst/TtCfHWqVQtu/8MGV9356rEHgYlS/NqR8CdG8KNL3991jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0meLjVd6i8Lq7b2IBuG/t9VeALBNN7G62fLqE1jej78=;
 b=Kr8mw7Jx4nkgwoufXTtglg/qd5kkFZGdv9xqE7AIGsmDy7FW1j6xoY22GKED7Cd8wi/vK1rOpRBlCWbfsdOxcLdEhj6wmWh4ym6Q3zh/OXanCfxcJ0WjPfkRlWEKTd4UPZheKIuXuOVPv3olB6isDhBhkOEa8yUxqZvPO/8QfEI=
Received: from PH7SPRMB0130.namprd18.prod.outlook.com (2603:10b6:510:2fb::20)
 by CO6PR18MB4050.namprd18.prod.outlook.com (2603:10b6:5:349::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 05:40:21 +0000
Received: from PH7SPRMB0130.namprd18.prod.outlook.com
 ([fe80::a379:1374:8d7:5990]) by PH7SPRMB0130.namprd18.prod.outlook.com
 ([fe80::a379:1374:8d7:5990%7]) with mapi id 15.20.8422.010; Mon, 17 Feb 2025
 05:40:21 +0000
From: Srujana Challa <schalla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com"
	<cohuck@redhat.com>,
        "mvaralar@redhat.com" <mvaralar@redhat.com>,
        Satananda
 Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>, Anoob Joseph
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbbJVA3e6/c76de0OAGCrvtYDeDbNBD+oAgAIyLLCABZVxAIACSb1w
Date: Mon, 17 Feb 2025 05:40:20 +0000
Message-ID:
 <PH7SPRMB0130039B74A375EE73E48C8DA0FB2@PH7SPRMB0130.namprd18.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-3-schalla@marvell.com>
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PH7SPRMB0130F8B80EAA835D74D84803A0FF2@PH7SPRMB0130.namprd18.prod.outlook.com>
 <CY8PR12MB7195760E0CB3F693B211A069DCF92@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195760E0CB3F693B211A069DCF92@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0130:EE_|CO6PR18MB4050:EE_
x-ms-office365-filtering-correlation-id: 5fcbeeb2-a58c-4eaf-6866-08dd4f15916b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Wm9yTzd1cHY2aUJOT3VuQ3AxUk5Gem5aYTFHSCtPU2ZhNWczeUpjNXErdHVw?=
 =?utf-8?B?enBTZVB1blh2L3dEV09ybi9lbUxZVHpoajNmSGIvTGdMNlFwWkt4eUk1NEF3?=
 =?utf-8?B?ZnJkM2d1MkNCMjFqb0hGMlorSVppd3pZSXNLdUtlVTFQZ2YwZWNjbHlyZTdn?=
 =?utf-8?B?TmZvZWxEYkt1ZUdKMkdRT3dwYkZrT21DNTVjNzBsNWNhQ1JCZ3g1Z3lZM2hr?=
 =?utf-8?B?VUt0Y3Npck9JWlJ3bWwxQjZTYXNnWTJPRGlTTDg1SkpmaG1Na0ZiQUFGejk3?=
 =?utf-8?B?WW9HcFlya2FIdldDeGxleUtzQlQvMzEwa2ZiY2JqZDRrdzMvcFF5bFZSaGF1?=
 =?utf-8?B?bExoTUxRRXV0RFJDTmFKb29xL3VEd3V3ZlRZSFhMYmRjZHRXK3o4a2tpYkpD?=
 =?utf-8?B?MURMbkc3VGhYUXJrNXhST2doTGJJUjdNNXZFWUZVSUhIRi8rMGpuWFlTTGR0?=
 =?utf-8?B?cFZjRGZCUDhJS05qS0d5d011ZFVROWVLekhBZnhOMkx2cHFmUXQwSFdtd1du?=
 =?utf-8?B?RmJCTmQxVm5lRjdpb1ZXelZGRWtsR3Y1elVnOEJIWHU2Tlkrc2JyTTdIbVBm?=
 =?utf-8?B?R2tHSnpzNCtFSmNXMklOWkcvbVhUUVBsSUd3ZEF0MkVDelZ5SkZWSmZiY0ow?=
 =?utf-8?B?RkhwWUdSWkx6c1hia3JDY3BKTzJTRDh6bzFTY1RQallrV1EzUWxOeTZqcWVR?=
 =?utf-8?B?WndsR1dQc3BMQzAxSDQ0emZXTVExS0lWbGdHaEUzdTV0K3hRRFpKOC8vL0Nx?=
 =?utf-8?B?bWZYYnRNK2lvY3R3VjNENFdkYkF0aVcwQTNmenZERTMwL2lYK1luWWgrR3R4?=
 =?utf-8?B?TjRiR0FRZTEwcDk3a1E3aENRV05SYUdvcXdiMDNYVDZ5WHpqeTJDaUFPZEJ1?=
 =?utf-8?B?bkgrSEQ3RTlxS0RTVWgzb25QRE1uTkJnc3dVNnQ2MkpXTjAyTXNQVzAxbnZ4?=
 =?utf-8?B?NmU1SjZTdzRaM1NJUHBRNmZ1WVhTcXphT2ZWbXNoZUVCZlRGSm9QNXRvVUZ5?=
 =?utf-8?B?UkRIa3dWc3Ewa2VZdDNwUkFQYnhyOXJhc1NJSGRqU2tDMkhhZlJqOExKaWZx?=
 =?utf-8?B?RDFKOCs3ZVlTQmdSVHhIL01zR21zYm14SFBzWGtSbERGZysxUGRYa0dlWFpR?=
 =?utf-8?B?YjY3c1Uxa2grd1NidWQzUlpjR2M1b3NqYnpXNjFpc3h4WU9QMW5xeGxrS0FV?=
 =?utf-8?B?cHlEN0dDNkh4Wm96UmZWdmkzM3Q1bUE3dzZYTjNNLzJ1dlI1bzVQdjI2bGYv?=
 =?utf-8?B?Vm5JUXcyQ0Q5N3V5WUVOUGs3NHRsWG9kOG9EMkV6K0E1RUhGOTBnSzlaTDda?=
 =?utf-8?B?UHRFbklmUTEva2cvcEtBL1VxbGhTeGVPekFmd09sNUY4MG9vYXpCNldvaGQ2?=
 =?utf-8?B?UU1wQ0dNeEhiNldsSHM0b3pxUWFXOXVWaXBLcXo4dHJhMGJ3VWZKa20vR3p2?=
 =?utf-8?B?USsxRXQ5cHBuZ0UzcUNZT3ZYdnk1c1E1YmNDS1lmS1Y3RDBNeFk0QjJ3SWY2?=
 =?utf-8?B?eHMyRU95LzFXZXh5aDV0Zm1KK3k2U0QrK2RtYm0xeFU0K2Z4TTFRVFpwRXh3?=
 =?utf-8?B?SlA2WnFqdVRmNmRIZ040RGEvZSs2VWsySDVMOTR1QTVLdTFQVE1UYjRBZmVy?=
 =?utf-8?B?UDVRbzRvaWxIc2x3Ym9Fdk1OTm9ocStiaFpkMitRS01zREZKRGNKaERvRkhy?=
 =?utf-8?B?T1dqV3R3TXA4Yit3SEpwS1I3UC93SC9acXJHRGszM2ZjME43RjlrNFJsN1Ay?=
 =?utf-8?B?eE5CdXF6SE9YbkFaOTNlNjJJUktSeCs4NXpUZU1Xb1o4dUNVWVh2L1JlYkZP?=
 =?utf-8?B?ZDNhbXBaTTF4Q2s5aHh3VS9aRk0xS0Noa3QxaGNFeWJaOGRoRXo4eWJWOVho?=
 =?utf-8?B?ck0vTXAreHVIR0srZzRKMElPbFJRRnl6R0JWLzdsKzMxREE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0130.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW12Q0RxUUJuV0JmVFpIaThMTWZSa3hGbHhJS1lQeWtmeUtBaXV4d254Tnl0?=
 =?utf-8?B?VFpiOHp0SXJ0Tk90QnRRRFpTQjdaQUJhVm5JdGVQOXVMZDJad2MvcjhWeWVW?=
 =?utf-8?B?Z01xeFpXS1ZCOFpQbGVyc0pOUysyOHdvRDdXNENCaHlOdVRpbENhcllWV05a?=
 =?utf-8?B?UnJzbU9ZME5Gem4wU2VVL0JOSTZzVXlSV3NITE1aQWJVWUZKQ3RickUvdHBm?=
 =?utf-8?B?U1RDWGl1VStuQ1RkVmZqcGRVT1hIT2hKYVM0UWFKdVBKTDB0TFhzSndIdEJ1?=
 =?utf-8?B?d0E4UmthUEs3Z2lRQ1lMYTcwUWRCVWthSFh5MG42NTlCR3ZnNU1HTUd2VDZF?=
 =?utf-8?B?RlUyRjVidVV6VEFBVHpYMWp0OUpDL09XWUljYStyYVV2dVBiVHdycWdXbDdC?=
 =?utf-8?B?SzJWSFMxeStNQm0ycWx0aC84ekw5dHU1N0czRVlFMlc4YUVGV1hmaTBrZDAx?=
 =?utf-8?B?WER4TFpIeUxOODBPeFFOYld2VjhrMS84WExYNE5zcXNqNFVPc2JQYXlmY3Mx?=
 =?utf-8?B?RWRpT1A1Y3YvZzVjZmw2cldJNXVLclhKMnN2ZGN4c3g5bnhmUFNqNlQ5R1lo?=
 =?utf-8?B?NGhoY1pieEw5VUwycjBheUZGQWRhMFdBRlhEWkR0amhpOGhPSWxMcGIzME9o?=
 =?utf-8?B?QzZLamhTWkVSVnE1KzRWTWlRS1U4V3FaTis1QVE0TTNIN0VQcnNJRk0wSlk3?=
 =?utf-8?B?OFlPOFcxUWZDdVVOcVdnN2ZVaktsMHB3dHZKYXJSbzlNZnpGWldRYXRpWEhY?=
 =?utf-8?B?enZ3bTFsWTF2Y2VId3pJVUxaQXoway9ZMFZ4UEFQUVVVSGhSdGlBd1VKZUFT?=
 =?utf-8?B?UktXT2paN0IyemRDSEJwMjVNV0ZKYUxSdlF0Y3BhSEY3alVkUXBTaUlIbDds?=
 =?utf-8?B?Smk2aE9rMjRpbHdWVzZCODJqWXFVbGsvdGxlSDBzOUZwd0FXSTJRR1VMbWJv?=
 =?utf-8?B?U3BxUlVTODhSekd3TjVPOGM2UHRZLzFnOWw2MjV1ZWVvVVNYdlcrVSszWmc0?=
 =?utf-8?B?VGZSOGhyNzNob2NFMTZvNmJlbGl3Z3N2d0FNam0vU3hUUEJYczFTMFdWZU93?=
 =?utf-8?B?d1IvOUhSdThST3ZTQk0zckZId0lhNVFReTI4VmlvaStIUzhDUTB0ZEk1dk1Y?=
 =?utf-8?B?TGtlNHlKQ0xsZmtCbGVBbWVqcFhxWmJmWnlhSmo0WUM0a1hOWUJMS1FkQk91?=
 =?utf-8?B?YWx0Q3lVN244b1Mvbi95bndrbzFkZWZsZHM5czFSU3M0aXp2bGwySVJIOTBT?=
 =?utf-8?B?UmxYQkZSaUw2azNKUmRGZHhmdHR1M21aREUyZXhFaG9GTFFrdDN0MWZydi9u?=
 =?utf-8?B?L0MxVGJwdEU4M2U3emoxbmo4QkxZcll2eDJUOG9xUHkvOGJNVjdjR1lVZ0VK?=
 =?utf-8?B?eERRenZSY01lY0dSUGorU044VVlCazcvdVJ4NjM3K3diNE11bjB3RnlBbk91?=
 =?utf-8?B?aWRtOHExS1pzNkoweGFiRU5xVUV0ZFE1NHJQd1VJR05NQ2lMcmk3MlZDMGph?=
 =?utf-8?B?MGo5VDhKb0dFcFhYbEdYMlNsSDZQMjcvR1FLcUhoY2RTamlEZjlGY2cxK2Nh?=
 =?utf-8?B?amhraGxFL1BHVW5ZRmc1cUduTllPUEtaY2x5djlYNDlidHNRQThzMDdqTUxT?=
 =?utf-8?B?SHg2SEpBRzVPbjRMVThpMXh3OTNSdTZoazRIV2V3cVdOcjAvNjJwU3dnQ0Nq?=
 =?utf-8?B?a25uYnNsSnhhT05wVFYxYkNXZDlMSWNjN3gwUXRkcFMvNjNlTGZvWlZRK1F6?=
 =?utf-8?B?Z1ZURTZFaDVha3pnd0Q5Tm9Bb2pnSlMyRVpJY2xDMkNta25TSFhoSEZPQ3lH?=
 =?utf-8?B?R0hYZWtaN3RFczRESlRPVHFuUmV2cXhDZDlNam40L243WjlpRXlWN3ZIejVZ?=
 =?utf-8?B?K0lJM3hxY0NTWnZ6NkludDNtUWx5VTBRbmVKTGJ1d0hEU3ZKUktyMm54L0ZZ?=
 =?utf-8?B?VHZYcGVtSmJ5VWZLWUhkQ0ZORUI0YkJDYUpTb3k3Mkx4ZkJBdk10dXVMSXZw?=
 =?utf-8?B?VXBraEY4cGdBMWp0RkZiT3NIM2RwczA2aEh1UVJZb3Rkb1ZXY09GcEdxcVI2?=
 =?utf-8?B?eW1JK3V2aFliWHV6WUp2NUJyWmk4a3lpbFdsYU9ZcHhWMERTeEo4RjBmdDNl?=
 =?utf-8?Q?8QvqumPVHnB38ya/uIozCXPkB?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0130.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcbeeb2-a58c-4eaf-6866-08dd4f15916b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 05:40:20.9062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G2/8xUHH/RXb4Tzb6CZyHbwUAOSyAuvurPnc5NFDqA47XzUFCuX6W4i+t5inYND6LSXmifsxP7lfDJ5gQkVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB4050
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 00VLP-CrTrI47eIDoQftAzoC2zYtpHvQ
X-Proofpoint-GUID: 00VLP-CrTrI47eIDoQftAzoC2zYtpHvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01

> Subject: [EXTERNAL] RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource
> objects for IPsec outbound and inbound SAs
>=20
> > From: Srujana Challa <schalla@=E2=80=8Amarvell.=E2=80=8Acom> > Sent: Th=
ursday,
> > February 13, 2025 8:=E2=80=8A06 PM > > > Subject: [EXTERNAL] RE: [PATCH=
 RFC v3
> > 2/4] virtio-crypto: Add resource > > objects for IPsec outbound and
> > inbound SAs >
>=20
>=20
>=20
> > From: Srujana Challa <schalla@marvell.com>
> > Sent: Thursday, February 13, 2025 8:06 PM
> >
> > > Subject: [EXTERNAL] RE: [PATCH RFC v3 2/4] virtio-crypto: Add
> > > resource objects for IPsec outbound and inbound SAs
> > >
> > > > From: Srujana Challa <schalla@=E2=80=8Amarvell.=E2=80=8Acom> > Sent=
: Wednesday,
> > > > January 22, 2025 11:=E2=80=8A47 AM > > This commit introduces resou=
rce
> > > > objects to enable the driver/device to create > IPsec Security
> > > > Associations
> > > > (SAs) for both inbound
> > >
> > >
> > >
> > > > From: Srujana Challa <schalla@marvell.com>
> > > > Sent: Wednesday, January 22, 2025 11:47 AM
> > > >
> > > > This commit introduces resource objects to enable the
> > > > driver/device to create IPsec Security Associations (SAs) for both
> > > > inbound and outbound
> > > directions.
> > > >
> > > > The IPsec SA objects include essential parameters required for
> > > > packet outbound and inbound processing, such as SPI, tunnel
> > > > headers, IPsec mode, IPsec options and cipher/authentication specif=
ic
> data.
> > > >
> > > > Signed-off-by: Srujana Challa <schalla@marvell.com>
> > > > ---
> > > >  device-types/crypto/description.tex | 145
> > > > ++++++++++++++++++++++++++++
> > > >  1 file changed, 145 insertions(+)
> > > >
> > > > diff --git a/device-types/crypto/description.tex b/device-
> > > > types/crypto/description.tex index 2c00e50..0ba09df 100644
> > > > --- a/device-types/crypto/description.tex
> > > > +++ b/device-types/crypto/description.tex
> > > > @@ -336,6 +336,20 @@ \subsection{Device and driver
> > > > capabilities}\label{sec:Device Types / Crypto Devi  \hline
> > > > \end{tabularx}
> > > >
> > > > +\subsection{Device resource objects}\label{sec:Device Types /
> > > > +Crypto Device / Device resource objects}
> > > > +
> > > > +The crypto device has the following resource objects.
> > > > +
> > > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> > > > +Description \\ \hline \hline
> > > > +0x0200 & \hyperref[par:Device Types / Crypto Device / Device
> > > > +Operation / IPsec Service Operation / Resource objects /
> > > > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> > > > SA]{VIRTIO_CRYPTO_RESOURCE_OB
> > > > +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\
> > > > +\hline
> > > > +0x0201 & \hyperref[par:Device Types / Crypto Device / Device
> > > > +Operation / IPsec Service Operation / Resource objects /
> > > > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> > > > SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> > > > +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> > > > +\end{tabularx}
> > > > +
> > > >  \subsection{Device Operation}\label{sec:Device Types / Crypto
> > > > Device / Device Operation}
> > > >
> > > >  The operation of a virtio crypto device is driven by requests
> > > > placed on the virtqueues.
> > > > @@ -2028,3 +2042,134 @@ \subsubsection{IPSEC Service
> > > > Operation}\label{sec:Device Types / Crypto Device /  \hline
> > > > \end{tabularx} \end{table}
> > > > +
> > > > +\paragraph{Resource objects}
> > > > +\label{par:Device Types / Crypto Device / Device Operation /
> > > > +IPsec Service Operation / Resource objects}
> > > > +
> > > >
> > >
> >
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\la
> > > b
> > > > el{par:D
> > > > +evice Types / Crypto Device / Device Operation / IPsec Service
> > > > +Operation / Resource objects /
> > > > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> > > > +
> > > > +A driver can have outbound SAs between 0 and
> > > > +\field{outb_sa_limit}, as specified by the capability
> VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP.
> > > > +For the IPsec outbound SA resource object
> > > > +\field{resource_obj_specific_data} is in the format \field{struct
> > > virtio_crypto_resource_obj_ipsec_sa}.
> > > > +
> > > > +\begin{lstlisting}
> > > > +struct in_addr {
> > > > +        le32 s_addr;
> > > > +};
> > > > +
> > > > +struct in6_addr {
> > > > +        union {
> > > > +                u8  S6_u8[16];
> > > > +                le32 S6_u32[4];
> > > > +                le64 S6_u64[2];
> > > > +        } S6_un;
> > > > +};
> > > > +
> > > Any reason for union? Can we just have s6_u8?
> > > (s6 in small).
> > I have copied from the RFC.  Will change it or can we add reference to
> > the RFC for these structures instead of defining here?
> > >
> > > > +struct virtio_crypto_ipsec_tunnel_param {
> > > > +        /* Tunnel type: IPv4 or IPv6 */
> > > > +        u8 type;
> > > > +        u8 reserved[3];
> > > > +        union {
> > > > +                /* IPv4 tunnel header parameters */
> > > > +                struct {
> > > > +                        /* IPv4 source address */
> > > > +                        struct in_addr src_ip;
> > > > +                        /* IPv4 destination address */
> > > > +                        struct in_addr dst_ip;
> > > > +                        /* IPv4 Differentiated Services Code Point=
 */
> > > > +                        u8 dscp;
> > > > +                        /* IPv4 Don't Fragment bit */
> > > > +                        u8 df;
> > > > +                        /* IPv4 Time To Live */
> > > > +                        u8 ttl;
> > > Please add padding bytes to align to 32-bit.
> > Will do.
> > > > +                } ipv4;
> > > > +                /* IPv6 tunnel header parameters */
> > > > +                struct {
> > > > +                        /* IPv6 source address */
> > > > +                        struct in6_addr src_addr;
> > > > +                        /* IPv6 destination address */
> > > > +                        struct in6_addr dst_addr;
> > > > +                        /* IPv6 flow label */
> > > > +                        le32 flabel;
> > > > +                        /* IPv6 hop limit */
> > > > +                        u8 hlimit;
> > > > +                        /* IPv6 Differentiated Services Code Point=
 */
> > > > +                        u8 dscp;
> > > This one too. Please check in both the series, vnet ipsec and this on=
e.
> > Will do.
> > >
> > > > +                } ipv6;
> > > > +        };
> > > > +};
> > > > +
> > > > +struct virtio_crypto_resource_obj_ipsec_sa {
> > > > +        le32 spi;
> > > > +        le32 salt;
> > > > +        le64 options;
> > > > +        struct virtio_crypto_ipsec_tunnel_param param;
> > > > +        le64 esn;
> > > > +        le16 udp_sport;
> > > > +        le16 udp_dport;
> > > > +        le32 replay_win_sz;
> > > > +        le64 cipher_algo;
> > > > +        struct {
> > > > +            le16 length;
> > > > +            u8 data[];
> > > > +        } cipher_key;
> > > > +        le64 auth_algo;
> > > > +        struct {
> > > > +            le16 length;
> > > > +            u8 data[];
> > > > +        } auth_key;
> > > Two dynamic arrays in one is problematic.
> > > And below fields can never be referenced without learning the length
> > > of auth_key and cipher_key.
> > > Below are critical fields to access the whole rest of the object.
> > > So please move them at start.
> > Will do.
> > >
> > > Also can we have above two dynamic array as constant size array,
> > > instead of dynamic?
> > We would like to make it a single dynamic array. Have both lengths
> > auth_key_len and cipher_key_len at the end followed by data[] array.
> > The first
> > x(auth_key_len) bytes represents the auth_key and next
> > y(cipher_key_len) bytes represents the cipher key.
> > Could you confirm if this approach is fine?
> Code wont be able to make sure of flexible array related kernel and/or
> compiler facilities.
> If most common keys are 256-bit wide, can we limit each array size for 64=
B for
> 512-bits future key size?
> This way, there are still two arrays, static/dynamic checkers enabled and
> covers common cases too?
>=20
> And if there is use case for 1024 or 4K bits key, may be for it can we de=
fine just
> new struct for it?
> May be ipsec_sa_large_key {} for it with rest of the fields as common?
Will do.
>=20
> > >
> > > > +        le32 obj_id;
> > > > +        u8 mode;
> > > > +        u8 direction;
> > > > +}
> > > > +\end{lstlisting}
> > > > +
> > > > +\field{spi} is the Security Parameter Index(SPI) used to uniquely
> > > > +identify the
> > > > IPsec SA.
> > > > +\field{salt} is the 32 bit salt value used in the cryptographic op=
erations.
> > > > +
> > > > +\field{options} specifies the Options for configuring the IPsec
> > > > +SA, see \ref{table:Device Types / Crypto Device / Device
> > > > +Operation / IPsec Service
> > > > Operation / Device and driver capabilities /
> > > > VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> > > > +
> > > > +\field{param} specifies the parameters for IPsec tunnel mode.
> > > > +\field{esn} is the starting sequence number.
> > > > +\field{udp_sport} is the source port for UDP encapsulation.
> > > > +\field{udp_dport} is the destination port for UDP encapsulation.
> > > > +\field{replay_win_sz} is the anti-replay window size to enable
> > > > +sequence replay attack handling, replay checking is disabled if
> > > > +the window
> > > size is 0.
> > > > +
> > > > +\field{cipher_algo} is the cipher algorithm identifier see
> > > > +\ref{sec:Device Types / Crypto Device / Supported crypto services
> > > > +/ CIPHER services} \field{cipher_key} specifies the cipher key
> > > > +and its
> > length.
> > > > +\field{auth_algo} is the Authentication algorithm identifier
> > > > +\field{auth_key} specifies the authentication key data and its len=
gth.
> > > > +\field{obj_id} specifies the object id of the SA that can be used
> > > > +to retrieve driver-defined data associated with the IPsec SA.
> > > > +
> > > > +\field{mode} specifies the mode of the IPsec SA, see
> > > > +\ref{table:Device Types / Crypto Device / Device Operation /
> > > > +IPsec Service Operation / Device
> > > > and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> > > > +
> > > > +\field{direction} specifies IPsec SA direction.
> > > > +
> > > > +\begin{table}[H]
> > > > +\caption{IPsec Direction}
> > > > +\label{table:Device Types / Crypto Device / Device Operation /
> > > > +IPsec Service Operation / Device and driver capabilities /
> > > > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec
> Direction}
> > > > +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> > > > +Description \\ \hline \hline
> > > > +0x0 & - & Reserved \\
> > > > +\hline
> > > > +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction
> > outbound
> > > > \\
> > > > +\hline
> > > > +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound
> > \\
> > > > +\hline \end{tabularx} \end{table}
> > > > +
> > > >
> > >
> >
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\labe
> > > l
> > > > {par:De
> > > > +vice Types / Crypto Device / Device Operation / IPsec Service
> > > > +Operation / Resource objects /
> > > > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> > > > +
> > > > +A driver can have inbound SAs between 0 and \field{inb_sa_limit},
> > > > +as specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP.
> > > > +For the IPsec inbound SA resource object
> > > > +\field{resource_obj_specific_data}
> > > > +is in the format \field{struct virtio_crypto_resource_obj_ipsec_sa=
}.
> > > > --
> > > > 2.25.1
Thanks.
