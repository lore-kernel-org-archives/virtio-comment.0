Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E394623BCF7
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797276; cv=fail; b=rcwa+nU9h2IWY1+7e762ZH0fNU+szzA7c2DS44VfLxFpFsOnOXVPMvgPU6Jl03+QWaFXcYDanImAlHr7ehTkK2PWQ5+A5Vj/Id8rGQK+IpSHNzbfiThVNd1hxHdzToMNSnP/hIb+7RKGxTJ8te1/xkjUYjofo/hYDVrObwyrogc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797276; c=relaxed/simple;
	bh=ggkJyzquxIMmKsgyB4uorqPsq1mB08wcUBvffBvnj84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZxmB00HyzkCSyPn0kQERB71nV5gBDJAbEyhyi3sJe/h0wNwZk7U01C7PmOsHLDc/Hc4J2txh7mqoZ3tB2GJUWHDeldcngFaeiI8ihJgXpAg++mR/T1re+CaqNS1PQqkvY4jV0pm5z+LKj/9xf112pl/xzZD4Uzn+mkHv2GihiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=hYrugsjE; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="hYrugsjE"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G97bVW019421;
	Wed, 16 Apr 2025 02:54:27 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45yqpjgywk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 02:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu7/gbdWVbtQK4DtCTFXzmlXgDtYoxSMfPfoYRCOtkWZyUF0sYI6bAeh4l+FL8Se3+rInQogR65pk+k0UJsZBpqBLoxwZj6T8OqMkpiM7tqJ+SjYzXgMK5HeMyCkZ791Df5F/2h2Mcq1Rw8dkA2DhTWKbnej40GGqGxkEjnwwQ7/I9WHjfwN1mwTwSOwgARVm0sfcXf2T3Tg+/GcTbr7yRJ7kE+zvVyVzoPpo7XLGVkhuiERJp73UXfNYkhPKo9/H2f+lQwbrvA97U2k78eeFIzYagpz7H0HelsMywMncMzfh407LGyBQjGwwGifdHPy3vObPC5mG9P2QwzgyY0N9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggkJyzquxIMmKsgyB4uorqPsq1mB08wcUBvffBvnj84=;
 b=hCGz9E90nvr8dXBC/8v2neO0Y1M8bjdiWh2gYMrzp0K0T4LFVWKiGTjB6JABfudgiX8tC42st26TsdzolI8vLOs0mNPHDEST5jVYqsvRQvKGmVPy21s0bCx8WuWYaRceObljy0a+ggJLadyd3qDDxArZRlDEpTTpolgMv6vf8+oAEpejVkDqS8nJZGkpLKrIKPNnTZ46QULOxNQKClffyETFIh64EDZjnPn8KQ8ybql68sohVKZEwJTM4DiJOobi5mc8cu3e0aLieDWy4eAHXiGyUyyNv/6HtAEQb5KXPQigK2tZvVfwCc2J6AU+ki/vSX1/aF6p3mWXVq0O+lbtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggkJyzquxIMmKsgyB4uorqPsq1mB08wcUBvffBvnj84=;
 b=hYrugsjEWkgrsZmZf60rrPhste71JPB1lZdfyGUlgcqgfWFSRMYnkUZMtVuQXa+Ndga9V+xKAaZIKOlautL80/TRK6DBLVBKwO63W0XEJEydTLYeI5Osc01n+Ze6LEU6NuKujk9jJMH2+CRW5YDDZK8jnG8AupEsebelmNz9hs4=
Received: from DS0PR18MB5368.namprd18.prod.outlook.com (2603:10b6:8:12f::17)
 by LV8PR18MB5709.namprd18.prod.outlook.com (2603:10b6:408:1e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 09:54:24 +0000
Received: from DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac]) by DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 09:54:23 +0000
From: Srujana Challa <schalla@marvell.com>
To: Sebastian Mauritsson <sma@napatech.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "pabeni@redhat.com"
	<pabeni@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        Satananda Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob
	<jerinj@marvell.com>,
        Shiva Shankar Kommula <kshankar@marvell.com>
Subject: RE: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Topic: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Index: AQHbqFlRwNYemSW4v02rNfOQFMz0EbOkw2mAgAFVS7A=
Date: Wed, 16 Apr 2025 09:54:23 +0000
Message-ID:
 <DS0PR18MB53686E9A5732AA2AAC0656FBA0BD2@DS0PR18MB5368.namprd18.prod.outlook.com>
References: <20250408073857.1783779-1-schalla@marvell.com>
 <HE1P190MB0265957E736DFC9597429820CEB22@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
In-Reply-To:
 <HE1P190MB0265957E736DFC9597429820CEB22@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5368:EE_|LV8PR18MB5709:EE_
x-ms-office365-filtering-correlation-id: e5dd7844-6873-478d-86c1-08dd7cccaabc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1dTT2RIQXdxNU5IbnN1eFRIVTJzRU5DNUhjM1daTFFRb01kNXJRb01uZHZy?=
 =?utf-8?B?bGV5UGJFMTlSUVE4OUVleHVrNlgvQWxQYVgva0FlY29WYmhwN0lCQWZFL05M?=
 =?utf-8?B?Wm4vNURlMnBWZzhmUStxNnpUVURDc0ZWWG5VdmJCYnlVZDR4RXZ4K0kwNkc0?=
 =?utf-8?B?M2luZEZJY0d2YWEvS2ZxM2w4UkhsbjhXdVpYWlJVdmpxVHBWMnNJS3FMem1U?=
 =?utf-8?B?OVdBZlUxcmdIalRWN2FQQ1lIQmlxNzZZZmdnU0xDTzBPYk1WSDVxUUphdzds?=
 =?utf-8?B?WTBIc3FUYXFEQVA3bzRyY0M1NG82U3hGaVpCWE9lWm0xSnBDandFM0JJYnVm?=
 =?utf-8?B?YlJnWk84OGRvMm5uaU1KN3N1MVM4S2tCSGREM1BqckxoblB4bzRsVlA5L0pC?=
 =?utf-8?B?V3NQWk9LTGhydHhpOWttQlRORnRPNU9yVHBXTVVMYmdTU3RiL1pPSjJ4TWxC?=
 =?utf-8?B?emRpYUc0cFdXWTYzVWV5bU1sUVdMRTh6YldvUUNMYWpwZTRna3I0VUZXL3gw?=
 =?utf-8?B?UGVJaE92RDAwTk0wbWJ0QzlvOUZ6TGgxOFFjaTFQNVpjRVh6NXhFekI4UnlX?=
 =?utf-8?B?MG9QVWwyT1U4bnd6QTRhb3BNeG9QYVFsUEVZSDdzeGcwMkQrQ285Y1VZdFlq?=
 =?utf-8?B?eEV1bnE5NlIwWWJvUFNPdkNTdjdkS3VuWlJzOWN2MFpkMk95N1FEakozcjA3?=
 =?utf-8?B?Ny92UFFrTGUzRTdwYzB3YVJuR0NIU3F5RmFEdVVGSExCSlFOVzRpK1IwRHZ4?=
 =?utf-8?B?UzlNY1c4QitnZktid292U3RxK3MrYTFiaWVKbC9JMUUxTzVUYVpxQVFZQXFJ?=
 =?utf-8?B?MWhvZ0xQT1p5OFBPZHBtMktRVHBSaUZJa3dlRkVCZnN5dU1WbnQwbTZ6U1hS?=
 =?utf-8?B?b2lUNUV3MWNYRkdrRlpTUXhObzN1U0QybjZ6dk1DUGU4eEcxZ2dLNFdtNUVi?=
 =?utf-8?B?ZXRBN1V6SEtaODBrbGdldk9QalZ0Ulh2U2JlS0ovVHYwVWYwY25WREV5c241?=
 =?utf-8?B?aHZhMGFRSHJuSGVjOG5YMlhEK3A0OGdOVVJ3cy9sZFZ0VWppTE1VcWdlcUVT?=
 =?utf-8?B?TnNoZXFJb0l4dVVwZTd5NGpTTVltTmh4bUllMmRjY0FZSXNGSG02b3hQYTlM?=
 =?utf-8?B?RFcwOHRDRjhydHdicTM1ckdUUHlEaXBPQkZxY0tpMkp3YitFNVJjZ1I2QlBD?=
 =?utf-8?B?UEp4dnQ5Yi9DUDZXV2oveVpaTUI0bHhhZC9BS0h2eTVvbkJpMVEyQlJpVUlK?=
 =?utf-8?B?QTkrSlI2Nlg4T1IyUklIcm9vVml1L0dudmJkd3BEVjduUkducDdjcmhDQnFT?=
 =?utf-8?B?aVBubW1xVnJrOXVIcnNvWTRYam9nRzJkMHBhaG9ZN2d1VHh1YUUyYTdka1dH?=
 =?utf-8?B?Y0lwb1hCK0V0ZnBXWFlNUDJab0EyL2tyOHc4TnFWSE83cUhqWmRPVHk0S1pC?=
 =?utf-8?B?QVJKMkNIbTBud1BHdzJyU2c3QkhoWDBuQVcwM0dzdFJDMTArUVhPSy9nWVJn?=
 =?utf-8?B?U3dQdkR0UzZXZnBhQ1FqdTNhWm9KbVRVZlV0NFNyWklHVndBZmFQY1p4bE9G?=
 =?utf-8?B?anEzSFI3dDAyOEs5bGU5ZmpVcnp3Mk9XcmZVMmthdkY5YjhIZUphcTBHa2lF?=
 =?utf-8?B?RFBpeDVBM1UzNFJOWjFiWHdDSTVuR1FmK0s3dGRsaHpJSjhnWE1tcS9GanVj?=
 =?utf-8?B?SHBLR0M1a3V1N2FJb2NxYjdPaGttays1QUFXVS8vOU1PcTI0eUlqMVpMZWM4?=
 =?utf-8?B?TE9vOWFKcFVlNWxTb0dOT1kxWjVJYnFmS3lya3kycXl0U1RRSFlqKzZwbGZD?=
 =?utf-8?B?Z3BRd3l0T210U0VhakF3UWlUZFZhTW1wM3BGKzhkT2pqajRRZHpKY2FmbWwr?=
 =?utf-8?B?YzZZV1NGL1lWcUcxcVZLQnZqNnVxZnRTN01IdWp0a2tjZXFITS8wOUhSNTl6?=
 =?utf-8?Q?juRpcDNfY60=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR18MB5368.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1BsMnFNQ1RaK2hJdHg1emZvelBUREo5QVRZUm9xSDh0djBTVWdwYzdHUmF3?=
 =?utf-8?B?ZWdDWFJqTjNXS2ZzTm9rbUFjeW9LUlYxc25aZGVHU3Y1R1ZlRTg4UHN4cEQz?=
 =?utf-8?B?cjA4cmtIZER5ZWFRVlBYNDFXdWdyaFpRZU12WlpoZ3BKdjlVRFZUYkFZdXF3?=
 =?utf-8?B?R21Wc1FranZET1BDcUJZWW5wVUc0ZXV2RXg3SkVKc3dMVE1iRHFEWHNWUGsz?=
 =?utf-8?B?YlYyWUJvb2prSkQxQktCNk1qYmllNkdKdjJtVUlFTEtObjduVWdNcGhsRDBD?=
 =?utf-8?B?ZGJQTWgxQmJERjF2RkVwYWZoM0RDcFUrb011a3IwZEo3UE1nSlZjSGEySHJM?=
 =?utf-8?B?Sk5jSlVtT21EL3pBZkdnYWxEQWtBbjNzWWlvWkhlMzF1RWZvK2E5QU1HY1FN?=
 =?utf-8?B?K000azRUYlhweWNhdkNLQW9aT0ZIUHNhcnFFR09uWHlhOTR3ell0cGsramhx?=
 =?utf-8?B?MFZHMUl0dXhHdkw1Q0RYWmJiand0dXk2Wmh6SXljeWZtcVE2RDJmUkl0RVJK?=
 =?utf-8?B?c2VHZzNEUWZwa0ZybVo2SFdSN0NCcFhrWEh6bFRCTXAxajFjV3lXMysyL0F5?=
 =?utf-8?B?Ukx4R254UXpaK1pPZStTbUkxZVJRUUkyOXZMNElMeVpxOHNqTE5SVW9Sd2gr?=
 =?utf-8?B?SnJwTGV5amxreTZFVXdzZlpFVmk3YmNZcm9maGRWZ25VUXQ4QS8vZFEvOGRn?=
 =?utf-8?B?YXFTSGErem5IUkZYb2JGNjgrSk9iQ1V1UjFGRlhQWnYwUUJhT2NJMXpJYUVL?=
 =?utf-8?B?ajVwWWNzZ0d2Z1VpTkJnMWYwR3JSUnJETE9FcFAySFU1ZmFid00rcFNKYjZS?=
 =?utf-8?B?Z0FTYlRqRTRNT094Tk9nTEtnTmpDUVgzWVlKdG1KZEdwSkxRY3FMKzUvWmd0?=
 =?utf-8?B?ZzRzSnhnRDZWam5NZ0k4R3NXQzJTMy94SmwvUmw4ZU1vV0U1cElUbzJGL3VO?=
 =?utf-8?B?SjhtYUNYNWd4eDI5L1BZYTFPL3JZRHVaY1o4OTd0WkpOc0xQOFR5NUxzNm9U?=
 =?utf-8?B?V2hMa0w5S0RKbGVTU1JsdUJFanNpemZEV29qSzFTRkZKUHNvNHNPU2N5V0hH?=
 =?utf-8?B?NnRKUHZTNUI3QXBwbU1BUTArN3IrM3dTd2h2YWt3Q3ZCZmk0b0J6dHJkV0Uv?=
 =?utf-8?B?YVY2M1BsKzdkWnNSL1k0KzVYS282WUVBZ0FyQ3BDN0xXaDdZbEVERUFKRzJZ?=
 =?utf-8?B?ODJ1UWg0aGlndkRlaTg1VE5oYmg2c080NVFBeVRMcXBZTXY1eXU1c1B5eTl3?=
 =?utf-8?B?T3gra1dpRWR3Z1gzN1d1RW1RdFBqb04xN0Q1c1JYQi9qM21qMWx4RWFnd0xn?=
 =?utf-8?B?T1BFN3BYK2Vzd1lxMnlFM01LNzJabFdpNzU5S0FLaVdzdmxLbVZrN1VUVmlj?=
 =?utf-8?B?aGJ2Y21yYW54NmRvYXdRSXZMTENiS0NiVG9jSFg2bCtZeVNOTzV3anpoNmx3?=
 =?utf-8?B?d2VCYU1hbnF2L2tHbjFrRTlzbG1GWUdjdUJDREttQ0xjdDF0cktmVS9RRXF5?=
 =?utf-8?B?M3FhVW5EYXZNY1lqQnFTUDZOdDJkWVNuL3JQQklORkRoeHVnZTdLTXYvQkw3?=
 =?utf-8?B?ck5zNURHMi9mcjF3amJhVzdZVC9Db0ZoQW1IekZpeXZPb1lhQnZsYUxhNW9J?=
 =?utf-8?B?SlVCbmpPMW0wcTM1aVZTQkxwT0JFRlVKcE14NmtNSUJud3Z2c2RSQzJqYXpr?=
 =?utf-8?B?Y2s1TlhWVWtlenZRQjdrTDZ2UU03ODNKd1JQaE5mVU5pYVd5R0hSQnRlUG5q?=
 =?utf-8?B?MzhKU2t1Tm1lM3BaSHlQTEw1Z1NNUXJmSDNJNWgyNWVKUnladG0vZ1ZtUHcy?=
 =?utf-8?B?N3E0NElaYWFLWlJQWkh1NFZoMllXNGI4UC9vd1FjM3JDUldHOFcya2VzcGhQ?=
 =?utf-8?B?QXRJTGdIeno1Z3ZQSTJRNzlHcXRiL1FFUDRvaWZ2Qyt2c1Z5VjBSZmp4RmhS?=
 =?utf-8?B?WTNDOUtPWGlMZHdhTEp3T0g3MUsrM3NKbFJOUnEwd3FJUEJFblRRV3BHN0t6?=
 =?utf-8?B?OTZpYzhxaExRSGZ1UmlKRVcwcG95NzlKbDRXVE81aDZkZEpxTFZxcXRsS1o3?=
 =?utf-8?B?OXp6bWNPb3pib0p4czdsSkpyMEVMVTBObEZvN1ZyNWpKRERhMHMrWUZwaFds?=
 =?utf-8?Q?kQTI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5368.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dd7844-6873-478d-86c1-08dd7cccaabc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 09:54:23.5963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xptmGwAKf7kOg5hLKJx4N7RpZYsNH/iuGzBqN717Cg99HItPXrtCxiJr7oRuqnwfA5Y4mDhpq6BnH04exFa4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5709
X-Proofpoint-ORIG-GUID: o52gC3uw9a931bAjIGBt2zsb86-HaL6K
X-Authority-Analysis: v=2.4 cv=ZOvXmW7b c=1 sm=1 tr=0 ts=67ff7e53 cx=c_pps a=di3315gfm3qlniCp1Rh91A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-AAbraWEqlQA:10 a=RpNjiQI2AAAA:8 a=M5GUcnROAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=dq1i4Hb6DinX8uR5XWIA:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: o52gC3uw9a931bAjIGBt2zsb86-HaL6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01

PiBXaGF0IGFyZSB5b3VyIHRob3VnaHRzIG9uIGhhbmRsaW5nIE1UVSBhbmQgZnJhZ21lbnRhdGlv
biBmb3IgRVNQIHBhY2tldHM/DQpXZSBkbyBub3QgcGxhbiB0byBpbmNsdWRlIHBvc3QgSVBzZWMg
ZnJhZ21lbnRhdGlvbiBzdXBwb3J0IGluIHRoaXMgc2VyaWVzLiBGb3IgdGhpcyBzZXJpZXMsIHRo
ZSBkcml2ZXIgb3IgU1cgc3RhY2sgbXVzdCBwcmUtZnJhZ21lbnQgdGhlIHBhY2tldA0KYW5kIGVu
c3VyZSB0aGF0IElQc2VjIG9wZXJhdGlvbnMgZG8gbm90IGluY3JlYXNlIHRoZSBwYXlsb2FkIHNp
emUgYmV5b25kIHRoZSBNVFUgbGltaXQuDQpUaGFua3MuDQo+IA0KPiBCciwgU2ViYXN0aWFuDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU3J1amFuYSBDaGFs
bGEgPHNjaGFsbGFAbWFydmVsbC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgQXByaWwgOCwgMjAy
NSA5OjM5IEFNDQo+ID4gVG86IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldg0KPiA+IENj
OiBtc3RAcmVkaGF0LmNvbTsgcGFiZW5pQHJlZGhhdC5jb207IGphc293YW5nQHJlZGhhdC5jb207
DQo+ID4gcGFyYXZAbnZpZGlhLmNvbTsgc2J1cmxhQG1hcnZlbGwuY29tOyBuZGFiaWxwdXJhbUBt
YXJ2ZWxsLmNvbTsNCj4gPiBqZXJpbmpAbWFydmVsbC5jb207IGtzaGFua2FyQG1hcnZlbGwuY29t
OyBzY2hhbGxhQG1hcnZlbGwuY29tDQo+ID4gU3ViamVjdDogW1BBVENIIFJGQyB2NCAwLzRdIGlu
dHJvZHVjZSBJUHNlYyBPcGVyYXRpb24gaW4gdmlydGlvLW5ldA0KPiA+DQo+ID4gVGhpcyBzZXJp
ZXMgZW5oYW5jZXMgdmlydGlvLW5ldCBieSBhZGRpbmcgc3VwcG9ydCBmb3IgSVBzZWMgT3BlcmF0
aW9uLg0KPiA+IFRoZXNlIHBhdGNoZXMgYWltIHRvIGV4dGVuZCB0aGUgY2FwYWJpbGl0aWVzIG9m
IHZpcnRpby1uZXQsIGVuYWJsaW5nDQo+ID4gaXQgdG8gaGFuZGxlIElQc2VjIG9wZXJhdGlvbnMg
ZWZmaWNpZW50bHkuIFRoaXMgZW5hYmxlcyB0aGUgb2ZmbG9hZGluZw0KPiA+IG9mIElQc2VjIHBy
b2Nlc3NpbmcsIGJvdGggYmVmb3JlIHRyYW5zbWlzc2lvbiBhbmQgYWZ0ZXIgcmVjZXB0aW9uLCB0
aGVyZWJ5DQo+IHByb3ZpZGluZyBpbmxpbmUgb2ZmbG9hZCBjYXBhYmlsaXRpZXMuDQo+ID4NCj4g
PiBJdCBpcyB1c2luZyBuZXcgdmlydGlvIGJhc2ljIGZhY2lsaXRpZXMgb2YgY2FwYWJpbGl0eSBh
bmQgcmVzb3VyY2UNCj4gPiBvYmplY3RzLiBCZWxvdyBpcyBhIHN1bW1hcnkgb2YgdGhlIGNoYW5n
ZXMgaW50cm9kdWNlZDoNCj4gPg0KPiA+IFBhdGNoMToNCj4gPiBUaGlzIHBhdGNoIGludHJvZHVj
ZXMgdGhlIGZvdW5kYXRpb25hbCBzdXBwb3J0IGZvciBJUHNlYyB3aXRoaW4gdGhlDQo+ID4gdmly
dGlvLW5ldCBmcmFtZXdvcmssIG91dGxpbmluZyB0aGUgbmVjZXNzYXJ5IGNhcGFiaWxpdGllcyBh
bmQNCj4gPiByZXNvdXJjZSBvYmplY3RzIGZvciBJUHNlYyBvcGVyYXRpb25zLg0KPiA+DQo+ID4g
UGF0Y2gyOg0KPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBzZWxlY3RvciBhbmQgYWN0
aW9uIG5lY2Vzc2FyeSBmb3IgSVBzZWMNCj4gPiBwcm9jZXNzaW5nLCBsZXZlcmFnaW5nIGZsb3cg
ZmlsdGVyIGFjdGlvbnMuDQo+ID4NCj4gPiBQYXRjaDM6DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1
Y2VzIG5ldyBmaWVsZHMgaW4gInN0cnVjdCB2aXJ0aW9fbmV0X2hkciIgdG8gdG8NCj4gPiBzdXBw
b3J0IElQc2VjIGZ1bmN0aW9uYWxpdHkuDQo+ID4NCj4gPiBQYXRjaDQ6DQo+ID4gVGhpcyBwYXRj
aCBzcGVjaWZpZXMgdGhlIHJlcXVpcmVtZW50cyBmb3IgYm90aCB0aGUgZGV2aWNlIGFuZCB0aGUN
Cj4gPiBkcml2ZXIgdG8gc3VwcG9ydCBJUHNlYyBvcGVyYXRpb25zLg0KPiA+DQo+ID4gVGhlc2Ug
ZW5oYW5jZW1lbnRzIGFyZSBmb3IgcHJvdmlkaW5nIHN1cHBvcnQgZm9yIElQc2VjIHdpdGhpbiB0
aGUNCj4gPiB2aXJ0aW8tbmV0IGRldmljZS9kcml2ZXIsIGltcHJvdmluZyBzZWN1cml0eSBhbmQg
cGVyZm9ybWFuY2UgZm9yIHZpcnR1YWxpemVkDQo+IGVudmlyb25tZW50cy4NCj4gPiBXZSBiZWxp
ZXZlIHRoZXNlIGFkZGl0aW9ucyB3aWxsIHNpZ25pZmljYW50bHkgYmVuZWZpdCB1c2VycyB3aG8g
cmVseQ0KPiA+IG9uIHZpcnRpby1uZXQgZm9yIHNlY3VyZSBkYXRhIHRyYW5zbWlzc2lvbi4NCj4g
Pg0KPiA+IFRoaXMgc2VyaWVzIHJlZmVyZW5jZXMgdGhlIFZpcnRpby1jcnlwdG8gSVBzZWMgc2Vy
dmljZSBvcGVyYXRpb24NCj4gPiBjYXBhYmlsaXRpZXMgYW5kIHJlc291cmNlIG9iamVjdHMgZGF0
YSBzdHJ1Y3R1cmVzLCBhbmQgY3J5cHRvZ3JhcGhpYw0KPiA+IGFsZ29yaXRobSBkZWZpbml0aW9u
cyB0byBhdm9pZCBkdXBsaWNhdGlvbiwgaG93ZXZlciB0aGUgYWRtaW4gY29tbWFuZA0KPiA+IHR5
cGUgdmF1bGUgZGlmZmVycyBiZXR3ZWVuIFZpcnRpby0NCj4gDQo+IHMvdmF1bGUvdmFsdWUNCj4g
DQo+ID4gY3J5cHRvIGFuZCBWaXJ0aW8tbmV0Lg0KPiA+DQo+ID4gZGVwZW5kcy1vbjoNCj4gPiBo
dHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpbmtw
cm90ZWN0LmN1ZGFzDQo+ID4gdmMuY29tX3VybC0zRmEtM0RodHRwcy0yNTNhLTI1MmYtMjUyZmxv
cmUua2VybmVsLm9yZy0yNTJmdmlydGlvLTJEJmQ9RA0KPiA+DQo+IHdJRkFnJmM9bktqV2VjMmI2
UjBtT3lQYXo3eHRmUSZyPUZqNE9vRDVoY0tGcEFOaFRXZHdRempUMUpwZjcNCj4gdmVDNTI2M1Q0
DQo+ID4NCj4gN0pWcG5jJm09cWVRMzhja2c5Q1Y5WFlqcTZsVE80ZUNTajJVT0kybjl5WXBxWjFl
d1pBS3BZMVR5TVBWDQo+IGFKR0x0NW9tN0UNCj4gPiAxU2Emcz04bkdkLUFXdHJJa0dBRlZ3VG1J
MXJoX0RJOGREYV9oYm8xeXF2My1ydEFZJmU9DQo+ID4gY29tbWVudCUyZjIwMjUwNDA4MDczNTEy
LjE3ODM2NDEtMS0NCj4gPiBzY2hhbGxhJTQwbWFydmVsbC5jb20lMmYmYz1FLDEsZTBIMU5HMGJn
b09YRFRqZElOeWNrOEVzUW8zaUotDQo+ID4gdE9ZUVlXUE1QRExwQXhseVp3SXhmaG5uQ2tUSmda
bkExWjNoTTVhNEJFLVEtDQo+ID4gYUlxS0NOX2pKRUhjT25JNFByNXkzNTJ3WFBWN0M5bDF6MGpw
SWh1bG8mdHlwbz0xDQo+ID4gZGVwZW5kcy1vbjoNCj4gPiBodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpbmtwcm90ZWN0LmN1ZGFzDQo+ID4gdmMu
Y29tX3VybC0zRmEtM0RodHRwcy0yNTNhLTI1MmYtMjUyZmxvcmUua2VybmVsLm9yZy0yNTJmdmly
dGlvLTJEJmQ9RA0KPiA+DQo+IHdJRkFnJmM9bktqV2VjMmI2UjBtT3lQYXo3eHRmUSZyPUZqNE9v
RDVoY0tGcEFOaFRXZHdRempUMUpwZjcNCj4gdmVDNTI2M1Q0DQo+ID4NCj4gN0pWcG5jJm09cWVR
Mzhja2c5Q1Y5WFlqcTZsVE80ZUNTajJVT0kybjl5WXBxWjFld1pBS3BZMVR5TVBWDQo+IGFKR0x0
NW9tN0UNCj4gPiAxU2Emcz04bkdkLUFXdHJJa0dBRlZ3VG1JMXJoX0RJOGREYV9oYm8xeXF2My1y
dEFZJmU9DQo+ID4gY29tbWVudCUyZjIwMjUwNDAxMTk1NjU1LjQ4NjIzMC0xLQ0KPiA+DQo+IGtz
aGFua2FyJTQwbWFydmVsbC5jb20lMmYmYz1FLDEsdGdwN3dIZXlIcUhsam8wNERIVG5Ta2hNS0py
SDFsdm8NCj4gdi0NCj4gPiBVS1BvZF9samQwTnJJVU9zNVUtVFZQWU1heHlwYWtZb210OTUtDQo+
ID4gVnBjZ3NySWszNmpqbm9qYlBlSWtDa1V6Mkh4NDBmS0JRSF9uZlFTTHkmdHlwbz0xDQo+ID4N
Cj4gPiB2MjoNCj4gPiAtIEFkZHJlc3NlZCB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gUGFyYXYg
UGFuZGl0Lg0KPiA+IHYzOg0KPiA+IC0gSW50cm9kdWNlZCBWSVJUSU9fTkVUX0hEUl9GX1NFQ1VS
SVRZX1NBX1NPRlRfRVhQSVJZX1dBUk4gZmxhZyBpbg0KPiB0aGUNCj4gPiB2aXJ0aW9fbmV0X2hk
cjpmbGFncy4NCj4gPiAtIEFkZHJlc3NlZCB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gUGFyYXYg
UGFuZGl0Lg0KPiA+IHY0Og0KPiA+IC0gUmViYXNlZCB0aGlzIHNlcmllcyBvbiBWSVJUSU9fTkVU
X0ZfT1VUX05FVF9IRUFERVIgcGF0Y2guDQo+ID4NCj4gPiBTcnVqYW5hIENoYWxsYSAoNCk6DQo+
ID4gICB2aXJ0aW8tbmV0OiBBZGQgSVBzZWMgb3BlcmF0aW9uLCBjYXBhYmlsaXRpZXMgYW5kIHJl
c291cmNlIG9iamVjdHMNCj4gPiAgIHZpcnRpby1uZXQ6IEFkZCBuZXcgZmxvdyBmaWx0ZXIgc2Vs
ZWN0b3IgYW5kIGFjdGlvbiBmb3IgSVBzZWMNCj4gPiAgIHZpcnRpby1uZXQ6IGV4dGVuZCB2aXJ0
aW9fbmV0X2hkciBmb3IgSVBzZWMgc3VwcG9ydA0KPiA+ICAgdmlydGlvLW5ldDogQWRkIElQc2Vj
IG9wZXJhdGlvbiBkZXZpY2UgYW5kIGRyaXZlciByZXF1aXJlbWVudHMNCj4gPg0KPiA+ICBkZXZp
Y2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCAgICAgICAgfCAyMDYgKysrKysrKysrKysrKysr
KysrKysrKystDQo+ID4gIGRldmljZS10eXBlcy9uZXQvZGV2aWNlLWNvbmZvcm1hbmNlLnRleCB8
ICAgMSArDQo+ID4gIGRldmljZS10eXBlcy9uZXQvZHJpdmVyLWNvbmZvcm1hbmNlLnRleCB8ICAg
MSArDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+IA0KPiBEaXNjbGFpbWVyOiBUaGlz
IGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBtYXkgY29udGFpbiBjb25m
aWRlbnRpYWwNCj4gaW5mb3JtYXRpb24gaW50ZW5kZWQgZm9yIHRoZSBhZGRyZXNzZWUocykgb25s
eS4gVGhlIGluZm9ybWF0aW9uIGlzIG5vdCB0byBiZQ0KPiBzdXJyZW5kZXJlZCBvciBjb3BpZWQg
dG8gdW5hdXRob3JpemVkIHBlcnNvbnMuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMNCj4gY29t
bXVuaWNhdGlvbiBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGFuZCBkZWxldGUgdGhpcw0KPiBlLW1haWwgZnJvbSB5b3VyIHN5c3RlbS4NCg==
