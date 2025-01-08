Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD50F1514F8
	for <virtio-comment@lists.linux.dev>; Wed,  8 Jan 2025 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344616; cv=fail; b=I2uDC2kTBznCnKq9GuKhMamcwFYNx4+UGKWRgtznZ2bWzTGtInUfE0Ahg+15HziFTeSZy6CN0O2Uc4pwbbWF6xgtMlm/2rw/mV+tXh6r8NPrhISd0TyXzX0CuJ/M1gCe/+AWonNlgwR2+bfIqhr9pKn+C7WQ+pTFdwr9UeG9gEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344616; c=relaxed/simple;
	bh=xPzzZQ/xSQ/Mo/tRYueO3oJKGBDG/45wjQSKXpv9QpU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CntYQFVNWbTkGrmPBasfn/Y2qRhP6zHl7GiUyYUNZbUpfTD42zNHcIhnpljpZLf0kpPwZfJuc+R7MiR/uWT3+gKkjI+B+8OBQdLn5Gw+Y8z6H50Z+sU4/KpnAfdZlruDnuzqNAhIyfFA5Ph4Voj12RVxM0O7+5WhKIwPeoG4e2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HYNKWmUw; arc=fail smtp.client-ip=40.107.100.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HYNKWmUw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZvvF2Q17dGNJZ7bayTMuPhcLnSWrMsR+w8SxFhtXwUi90iRKoW+4G5VvVv/eXKfulhTIWgc/iaFOW8ZHx/4hMm+j9GkeS8grskWsLUcU7mjiDaCbtYZ/U2aBEyFvcmuR+EOlxnBodPszrJBTtnrlj1lzA7rdfQi0kTkmCLCFoUIPFzDv9mdeIri7xsfDXilvXae5iQIjl+IV1yRenr62BkT4awfIKdbqxrm7B61cnUMRJLfqLNRS11VD7+qKwnY20O9D6tHRplnjydfIGqQtIn3f/PeiKc2h1Rl7CK9fcV9L7NCnQnkYgi0PkgWXyY1IzCen0icqSODBGWMrCZrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPzzZQ/xSQ/Mo/tRYueO3oJKGBDG/45wjQSKXpv9QpU=;
 b=ZnwYbQK3ujXg20pSnli95c4F49Q5Q34mXG8sZDfo6BrTRaQ63I2dNLARsXIgHPyGrxVeeVBAidAxmjsVPzs1CrhiJcKZd7DDh+c7vxigk9TgvkBSN+yZSyUyd7dzORO1ul46Ftn1W7ioqpkAFEpdwsTZGlf4mzdc3a2DN5vh0Uu8h2av9OeXpc2Tzt/hxomTsLGFxw6xfObKzMaJKKGc55C8SgVW3snJT8CXmd81Eu79ifIVUDIMYqwK+SjMHargOpIMJBvOrJzjbi688IMz1d7qsdxQ+Ub8LCswDF4q+01DhovyZTxrbmvze9bGTOLDt/Oez2B31aCLl+SXxiwyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPzzZQ/xSQ/Mo/tRYueO3oJKGBDG/45wjQSKXpv9QpU=;
 b=HYNKWmUwof0qVfd6xCXq5yKSvmK7Pv4f/28NII38Duc1i+ub2DnqmdaEvkwR2oSMddctbmdFVwx9/O7BsKZBsI/G+8LxzB8z3OrA9WJCEwU5bgORqM24ERG+CudS7oiOw3MXC1Vcrrt4Z3m+wAQOggh4kL6GGxLY4NAxzPiit6djhmtomL/mlIb2BRz9dsMWhY5rxuLV/CX0QVFf/86j2YZ0/W43pLgmfocggy/c3erGM4KbIICpLwmhyV4OKgdIfCDdxlcZpLmpL9aoJzMo3mnzmsl4zIyrcmTngvs1YwaNBOZqe0NCHeyqnpSWhSxyM8QyZ+tiXHso3++R8xpJsw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 13:56:51 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 13:56:50 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, Satananda
 Burla <sburla@marvell.com>, Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>
Subject: RE: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec
 support
Thread-Index: AQHbT6gqKgmrlFjot0CJa6KW+2V/8LMJTlBggAOCIoCAADn8IA==
Date: Wed, 8 Jan 2025 13:56:50 +0000
Message-ID:
 <CY8PR12MB7195E48C97598CBDB7BF5FCEDC122@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
 <20241216104859.2720719-4-schalla@marvell.com>
 <CY8PR12MB7195646BD0235C75D150D3D9DC102@CY8PR12MB7195.namprd12.prod.outlook.com>
 <DS0PR18MB536893E0DA4022135B04F62AA0122@DS0PR18MB5368.namprd18.prod.outlook.com>
In-Reply-To:
 <DS0PR18MB536893E0DA4022135B04F62AA0122@DS0PR18MB5368.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|LV2PR12MB5750:EE_
x-ms-office365-filtering-correlation-id: 28f68d1d-f053-4c5a-baa2-08dd2fec4d22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTZQQ1JLMi80NlhDOHE2empyUk5icDR0NFdJYVFpQnRJL0tMRGxYa09kQ2Jj?=
 =?utf-8?B?WGFzRVppejdaVnZVTWtGVzY0eWpLcit6T1paMVE0eEJZazJRb0wxVXRIOU1F?=
 =?utf-8?B?UFlTRVZZL2tqNlBicFJ5Sjlha252TFZ3azZlZGdEUzNkbTNyZEtNeWk4ODZk?=
 =?utf-8?B?T1MrQlRVRi9tOWlIZDJjV0tvTjdVNDRNSjN4dGhRcmJDMWJabUpWQXErWlFl?=
 =?utf-8?B?SDRwVzZ3NzYyOGk4aVBTV2VPeE51bzd3M2hLVDlESjJTOE1iWmt3SFFHSnpv?=
 =?utf-8?B?SGhCa1FoTFNET0Rod3AzSHFqQ1h5aEtrV1ZtVC9VVmhVMmtmK2p1WGw1Y1VT?=
 =?utf-8?B?WHQzZ241aGFQbGx4NGJ6cjBCN00vNjM5Q1ZpOFRpMVdpOWx2TFNHVFZtcWNG?=
 =?utf-8?B?NER6OHhDNkswbFFXb0x6WUUrSGM5K3lDUWNWUGRVNXBMMWx3KzIvS2dpWXJz?=
 =?utf-8?B?TUFCZ2xKY0FWcHhMQ0dWMTFyeWF6dnVMNGpENFl6M1Rzc1NEeDhtelEwY3RR?=
 =?utf-8?B?MG9FdmEwaFNydDMyeDRsbnMxRWxBU0xPTGlPQ2UybWgwWkkvSTdTemZSS093?=
 =?utf-8?B?Nlg5MlJmY2V2cE9xUzRrdmQxRzhZM0ZaS05nTmJGZWFKdjIyMGs3aVZ4aWpG?=
 =?utf-8?B?M2NxR1JjN3U3TzhoVkNlNDM2T1oyOXVTd1BHN25qRlQrdzdrQVY2OUFBeDBU?=
 =?utf-8?B?NTBXVmdabDRBMWVaQVZOWFRJSFI5cUtvV1J3dUwrQjcxZ3I2SmJiYUF5RFdz?=
 =?utf-8?B?c3NIaDBxMzRhemxSRk5YSVpCRGxTT2x1RHhOV1ZWZVJrcHhZblVmR2ZMZFVO?=
 =?utf-8?B?T29EYWxyelpUTlFxZndUSzBJV3Z3eTN4WFVqa2s1T3VSR2FULzViV2ZybklI?=
 =?utf-8?B?bXVrRzQ3TURKbDh1ZDUzTFBDN3RNSDdCSTV1azRpWXpZZjBmWnNraTJpblBk?=
 =?utf-8?B?OC9IYzFRcVU3QWwvRHQzWHhXVGtHeTltOE5ERFRUc3F4Z291MEM5UTVJaGt4?=
 =?utf-8?B?U3hZZHliYVNFYkZJUFd5OWtsN2hqdXczNUN0KzF2YnpxTzFEVEN1N0FxU3lr?=
 =?utf-8?B?d3ZNczRHT1k4MEhFeUdWZTVrdkhnaTY1SnpQMDlaNXdVZ0cyL25DUk1PNTZE?=
 =?utf-8?B?TG53azNFMTZTcUtIVjB0cFZXWmpHMVo0NHprU2JkeUtrMzVNbzV4Zy9uVnBy?=
 =?utf-8?B?Q0tmdmRhNlRmNGN1bFhwbXVsTUpXT3J4ZWFTK2UyZmJvSit6cmFhV1hvbnR5?=
 =?utf-8?B?V0JPRmFKZ3pBYnNrU1NQTUt2Q3VzN3E4czhmRFFKU3BuTnhPTXg1bFRzY0l4?=
 =?utf-8?B?T0V4dnNvUTVYdmlsTmNZV1FrTjZLek1nb1JBQWVVUWl2TThpTFllYytkdzFr?=
 =?utf-8?B?NHpNc09tcGFnVjNGbWxjQTFNanpKL21yNXZJSzc4ZjkxVHkwSFpWWEFwMmVp?=
 =?utf-8?B?ZDIzZzF1dVV4SHV3ZkFOQ3R3ZllodFB5cVZ1SGhCay8zdlVoTERMb3AzYjJq?=
 =?utf-8?B?V2hncVZTL3dKUy9wbXJCQnNlczNKdDRvY0RjWnVrVlFNNkhLT3NZSEpWL080?=
 =?utf-8?B?U3ppdXcrbVVGNlcrQW1kd3BwMm14NDBpOFRLcTQ0bGRGKzNYNkhibWUyU1Ji?=
 =?utf-8?B?eHRMQWNPM2MrcStoYUMvT0V2UFNiOVhtWm9nTGVYSUJpS1NhTkkzM2FGSXFm?=
 =?utf-8?B?MmhrVndYZ0svaGdEZ2F0Y3FwQkpKWVBxTzZ2RWcyWFlpbHpqcGJvajF1Z1Av?=
 =?utf-8?B?ZUlxb0FlMWtZWnpxOVBicWRneDFMTk44V3VObTVGR0ErczczSytwbmlSQ21x?=
 =?utf-8?B?dnhtbk82MmlLcWxMUzZkUEtHZnJBOHNpdDdtQndnK3hKZHhyUCs0dTUrTk0x?=
 =?utf-8?B?WG00TUZLMXRPY0ZZaU1wWU54YzMxRDh6dFBSTVFmV1A5Vk8reHgxZW1DQjZ2?=
 =?utf-8?Q?6daIiGh9cvpuzSB+EYq70OV3XiFFyIeG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RE9rbWV0R2VNeWRFY0hFalVyelNqcTkxOW5XM3MzL3QvOTZPRXZNZmhZejlh?=
 =?utf-8?B?R2NSdThiYVB2dDNVVmpXNXVGRE5NK3M4Rk9JWENZUGVnZ1ExT3lJU0N4NVox?=
 =?utf-8?B?Q3g5dytOS05qSzJUaUNtU2JNLzZKTXVFMlhVN0U0Lzd1QWg3a1pnYVQyUDk2?=
 =?utf-8?B?Qnh5SS9CaFUvNjV6L1Y0c3d4bFVmUFh5L1JCZWprckFMVktlMCt5VDF6Z05s?=
 =?utf-8?B?R1dQeUtkd1kwejhOZXRTNmZMU1U1d2VjcmUvZ09zdWQ2N1FVem1sWUErTGVF?=
 =?utf-8?B?UVQ0dnh1YXBLWndpUFpaSDNEM211TXc0Z0tEZ0sxL291QlBFclZQVEd4blh2?=
 =?utf-8?B?c042QzFaTVNVTlVXN1VrZksydzl4QzlrVzEzZVRSbUhRZ2VuTmtDU3hYR3E4?=
 =?utf-8?B?K3pkWi91Zi9WMWZrdkl6ODVjVS96UVR2OEtaTUhKdTJ6MnE4c0VweTFXOGp0?=
 =?utf-8?B?SDRnMHFHSkxEUGE4LzRkSDZUdXlhM3dmSC8vT2NWd3YyVzE5TU5aem04RGtF?=
 =?utf-8?B?S1Q1VERmZmdXTTRLclpBTDZQdEZybTNzZXZpa3FpdmlIeEVKSU9zbzlGVnZj?=
 =?utf-8?B?aG13bmdpbHBEVkF6b0ljdUV1bTlXVjhZSEdoWHhBdEJ3dXhXN0UyQ1ZlWFpx?=
 =?utf-8?B?UmdVbUhFd2paM1h0SUs5akMvRk9CaWNhWmJXcVBFbVVkVTZOR2JJNVZ4TVIw?=
 =?utf-8?B?UTZyUm11bUFZL2VtOFp1NG8zSjBJYjJvZGtibU9JM1hOeGp6aDFvUUxMM1Vu?=
 =?utf-8?B?SVFsMXJjbkpEWVFVS002RGVTdXBQR0FReGI3QUUrTXpGVk5BcEZ3MnZkOVRz?=
 =?utf-8?B?cmNtaTJrNUNIbTc2elYzVzdjSk41R3lFaDZubzlrcWl0YWM1OVBNYTFJczdn?=
 =?utf-8?B?UlM1NWcvUFp0Z3pKOHZHZUI3dEZrbjNOVkg2ZzIzbmdudnBsZE5mVHh1ZGlw?=
 =?utf-8?B?c0ZjV1VIY0hsM2ljVCtSc1ZLazFwVThqV1VtQUlsTDE3SkxlcnBmalNNbDBr?=
 =?utf-8?B?bi95N1FGNDBycERZYVZ5dzFKSUF0WUgrUjAyTks1ZWx0c2d3MjdzK051MHFP?=
 =?utf-8?B?Zkk5RzF4Zms2UUluYU9aeWRxUzVkN3NtYUMwZDFyQTJMT0FOSTJxWG9GNXpl?=
 =?utf-8?B?R1hicXlTUnlKbjRjZUZ0cUFSdjRXK1RlTmxmWVNQWUR3LzN3MUFCZjNFeUJh?=
 =?utf-8?B?bnp2bHl0SVBVU1ZGL0k5OFVJMzArYXZQYjFhT3BFTk5WbzNSMFZSYjd2eTUx?=
 =?utf-8?B?aHJobkd3eUhwUzJsTlQ3L0Uwd2liandqSlRoUXpHQlhQNGdGMlc1Z1FjcGdu?=
 =?utf-8?B?cFRVYmtKNGhnU3NRZklnTmxoMHZLUTl3Z1UzRHJ2K3hibU1pWVA1NWNjWU8v?=
 =?utf-8?B?azZyMGNiMy9Rc0NDNWJqdGFEZ0k3QjRtbTFBNHl6RmlTT1VBbWwyRWd6SlQx?=
 =?utf-8?B?bzdYa0hpdkZiRFRyOUpnNlhXeCtFUVVsSVZmeHAvLzByRXRoelJzNkorUlVz?=
 =?utf-8?B?b2dKV0UxZ09ham5QWEd6Yk1BeXJMUXN3TUdGZmRoSDZuNG5vWmJMYjVmMVJP?=
 =?utf-8?B?L21nQlFWV3BqWlp6bW1VbCtHdHoySnZhMkZmMEREY1VSd0xQWElCL2kvdWFJ?=
 =?utf-8?B?UUZPQmhMTnZvTmJqUC9qMGIzSUVqZUZiejBYVldrT3N5WDZPcFI5Vkc3KzlO?=
 =?utf-8?B?M2RRRDFZanRWWEFRRkRyU3F1REVDOStDM0NCY1lHV2hrRFdFeGwyN2RxWlYy?=
 =?utf-8?B?a2krNTFmZFNZdWdxR2p0cGV2cWRablM2YUloTTN0WmxKbEtVZGdrNTgvZFpM?=
 =?utf-8?B?dTNvRWJXcGhWVVBLQlZNdXUxcUFJWnZLOXREekNyUW9TczhaT3NYcW9sSE1u?=
 =?utf-8?B?VEo4Y1RZblZnaUYxQjZGdTgxdlNTK1BwSjZPUk84dnh1emhCLyt4dGxLUldB?=
 =?utf-8?B?MDhHclVRa3BvZTN1OG1DZ2JWc2hqSzRDbkorVjVnV0diNndUTno5eWpmNGts?=
 =?utf-8?B?SXcvUk9EL1Nta3EwZEVYYkVBMFc3dEdSK2lWVzNhTjM1NnlRZ3ZodFB3OWQ1?=
 =?utf-8?B?R25qNE1LS0VUSlppeHZRRnhpNENYS0RlcVlLNjEyN1F3UXdjKy9mdllpUEw2?=
 =?utf-8?Q?AUdU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f68d1d-f053-4c5a-baa2-08dd2fec4d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 13:56:50.8788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkEEe+2AuYziNoXho1kNzpUoZkxDkdeUv5xA4RDsOBqmMErXsoei6mGklpMonzt63rBmo+6NPNDBEMfHAPSkbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750

DQo+IEZyb206IFNydWphbmEgQ2hhbGxhIDxzY2hhbGxhQG1hcnZlbGwuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyNSAzOjU3IFBNDQoNCj4gPiA+ICtJZiB0aGUgZGV2aWNl
IHN1cHBvcnRzIFxoeXBlcnJlZltwYXI6RGV2aWNlIFR5cGVzIC8gTmV0d29yayBEZXZpY2UNCj4g
PiA+ICsvIERldmljZSBPcGVyYXRpb24gLyBJUHNlYyBPcGVyYXRpb25de0lQc2VjIE9wZXJhdGlv
bn0sIHRoZSBkcml2ZXINCj4gPiA+ICttYXkgc2V0DQo+ID4gPiBWSVJUSU9fTkVUX0hEUl9GX1NF
Q1VSSVRZIGJpdCBpbiBcZmllbGR7ZmxhZ3N9LCBpZiBzbzoNCj4gPiA+ICtcYmVnaW57ZW51bWVy
YXRlfQ0KPiA+ID4gK1xpdGVtIHRoZSBkcml2ZXIgTVVTVCBjcmVhdGUgSVBzZWMgT3V0Ym91bmQg
cmVzb3VyY2Ugb2JqZWN0DQo+ID4gPiArXGh5cGVycmVmW3BhcjpEZXZpY2UgVHlwZXMgLyBDcnlw
dG8gRGV2aWNlIC8gRGV2aWNlIE9wZXJhdGlvbiAvDQo+ID4gPiArSVBzZWMgU2VydmljZSBPcGVy
YXRpb24gLyBSZXNvdXJjZSBvYmplY3RzIC8NCj4gPiA+ICtWSVJUSU8tQ1JZUFRPLVJFU09VUkNF
LU9CSi1JUFNFQy1FTkMtDQo+ID4gPiBTQV17VklSVElPX05FVF9SRVNPVVJDRV9PQkpfSVBTRUNf
DQo+ID4gPiArT1VUQl9TQX0gXGl0ZW0gdGhlIGRyaXZlciBNVVNUIHNldCBcZmllbGR7cmVzb3Vy
Y2VfaWR9IHRvIGEgdmFsaWQNCj4gPiA+ICtJUHNlYyBvdXRib3VuZA0KPiA+ID4gKyAgICAgIHJl
c291cmNlIG9iamVjdCBJRC4NCj4gPiA+ICtcZW5ke2VudW1lcmF0ZX0NCj4gPiA+ICsNCj4gPiBX
ZSBhbHNvIG5lZWQgdG8gYWRkIHNvbWUgdGV4dCwgYXJvdW5kIGEgc21hbGwgcmFjZSBjb25kaXRp
b24gdGhhdCBhIFNBDQo+ID4gb2JqZWN0IG1heSBiZSBkZXN0cm95ZWQsIHdoaWxlIGEgcmVjZWl2
ZSBwYWNrZXQgbWF5IHN0aWxsIGhhdmUgdGhlDQo+ID4gcmVzb3VyY2UgaW5mbGlnaHQuDQo+ID4g
QW5kIGRyaXZlciBzaG91bGQgaGFuZGxlIGl0LiBUaGlzIHRleHQgZGVzY3JpcHRpb24gdG8gZ28g
aW4gdGhlDQo+ID4gaW50cm9kdWN0aW9uL3RoZW9yeSBvZiBvcGVyYXRpb24gc2VjdGlvbiBzb21l
d2hlcmUuDQo+IFdpbGwgZG8uIENhbiB3ZSBhZGQgdG8gdGhlIGRyaXZlciByZXF1aXJlbWVudHMg
c2VjdGlvbj8NCkFkZGluZyB0byBkcml2ZXIgcmVxdWlyZW1lbnRzIHNlY3Rpb24gaXMgbW9zdGx5
IHRoZSBhZGRpdGlvbi4NCkFzIGxvbmcgYXMgZW5vdWdoIGRlc2NyaXB0aW9uIGlzIHByZXNlbnQg
aW4gaW50cm9kdWN0aW9uIGl0cyBnb29kLg0KQW5kIG5vcm1hdGl2ZSAod2hpY2ggaGFzIHNvbWUg
ZHVwbGljYXRpb24gdG8gaW50cm9kdWN0aW9uKSBpbiByZXF1aXJlbWVudCBzZWN0aW9uIGlzIGZp
bmUuDQo=
