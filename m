Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669818FC7F
	for <virtio-comment@lists.linux.dev>; Wed, 30 Oct 2024 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276133; cv=fail; b=fIikYzkioJfQdOyDlqbnEc+4lMGrQkPa7pQBCExxnsWVi4lOR0QT5kMafrzLSL3zttwc6oeQzGeBa3fvbr66o9qUHRkN1lcPJ+0evdi4Wr2FEv/Dl3WKJ40YgoUSNDE7EcDZdaG+uAIY9AJJ22mY+5TtC+h9LxZ4/zLPKesnsQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276133; c=relaxed/simple;
	bh=Xnvw2ycyFeJHSnI1GFj5Yw6SwLdWBzyR84LxfYGHGjw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H53xacRzQ57uuuWEwHopQGf/3OyTBqQ4UyyprbnquMu9x1B9U0gcHzAsT9pUVk57EDQw2DzAnE4vgeocr/AKi3jxfFHF5BCFKpcyv/3v8VajNSv9Fe58++ooE/rcGgtUXAjr8clq2L4Y6iaFrHUcRof4gfjT49NeayN2fGWLVXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=letakVbO; arc=fail smtp.client-ip=40.107.236.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="letakVbO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWtTqiuBJXH4YW4Sy4spH38QIbqxRdD2pKchC1cayuANaX7VeI87x1Vv04it+CGDyIIBz6SZrq0xCAG5A3SiXqQbpODQJNruqUh1J8lvTccfT6LJ/XtrmqDAHbdGoSWhq4QezgtteuJzAJhxpPesr3z+AiHS/H21qb6yxJJ8LFmO4y8g6dYrBS5N1/ZFskr6RHxq4MPYJHYq0zeeLtjW7YZO/deLIA3O41BFlxLAjI1Ry5TdMfcLcn5C5LWZ5LxY4XZnIPcTSuq5Fb6fzf1UduLHaNbE1imBY177qEY86+cKFUFsidSCezu408RtQPlAYIou1yKv+kyvZ1YNCwUOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xnvw2ycyFeJHSnI1GFj5Yw6SwLdWBzyR84LxfYGHGjw=;
 b=xcfAlL7YSF6MGubSflAxk62prLmoLny9tb8r3xiEqizc8lnj2br/xOqLdVmnSTYAiJn9kukQ53BoSCs6KwRHWq+dQUa0C+eqVKoLbZWYpH6dIzyf2UrU4wZSr76gYFlJmUPfvN46AEYVXwDaDBBKUeNAqIIUTcv+9uIUuQWqR9uvT3G9dnd2W1mwiT7hCysINuSta1Wl84hBIZHHiZOgMlAi6ng51aoTvb+RNck6ONpZ7NYE/wnv4OcFDNJ/LBDYr00DZNXPr6UKIBgg4b2Tojr+ieIapbGFMOSr6a8vPUhcKQllPeBQjLd2PAh81UUVyuLiZO/trdTzwn0/4EK5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xnvw2ycyFeJHSnI1GFj5Yw6SwLdWBzyR84LxfYGHGjw=;
 b=letakVbOXSc+KvuZztIketW1IKSxU/LlfkttZnRNofBZZB+ZmNVvr0Sw/MDVZ8GQEHGRAhoeA+hMCR9iod07vNdjfdr8lK2IF1/ecTRwnHVm3LRaRGr2yx9DCoaCXU6zZ7LixA6W/VYw4cZedKjW9ObNCxGeQFcAurl1sZUeDJ+goxJ1fzdIbPLhkCnUgheM9QSWfO+O4wa5QIAokWL2/aBmRs8v0Q7eALGIHm3UA1XceMOBRtWe2pKTGYOYMsWKs42z8vbVd+x/uWG0SOQbTnqPhSo6RaCstkv+uEuqr+aTt+pfGBvHKm3dfeLeIUI6IfYVpgFtzyZ/SzLDsIjJiw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 08:15:23 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 08:15:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>, "Alexander Gordeev
 (QUIC)" <quic_agordeev@quicinc.com>, Albert Esteve <aesteve@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index:
 AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAKTQAgAAMvECADF83gIAg93dQ
Date: Wed, 30 Oct 2024 08:15:22 +0000
Message-ID:
 <CY8PR12MB719569C9D67ACDB6C30A8217DC542@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
In-Reply-To:
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW3PR12MB4458:EE_
x-ms-office365-filtering-correlation-id: d4281d9d-72da-4087-fb83-08dcf8bb0006
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1FaOXE1clpKUFh3ZEZmNDZFdFVFNmhucDFxOHFTdUdrSVhibnF1akxhdWg3?=
 =?utf-8?B?d2NJOGYyUy9QWFgxNGtPUk5sNjdXTmJHSjNsT1ZsdXl2Y3V2dkVkZm9Yajh1?=
 =?utf-8?B?Sy9mdWFwdE1vMm5nTDNlVmVXZG9PRk9BMWFPbEhzTldqMDR5NEJMRy9Pa29E?=
 =?utf-8?B?MlVDc002MFpWamhsTnd6Q05NeUxySmh6SDlGU1U2OVgxNVRxbTh1MTFCSUM1?=
 =?utf-8?B?bzc5eHczdDFYZVlhb1h3M1hkbWVPcFNkTEdiY1R3a0JsRnFMUC9YY21rbm1Z?=
 =?utf-8?B?cHBSOTN3VzhMZkJVRGtHbU5XSTNOTDZSK0x3Y0RxMjkrUmlGSENEQ1BOalUr?=
 =?utf-8?B?cnhtdExnVnVhNU16ZlpadERaWVdJRWlzSVIyKytLTzUxcmtQTzhBaDBLL3Q4?=
 =?utf-8?B?Rk03RDAvMnZKR2hHdFZkbFRocHpPekhzWTF4YUkrOHJFQWRNazdDeUhlaEF2?=
 =?utf-8?B?ZGRqVXl5WFFDV1lBdndBWmVCK0FuTWxVRWFETldpRFZ3V0hUVk5uNHNIZ0tL?=
 =?utf-8?B?SFBFcjVNSHBOa3hCY3VacXJjVGRPVEEvVHpsNzZBd0hFSm82blFxdmRaYXgr?=
 =?utf-8?B?MjdDOVExMXZwa3ppY0YvanhJWk1ERDBFazNLSzVOalF2RzdjZVo1UGhJM1dt?=
 =?utf-8?B?VzQvN3diWk0xbkZwcW5mTkNzb0xTb0JkY3hXR0wwNExWblZNMWZNMHoyTmJa?=
 =?utf-8?B?UmVjRFFFMGJFQkVuV25nWWoyY1IyelhGVlIrSk13TTZ1SUprbkNZTlowV2pY?=
 =?utf-8?B?QjZST2ZGdU1wQXhKQ1U2V1NWK1k0VTNMbktXU1g0cmZnWTFQOEM3NXF2Ky9p?=
 =?utf-8?B?dERvK29QRzR5T244bjBlTG9mek12bGIzQzlJRmc2ck1XZEE2T1JodnFtTkhj?=
 =?utf-8?B?M3hiYndnNERCWVdCb2U3N1Npc0V0WXNoYXdOYUpTNEVWc0tOTnB3bU9UU1Zr?=
 =?utf-8?B?WkxpMWwrU0pYYThveC9OYjRYam14VFJ2dlJpSEpoSlpNVUFxbXh2NmlWQlU1?=
 =?utf-8?B?VmNjZDdsaml4MitNOHFWZUlCWE05YWNwd0FDVlZtL0x5TnQ3RTV6LzA2N1M1?=
 =?utf-8?B?SktQUW5xZFNzNlNTTEJLQ1lzTjcwWjJRZFQrN3F6ZWlYeEljWXl2Q2V0N3h3?=
 =?utf-8?B?aGxMeEtwdDh2QTh4bDQ5UHJnUVMySUpRNEpvY3VWVGlkdzNCSm91MGYrV1RT?=
 =?utf-8?B?SUhNWkJ3UXBSTkxqcHhmY1dqR2ZUbnFieU9LQktkM2ZWL1QyMkFHMm9MZVRR?=
 =?utf-8?B?R2U4ZTdTdVp4NGdEaXFsemNTUVRKYnNBeFlMN256MDdVSUowbEJNMER2bnlT?=
 =?utf-8?B?V1I4VGhGeklpUDhPREhZOWsyeFdmSWpOckxLamFiazIwZFFIMFJqMWdsdFly?=
 =?utf-8?B?dFpiOE4zSDZkYU9EaTFnU1V6UjIxcGNmLy82RlZkK3pibmJ0Q2w2a0tYcmVs?=
 =?utf-8?B?SmdESm5aM1pRT0tnZStKL3QzT0ZEZXNWYVcvcGhpdDZsSEg2Y2hzRVd5aDVE?=
 =?utf-8?B?SnpSS1NjaE1uRU00UXpTV1dxd0lHWVlRMW11dHpBNTNRQks1K3NrbENRNVh1?=
 =?utf-8?B?VnE5VThHdzZjWEtMKzlKYk94V091cXpDVTV5aStJN2R2a3g3NHlHVFJjK3pX?=
 =?utf-8?B?RitMVTd0bUJScWxyeXdiTThIbkw3aDAxd3NyU0REQXd5L3AwVmZvaUkwRWV4?=
 =?utf-8?B?U2VtWDJIaktMMGpXMEFjbVFQMlFPazQveFhrS0xGYjdEcDBwazVFVHNWNWc1?=
 =?utf-8?B?REZsNW14ZEtKdEVnbUhnNDVHbSs4TlhHbFlibXA1Y2pHdVlWT0NnMzF0MEw0?=
 =?utf-8?Q?r/hrQn+Ka+djwT6QG/cnJq0/FFJYGnqRca72E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THE3bzBVQW1UWEFrVXR0Z3NQSEM0d2w5KzJ2UHR6a3R5T0NFaGhaUTk5YzZm?=
 =?utf-8?B?RjV2RW8xM0FvZ2NVWExPc0gvaS9rMmRHaFVGZ0NOMG1TSHVkTzBSandLSm00?=
 =?utf-8?B?Q1F6MG1NTnEvQzltOFNKNm1rVFpjTEh1bGduVzJrRHNtR2FxVCtadEtrc1g2?=
 =?utf-8?B?QmpZK2FkaGR5Zy9uM3IyRnhqdmN3eGNzM1Y3TFloaUNrZU9LcWphVVJqM0JQ?=
 =?utf-8?B?KzBqUU5lc3puZnFzNTNOOVdzeGQrOGk3L1pZSjJVSlc0RDVJMjVrTTA4VURB?=
 =?utf-8?B?eWJsOFJQVU1EUmwweFIrQ0xPSmtzUXJXZWhTNm1obENXWWh1ZEJKcDViMS8x?=
 =?utf-8?B?UHBZZkxyTjl4TzRUSGdML3g4UnpwUHpmenNMOStWQlB2OWxBQlpJV0lxNVlU?=
 =?utf-8?B?MUZxZjV5Q0RaSjlsc2t2RHhvbldMQmJzNVByYUduVXF2RngzZkovUHFKaXE2?=
 =?utf-8?B?RS8zdHY0YlRBblhEWmVJd3FMQXMzSFVqV2IvWHo4NlFxN3BTOHYzYjJ6Z053?=
 =?utf-8?B?Rm1DcHRYNVhaMDFid04rTy9zNTQ3dFlNbGJEb1Nva2Y2TVh1RjNic0VhQm1r?=
 =?utf-8?B?cGhaVlZJZW1ZZDMzekpsOXE1NkQ2bjZYM0JKUW1lYWw1N0lTcUtQT2NRUU9Z?=
 =?utf-8?B?NjJ0UndwdEM5djdleU1VSFExdmVKcDJkWlBzbEVpamh4UGxSRzZoMWpKeHFX?=
 =?utf-8?B?Z1dxaTNHbVlKOVB3ajFJK1BVQnlmMmpnQUhyZUw0N1pMUHVmSkhMUmpzTmJM?=
 =?utf-8?B?UE5QYmxKNkZvWExMR05GM1Q2em5GK1FaVElqVWxwQ2l5RzVRU3c0NHVlaHlr?=
 =?utf-8?B?MVkxUW9NbGlTVDZoVEptTkFFM0creU91WDhJeEdrUWRpQ3JQY2ZLYk84ejhm?=
 =?utf-8?B?K3NiUHNLL1Q4anF4ZDZoRkZkN0VzR1dja0t1NWFZVnVVTmhUR0xYY1pxVjlK?=
 =?utf-8?B?K3hWQmpRQXNzZkR5RTJjWGFOUDZsNWkyV2ZwUXpJcUUySlhtZHR6MHFpSnVR?=
 =?utf-8?B?VElQQjhKK0pVcWoxT3hvQzg5bHMrREFnY2lOQXcvTDFXODNCbi9Pa25ORk9Z?=
 =?utf-8?B?RjFDcEVDQmxjeWlITVlKeGJlRFR3TnNuVktoMXl4YXRiSktGZzkwOStKL2dD?=
 =?utf-8?B?Wk83OVVBVWNBN3p0QnlvUlMzQUozRjBPS1ZMZ1ZOcnVtdTFWek5EbDVRRkM1?=
 =?utf-8?B?MjZ2RHp2R25LOGYvOGtIL3hjMnVlQ0dMSzI2S0xDVDlOUkV1YkhoWWx2QUlC?=
 =?utf-8?B?V2NBUUtUc0krRWVWMkgyYkcwd3JpekU4RGtQZVRQTDNieU8yclBVSTZKK0NI?=
 =?utf-8?B?bWFKS0lhNG9VVmNlOEpld0JSeFd3L3ZCRnVmcXRmWGFXL1YvWkNMWGQzaGF0?=
 =?utf-8?B?Vm5OMGE3MHIyMG1sNFNhWThJWnRhQzZrQW5NVHRneG5LZU0xR0lsRUZzek5s?=
 =?utf-8?B?aDVEdmRxNmtMdkp2VXNJdzF6VVhPMXVZUGVyM2RPVnV4NlB3SWl2eHlOaUtj?=
 =?utf-8?B?bWdDSXM3UHdiTkF3YkJZRzkvT2xMRFpWWjR0dHBjdU9UcTNyaHVFWWNLRisy?=
 =?utf-8?B?WDZQMWE2dVBkSThoMHA2Y0xjajkxekRBYUdtZXZ2MzJXZUhHT2xuR01LQyts?=
 =?utf-8?B?RnJwZEFmTCtUMEF6NXZPaGFKNWdIa3NHektxWlVYQXNpMmtYNC9zclFxWmkr?=
 =?utf-8?B?RzVRTkNydFJRMU1iNFRoaTFWUE1NOW52RW1iMFI5Nml6Z015bGRhWENBV1ZN?=
 =?utf-8?B?bStPZFc2SXQzVk1zaGw5MlpIVjJDaERHbmY2ZVZZY1F2NlBrSkJCbW9YKzh2?=
 =?utf-8?B?WFdvOWdoYS83M1diMG10ZTlDSHdBZzdFOWRMQkpUN1JETDhYc1VHdHFOR2ZS?=
 =?utf-8?B?THdvL05qNjY3ZlkxUmtOa0xrN0hvK1c3WEYweklabWxFUnN3SHh2ZkZlNXNv?=
 =?utf-8?B?bklCMkhFd3pVSkZTY1pSVUUwa0wzZXlQTThZOTYwMldYaXZGYXNlRDFURGdJ?=
 =?utf-8?B?bG5nNGZkaW9Za0ZCak5WSXhaWXBubmNqYjU0WWtRZ25uTDd5dWdhMFpGaDh5?=
 =?utf-8?B?bXlwMGlNY0NON1dwNDlSbWluWTdkajNnM3M3U204clEwWXBzZ2k0S0FSVUdQ?=
 =?utf-8?Q?vKmo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4281d9d-72da-4087-fb83-08dcf8bb0006
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 08:15:22.2732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdNAHB0dA6vR2bwuj0uMRcGBERJ4DL1lwYfK05/IbiHWu9HKU4jQ2bRe7EXaqMfM0PSJykHs6hk0YwfyZZnRuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458

SGkgQWlzd2FyeWEsDQoNCj4gRnJvbTogQWlzd2FyeWEgQ3lyaWFjIChRVUlDKSA8cXVpY19hY3ly
aWFjQHF1aWNpbmMuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgOSwgMjAyNCAyOjE3
IFBNDQo+IFRvOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+OyBBbGV4YW5kZXIgR29y
ZGVldiAoUVVJQykNCj4gPHF1aWNfYWdvcmRlZXZAcXVpY2luYy5jb20+OyBBbGJlcnQgRXN0ZXZl
IDxhZXN0ZXZlQHJlZGhhdC5jb20+OyB2aXJ0aW8tDQo+IGNvbW1lbnRAbGlzdHMubGludXguZGV2
OyBBaXN3YXJ5YSBDeXJpYWMgKFFVSUMpDQo+IDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+
IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29u
dGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2aWNlDQo+IA0KPiBIaSBQYXJhdiwNCj4gDQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBQYXJhdiBQYW5kaXQgPHBh
cmF2QG52aWRpYS5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDI0IDE6NTMg
UE0NCj4gPiBUbzogQWxleGFuZGVyIEdvcmRlZXYgKFFVSUMpIDxxdWljX2Fnb3JkZWV2QHF1aWNp
bmMuY29tPjsgQWxiZXJ0DQo+ID4gRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+OyB2aXJ0aW8t
Y29tbWVudEBsaXN0cy5saW51eC5kZXY7IEFpc3dhcnlhDQo+ID4gQ3lyaWFjDQo+ID4gKFFVSUMp
IDxxdWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+ID4gQ2M6IGFjb3VyYm90QGNocm9taXVtLm9y
Zw0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1l
ZGlhIGRldmljZQ0KPiA+DQo+ID4NCj4gPiA+IEZyb206IEFsZXhhbmRlciBHb3JkZWV2IDxxdWlj
X2Fnb3JkZWV2QHF1aWNpbmMuY29tPg0KPiA+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAy
MDI0IDQ6MzYgUE0NCj4gPiA+DQo+ID4gPiBPbiAwMS8xMC8yMDI0IDEwOjM5LCBQYXJhdiBQYW5k
aXQgd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+PiBGcm9tOiBQYXJhdiBQYW5kaXQg
PHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiA+PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIw
MjQgMTozNSBQTQ0KPiA+ID4gPj4gVG86IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNv
bT47DQo+ID4gPiA+PiB2aXJ0aW8tY29tbWVudEBsaXN0cy5saW51eC5kZXY7IGFpc3dhcnlhLmN5
cmlhY0BvcGVuc3luZXJneS5jb20NCj4gPiA+ID4+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcN
Cj4gPiA+ID4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9y
IG1lZGlhIGRldmljZQ0KPiA+ID4gPj4NCj4gPiA+ID4+IEhpIEFsYmVydCwNCj4gPiA+ID4+DQo+
ID4gPiA+PiBGcm9tOiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+
PiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNSwgMjAyNCAxMjoyMCBQTQ0KPiA+ID4gPj4N
Cj4gPiA+ID4+DQo+ID4gPiA+PiBPbiBGcmksIFNlcCA2LCAyMDI0IGF0IDk6MDjigK9BTSBBbGJl
cnQgRXN0ZXZlDQo+ID4gPiA+PiA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPiA+ID4+
IHdyb3RlOg0KPiA+ID4gPj4gUmVzZXJ2ZSBkZXZpY2UgSUQgNDkgZm9yIG1lZGlhIGRldmljZS4N
Cj4gPiA+ID4+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNvZGVyLCB2aWRlbyBkZWNvZGVyLCBh
bmQgY2FwdHVyZSBkZXZpY2VzLg0KPiA+ID4gPj4NCj4gPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEFs
YmVydCBFc3RldmUgPG1haWx0bzphZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4gPiA+PiAtLS0NCj4g
PiA+ID4+IMKgY29udGVudC50ZXggfCAyICsrDQo+ID4gPiA+PiDCoDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykNCj4gPiA+ID4+DQo+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvY29udGVudC50
ZXggYi9jb250ZW50LnRleCBpbmRleCAwYTYyZGNlLi42ZDZiM2Q4DQo+ID4gPiA+PiAxMDA2NDQN
Cj4gPiA+ID4+IC0tLSBhL2NvbnRlbnQudGV4DQo+ID4gPiA+PiArKysgYi9jb250ZW50LnRleA0K
PiA+ID4gPj4gQEAgLTczOSw2ICs3MzksOCBAQCBcY2hhcHRlcntEZXZpY2UgVHlwZXN9XGxhYmVs
e3NlYzpEZXZpY2UNCj4gPiA+ID4+IFR5cGVzfQ0KPiA+ID4gPj4gwqBcaGxpbmUNCj4gPiA+ID4+
IMKgNDXCoCDCoCDCoCDCoCDCoCbCoCDCoFNQSSBtYXN0ZXIgXFwNCj4gPiA+ID4+IMKgXGhsaW5l
DQo+ID4gPiA+PiArNDnCoCDCoCDCoCDCoCDCoCbCoCDCoE1lZGlhIGRldmljZSBcXA0KPiA+ID4g
Pj4gK1xobGluZQ0KPiA+ID4gPj4gwqBcZW5ke3RhYnVsYXJ9DQo+ID4gPiA+Pg0KPiA+ID4gPj4g
VGhlIGlkIDQ4IHJlcXVlc3Qgd2FzIG1hZGUgc2V2ZXJhbCBtb250aHMgYWdvIGluIE1heS0yNCBm
b3IgdXNiLA0KPiA+ID4gPj4gbm8gZnVydGhlciBpbnRlcmVzdCBoYXMgYmVlbiBzaG93biBvbiBp
dC4NCj4gPiA+ID4+IEJldHRlciB0byBhdm9pZCBob2xlcyBpbiB0aGUgZGV2aWNlIGlkIGFzc2ln
bm1lbnQuDQo+ID4gPiA+PiBTbyBpZCA0OCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIGZvciBtZWRp
YSB0aGF0IGhhcyBpbnRlcmVzdC4NCj4gPiA+ID4+IEFkZGVkIHZpcnRpby11c2IgcHJvcG9zZXIg
dG8gdGhyZWFkIHRvIHNlZSBpZiBpdCBpcyBzdGlsbA0KPiA+ID4gPj4gaW50ZXJlc3RpbmcsIGlu
IHRoYXQgY2FzZQ0KPiA+ID4gPj4gNDkgc2VlbXMgZ29vZCBoZXJlLg0KPiA+ID4gPj4NCj4gPiA+
ID4+IEdpdmVuIHRoZSB2b3RpbmcgaGFzIHN0YXJ0ZWQsIEkgYW0gbm90IHN1cmUgaWYgdGhlIHJl
YWwgaWQgdmFsdWUNCj4gPiA+ID4+IG1hdHRlcnMgYXMgbG9uZyBhcyBvbmUgb2YgdGhlIHVuaXF1
ZSBpZCBpcyByZXNlcnZlZC4NCj4gPiA+ID4+DQo+ID4gPiA+PiBBbmQgZG8gbm90IHByZWZlciB0
byByZXN0YXJ0IHRoZSB2b3RpbmcgZm9yIHN1Y2ggYSBzbWFsbCBjaGFuZ2UNCj4gPiA+ID4+IGVp
dGhlciBvbiBteSBsYXRlIG9ic2VydmF0aW9uIG9mIHRoaXMgaG9sZS4NCj4gPiA+ID4+DQo+ID4g
PiA+PiBJIHRoaW5rIHdoZW4gdGhlIG1haW50YWluZXIgbWVyZ2VzIHRoZSBwcm9wb3NlZCBwYXRj
aCB0byBhc3NpZ24NCj4gPiA+ID4+IGlkIDQ4LCBzaG91bGQgYmUgZmluZS4NCj4gPiA+ID4+DQo+
ID4gPiA+PiBNaWNoYWVsLA0KPiA+ID4gPj4gQXJlIHlvdSBvayB0aGlzIHdheT8gT3IgeW91IGhh
dmUgYmV0dGVyIHN1Z2dlc3Rpb24/DQo+ID4gPiA+Pg0KPiA+ID4gPj4gQWlzaHdhcnlhLA0KPiA+
ID4gPj4gSXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVzdGluZz8gSWYgc28sIGNhbiB5b3UgcGxl
YXNlIHJlcXVlc3QNCj4gPiA+ID4+IGZvciB0aGUgdm90ZT8gU28gdGhhdCB3ZSBhdm9pZCB0aGUg
aG9sZSBpbiBkZXZpY2UgaWQgYXNzaWdubWVudC4NCj4gPiA+ID4gSSByZWNlaXZlZCBhdXRvIHJl
cGx5IGZyb20gQWlzaHdhcnlhJ3MgZW1wbG95ZXIgdGhhdCB0aGV5IGFyZSBub3QNCj4gPiA+ID4g
cmVhY2hhYmxlDQo+ID4gPiBkdWUgdG8gYWNxdWlzaXRpb24uDQo+ID4gPiA+IFNvIG5vdCBzdXJl
IGlmIHZpcnRpby11c2IgYW5kIDQ4IGlzIHN0aWxsIHJlbGV2YW50Lg0KPiA+ID4NCj4gDQo+IFdl
IGFyZSBpbnRlcmVzdGVkIGluIHRoZSB2aXJ0aW8tdXNiIGRldmljZSBhbmQgd291bGQgbGlrZSB0
byByZXNlcnZlIElEIDQ4IGZvciBpdC4NCj4gSG93ZXZlciwgSSBwbGFuIHRvIHB1c2ggYSB2ZXJz
aW9uIDIgcGF0Y2ggdG8gZW5zdXJlIHRoZSByZXNlcnZhdGlvbiBjb3ZlcnMgbm90DQo+IGp1c3Qg
dGhlIHZpcnRpby11c2IgaG9zdCBjb250cm9sbGVyLCBidXQgdGhlIHZpcnRpby11c2IgZGV2aWNl
Lg0KPiANCkFueSBwbGFuIHRvIHJlcXVlc3QgZm9yIHZpcnRpby11c2IgZGV2aWNlIGluIG5leHQg
dHdvIHdlZWtzPw0KSWYgbm90LCB0aGVuIHZpcnRpby1tZWRpYSBjYW4gcHJvY2VlZCB3aXRoIElE
IDQ4ICh0aGlzIGlzIHRoZSBmaXJzdCBmcmVlIGlkKSBhbmQgbGF0ZXIgd2hlbiB5b3UgYXJlIHJl
YWR5LCB2aXJ0aW8tdXNiIGNhbiBwaWNrIHRoZSBuZXh0IGZyZWUgSUQuDQpUaGlzIHdpbGwgaGVs
cCB0byBub3QgY3JlYXRlIGFueSBob2xlcyBmb3Igc29tZSBpbmRlZmluaXRlIHRpbWUgaW4gdGhl
IElEIGxpc3QuDQo=
