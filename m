Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8402BE036
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963399; cv=fail; b=m44rLV4NXxw8NLsa4eEHe7OvUDJhdY/JrufgflhCB58da4AFHLyDR2ufINwePij7/tJeu3fNEo0X30uZr6G9j52KOYiMFsCTewX/nknk4uUUFvTfHsNfNYs/Q6OSWZS+ghraxEmfQFm3fWtnC8CKjElaz6k2dwG5Eyy+K9303yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963399; c=relaxed/simple;
	bh=CludKFyWY9iVLm9pFA/cKU3krvnZixxA8P054ZIsbgQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utUmgjEa8wMBzEvgWZ4e6ibXyYTz3e9bdbN1AV5xKXUwc9KOG5ZiY6rn+fEIxHy/UJQfjgRcygESkSqWrzLCk1GSHZ6CtQnl/8YDcViGGdvP/H/cOXhgGgmDSycVMDo/l3ibuGHUQqogUJSyqnnhbUIpXRr0/D+ju8mtJ/L4Vms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NpX+fovE; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NpX+fovE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCSrYzuNcKmLkBNQfkr+gw+R20k7uBXN9+faeTPGpV10/hYAMLNsrhpALde/oqkINw0S8Oh/LIgw625TOybgjVpCh2QQksRBsV4/hazSu/frWm5otz4N9QABZzk+dqBySlR8c2DlsJU69btnmg5JwPjqsw/SrcGcbPnvSEMY6fNy7GPz16a2keMKwZb++AbYe51Tl3Up/1KFjqr3e1kriNIcddLh20dzTBoQqvjfR39nRzFWWkYdWEyVYlZfKllZpULGOSNzdTI2byY+VTLTTIK9ES1esC6A3amcg9DOUjzVPn5irfwQiUZTRuKRgb/6fjBcQjL12TtTuGJ+NFUhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CludKFyWY9iVLm9pFA/cKU3krvnZixxA8P054ZIsbgQ=;
 b=Z9YXwI9my6K9YfErkcYcR1q3nRe1t3k79whIACrHqHksWGVQoQ0SNcbquup08LILR+dFPCNRv/AKiuJa466TZbSQSBmXb8AxGkjLrvwVVBipXeBIuxYULNdP+lFaLaWfefj9JGc/6w9xfqHFVdtK/+zzwWv9imaPLvdGZfqSCrNpUfUZAvLuoeO0UhOfsc81XZAXweo5ptrjaXig6lIFwCEtYPPgbnvvb0wQNkVE7YpQjg3sFzJldCZH5FjzjzYNNO8qDzwwjSq5+d5/6CAtUdGE0qfhbZjxTVvZSEwbISsPbQSYHbEZPEIjIPatTMzB1JPfYTRdy6KG4TKUl0GcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CludKFyWY9iVLm9pFA/cKU3krvnZixxA8P054ZIsbgQ=;
 b=NpX+fovEoJjHuAyN/YEyd1PHVUpkRwEHIDrcC35tJXuoCWOByVPqZOJTZk+SRmp+dwtqPtL8Iin14eEA7XBjQVUKI4jgGK9zz5V9lgkQmz2oJaJ1NpFTq1rQLSHPGeZS5aLOvP7H1lG6PIZV5MgrBgqiW4e1gI40Pi/At7mXj0CKnr4qqvEtfCsa+2nVcFV60UqX9YxYQelZtEhV5H3i11Vp+VXCpM92yx3WSHQZxg44AYpw4PA/vTyRsE2Ygpa/EaI6xZDSW1jnpdxC0Dm+HNf5bKRJ6Ac50/kCiQ8VuHoFJJFTKCt18URAgpQWGfP+S6aegU62FRZp0dZOVqbp/w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY5PR12MB6479.namprd12.prod.outlook.com (2603:10b6:930:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 08:29:54 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Tue, 8 Jul 2025
 08:29:54 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "slp@redhat.com" <slp@redhat.com>, Shahaf
 Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Topic: [PATCH] virtio-gpu: Fix missing driver conformance file
Thread-Index:
 AQHb3VgKITqp2x6oL06l3KDqVOKljrQFmJuAgCJXCsCAABQSAIAAAP1QgAAFGgCAAAApwA==
Date: Tue, 8 Jul 2025 08:29:54 +0000
Message-ID:
 <CY8PR12MB7195307343E8DEC18BBBA906DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250614181302.277794-1-parav@nvidia.com>
 <aE/yNzLLs+lZh/we@fedora>
 <CY8PR12MB7195A50158F11DE199936838DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGzRggamdIHMnHnR@fedora>
 <CY8PR12MB7195AC481F68F1F828646192DC4EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <aGzWnpWZJhFMcA1S@fedora>
In-Reply-To: <aGzWnpWZJhFMcA1S@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY5PR12MB6479:EE_
x-ms-office365-filtering-correlation-id: 30ce7c6b-5be3-4fe9-42d6-08ddbdf99d97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WVJXbTM3eE1EdmUybXhERU8vTCtPRUJHYTJqM1M4MEFmcHAvOEpKZmJqeU1a?=
 =?utf-8?B?dGNzbm12cFVIclFtT0hHM1dMMU9kQ2R4ckp0dFJ1Z1FxUk01cWE1SFpUckNl?=
 =?utf-8?B?N2JSSzhnTGU4N25yTENranJacGk5dUswNGxwV0ZZbXIwUTdkcGRiVVovSTZD?=
 =?utf-8?B?QWcyclNSc3BUUnM4TSt4VmgxYVVSUnBxL3loRzVSQUlQTnFCUlBXL0o4VHJN?=
 =?utf-8?B?eDhDTHFuclVWc3FxbHl1S3BHVkdyYWo0U0NKSHYyRUVCTVdZK09jMjRnRGNT?=
 =?utf-8?B?MnZJTUZTUkplUWc4UDB4Y3Vud3dMU1BpcHo0SmxRVVhLc1oySUZib25zRyt6?=
 =?utf-8?B?a0l6V3hSMk9qS3ZrL1kxZDRuWmNUcWpYZVU0VVMxbGNjbkZkYUVSc1Q4WjhS?=
 =?utf-8?B?ZmRZMVlCekJEZ2IzMDN0R01aQUJaWDd5cWNTNW01VjRaTjBJVURsKzFPdEZR?=
 =?utf-8?B?U1ZEMHF0cGhRS2s2K1FSMnF4U2Ixb1Awamlwdjk0V2ZRbkFKT3ZObWp4a1Np?=
 =?utf-8?B?eVIzUjlXOHJPTk9RcWhpR0I1K2pybEVHdXdzU0swTDR0dHpiZUlWUjl5OGZK?=
 =?utf-8?B?YXozK29LRUpKU2lwb0ZBVlBKdjc4aWdPUUZaTDRqbWZrd0NEZU1OSkk5clgr?=
 =?utf-8?B?VGxrZjBMOVYwQy91NmF2N05RZ1UwQTAyVzlDZzZYT09PbUgxdUwrV0NodEJr?=
 =?utf-8?B?OHJjMys4T1J5eVFqNGFuRW9MYU1tR2FCUkg1aVI3QUZVV0lVbFh6REJjYUQx?=
 =?utf-8?B?WGlCY2JDZ3pFazY5REYxS3VqRGlnbVB1VWtveFBqSW5tNzRzZ3AvQjRUTE1m?=
 =?utf-8?B?eU56emxkeG40K2N1ZWtWeFBkMGFBZEVzNzBSRlNVcjMzOHdGV2RYMTRWdFNI?=
 =?utf-8?B?TjFlY3VpMll2ZC9yT09NbWRZeTgxamk5VnhJV050MGxiNkc2TW5ZOG5EM1FF?=
 =?utf-8?B?ZVJ1NnZzU2FFaHM2WFFSSElTM2lzZkJQcVUwRDd6WEZsVy9oZzJ4ZFEraVdM?=
 =?utf-8?B?Vld2Vnp2enFmN3dCenAxRTJFQ2NsVVVtV3c2SVlpOW9xUzB2Z2xldExhZ2R2?=
 =?utf-8?B?RnlGY3FoZWxLS1g4MU1iajZhTFlwZU9vZ3VPOVM5SUtiM29sUW1aVElMSXlr?=
 =?utf-8?B?U0o4Z0dFTGE5dmtPKzhNMGVqUFN6NmlvZkZKSmFtTE1nSGlGK3U2REZZMUdr?=
 =?utf-8?B?b1JzUXRsUlB6NHVJaVBuT3pvWFo4ZW5rTFBFdjJ3eUpjOGM5MzRXN0NVQ2tl?=
 =?utf-8?B?RVlNaC96NEJxanFjNGhTb1VQaEhCRFdBak55OXdSbUZqKy9PS3pTbUpVdFNC?=
 =?utf-8?B?blBESEtLbVMrcUVpNWNsajhmY0RvRUZORTgxeVpXT0Y0MlM2amFRNFdjbThz?=
 =?utf-8?B?N2VFUDMwcVI1WUFkRGdpaXlnc3pNVXF5ZFpvbVlhVTI5UjhOQVIzdWpSYXVz?=
 =?utf-8?B?SDNLdHIzZlpJNTY0YkxWSElmNWVzcjIvVUt5NkY4Zjg3U0todGVTN2VDWmw0?=
 =?utf-8?B?QjFjMmRPcEcra01QY1JSTzUwMEVRVVFJL1UxRzZ3czNBbHY5RlpheEhrL0pU?=
 =?utf-8?B?dERTL25QVHJPUXVheThjSjJHK3pTVDhTMkpSVmFiUW5mU1BxNXcxdTYrRG1j?=
 =?utf-8?B?L0UzeHZpNENrSldNbGEwcG1ZU3RZcHAvQUMvWnRTQi9OYXl5VDNkcHBpUEVT?=
 =?utf-8?B?eGl2ZVNCNzF4U0xvcnBRN0FGT3BEYmZRd25mVldZbFZ1bS9hWm9IWnFjR1RN?=
 =?utf-8?B?ME9oSmpKUTRRdlI2MUhyb2dyYUluUnRza2prUXNFMXRmbGVSRFBpZXpoMm1l?=
 =?utf-8?B?SlRxZVZ4bVNtODQra3o0ckJZYmk5VmhlTnVQSEJnNi9SbDA4R3ZySk5XdjZz?=
 =?utf-8?B?V2VHMTg1ZzVrNzJ1QkhKdDF0SUFnY3dEeXlRR1JpdUcvRnFxeUdyZmorajVW?=
 =?utf-8?B?VkZNZEZUM3ROZSs0R21TYjF3ZHdzNSs0em1yZVFaNUV1SVRKWjBQNml0azhp?=
 =?utf-8?Q?UrS+GUsRnZ9eGdSH/dtLFJ/sq5E9/s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUhzdFVmc3duNUtwK1RMR0s0dmFVOVBySVVjSHl2SWVLTGxqeTNtMDhIU3hr?=
 =?utf-8?B?N05QL3c1dldWbFc5b0xnQzh1TFZTVSs4bzhQeHZKWm5IVHhIbmhLQjBFdWdx?=
 =?utf-8?B?N1hSR3JwQmlCdUY5UzRlcUIydXpCUU1TSklEOFoxSnRLeWFYSENaL2VLUGwx?=
 =?utf-8?B?QjJrSjlTNEhzT1hGZmtRN0F6bkVMQWdaY0NlaVkwM2l2QnVxbVN4aHFDQ1do?=
 =?utf-8?B?Z1ZnaEd1YU85cEMyd3hkYk5vdmkzTEt2Ly9PaU1IcEtJd1dFb3RuR2VZUVdr?=
 =?utf-8?B?RkxEU0lMVUFsWHE0ODdjb0M3RmhHaTdFYlRFT0dSM3REV2R0WjRLMXd4eGFo?=
 =?utf-8?B?TUxYMnlwN1ZQR2ZXMFNNSkZuM0lucEhQK2NQQmJmNHlmejFMVGg0MkZZamQ1?=
 =?utf-8?B?THZDblhZMU80aEpoL1crVUdUTTl1ZEVZYzJCRXM1c0xqNkxLYUhOYkJuQk52?=
 =?utf-8?B?Tk5ubExDNTRuS0ovQjdLNmIzL2pPMVFpY0xIQWtCaUloV1h5ZEo3TzBzOWtz?=
 =?utf-8?B?YlVoQ1ozQTR3ckI2Q2hyUVVWZTV1L0xwOGJQci9MNVhyZnFVUWVqRGIvQm85?=
 =?utf-8?B?ejFaNS9heVFBa1Q1SmZneWZuKzk2TEw4aVFQKzY0VDR5cUdieXBobXJoWVJJ?=
 =?utf-8?B?eHlheWZGS3d2a2p2Q3h3WElLRVYzSXA1bkhoTXVLSDlCekNuRFhSVlNkSTVt?=
 =?utf-8?B?VCtaTlh0L2R2Nm5FYU1XRytHZ3EzQnVHeEp0bTRsalpvYVE1amd5MEc5dVB4?=
 =?utf-8?B?TzExRkREWGxPRE1IWlp1V0FsbGVxdnIvMCtGRG80bDJVL3BreHc0NUxOWklo?=
 =?utf-8?B?Zkc4djZHQXdySk84aldRM3Y0Yy9GUjFYOFJmcVRVcUhBZ1hzUzRQK08zcjZm?=
 =?utf-8?B?YUY5b0xUWXY0R1RwS3FLZ0hsMWZDNjdLTkdzcHFXU3FjQk9wdmlxMUhPbG9E?=
 =?utf-8?B?d2pQN3QyTXFDYXlQL1N5YThOVEszUTFPVjdvZVRRTUROTHN4SW4yZWdOUU9N?=
 =?utf-8?B?KzhCVUcraFZhS0JzRGN1eDZzUkdWWXpVdmlFelpibXB2eUd4dlJsUjN2UkhM?=
 =?utf-8?B?NHlqdnFIcDI2TmlQbzBqZFg1MHJ3WFQvZmxYZVcrak9pVGdadkpwZUJ0QkFI?=
 =?utf-8?B?TEtQc2xuNjUyZExjUzZ4M1RKRFJwZmpGV3R6dlljYXFlQTVtNHVwRGpRb1Qy?=
 =?utf-8?B?QU1vVmlkSEEvSXNncGVjZHc0WXFTQVdaZ1c0a21vSm9mT2ZGZTBIckJCTElq?=
 =?utf-8?B?WnZsTnVWN1hhQlpKdmZaRVl0bXZpQUxKV2NBdWlMMXYvQitGYnlFeGtSVjJB?=
 =?utf-8?B?N3p0dVp2Q0wzYmc3ZkgzY1djZWZQb3V4MVgzQ1Nkb2tHQitXMDlnM2UzQllm?=
 =?utf-8?B?Nlg1aFZIaXVOT0pMTTUrM214NktneFVRQ2lKWFJ1ZXhrZXNacHkyeldJNVRD?=
 =?utf-8?B?OWhZMzErNTVNK21mT3ZENFYvRmMxSUpmTVp1aWF2T0xJTU8zVXpVMHFMWVhs?=
 =?utf-8?B?R3p1bEw4RTlqN0ZjTFM0OWNQTFY0MHVqV2c0OVk2M21VTWZGaUNPcXludlJW?=
 =?utf-8?B?dkp0MmFWSjRkNEZRWnAvOVhucG1QY3MwNGsxUzA2ZUpWNGdPbEc5Y2J0dlN1?=
 =?utf-8?B?YjBkaGREWHVjWmRtTm1ZYStrMUZsaVVEKzZuOEwwTDcwU1g1K3FScThvY1JO?=
 =?utf-8?B?dUtrZG5OWGZ2Y2hvcTV6N21nV3BQYk03MVViNHhmU05lTnlEK1JMeDRZMkJj?=
 =?utf-8?B?NGVpK2I5T0F5eDJVRTRodWNleHMvd2R0RnkwdUIwZGU2TlQrcE1xYzE5VnB1?=
 =?utf-8?B?WGhQYjZCWFdLZlpNZ25HRGI5UGxlRzlDMlF2ZDlkaFpMbXRmMXBIcXdTWTZZ?=
 =?utf-8?B?TXczMkdrcWI0ejJkMWhmL3RQamxrWTRRNWVKQk0yZ2gwKytzZzdTdU8wYllV?=
 =?utf-8?B?T0M5cjZ0Yk4rTU5QMDEwZVlLKy9PVmJXUFRuQXU2NzBhWFZ1Sk1aNlE0UFZE?=
 =?utf-8?B?OVNmdlRTTGVOMm9LK1VpTGtxY0I0Ym5FSUJhVFVSa0dkcS9DTDliRHAvMG00?=
 =?utf-8?B?eng2WkJNS2xVbmtvUXdnTVlFTWV4K013eXpVWjBUakdWVmJyTjVaOU9keDd0?=
 =?utf-8?Q?WBnY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ce7c6b-5be3-4fe9-42d6-08ddbdf99d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 08:29:54.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwWSZzm1Dv097ihyFZ2fimi3JtCfcn0NfRf1Hp1j5yoIQEF86COn1temcwdyjRzuGWG5NvQpuVDaIsN1RaC/vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6479

DQoNCj4gRnJvbTogTWF0aWFzIEV6ZXF1aWVsIFZhcmEgTGFyc2VuIDxtdmFyYWxhckByZWRoYXQu
Y29tPg0KPiBTZW50OiAwOCBKdWx5IDIwMjUgMDE6NTggUE0NCj4gT24gVHVlLCBKdWwgMDgsIDIw
MjUgYXQgMDg6MTE6NDNBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4NCj4g
PiA+IEZyb206IE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNlbiA8bXZhcmFsYXJAcmVkaGF0LmNv
bT4NCj4gPiA+IFNlbnQ6IDA4IEp1bHkgMjAyNSAwMTozNiBQTQ0KPiA+ID4NCj4gPiA+IE9uIFR1
ZSwgSnVsIDA4LCAyMDI1IGF0IDA2OjU2OjI2QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToN
Cj4gPiA+ID4gSGkgLA0KPiA+ID4gPg0KPiA+ID4gPiA+IEZyb206IE1hdGlhcyBFemVxdWllbCBW
YXJhIExhcnNlbiA8bXZhcmFsYXJAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiBTZW50OiAxNiBKdW5l
IDIwMjUgMDQ6MDAgUE0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFNhdCwgSnVuIDE0LCAyMDI1
IGF0IDA5OjEzOjAyUE0gKzAzMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4gPiA+IENp
dGVkIHBhdGNoIGluIHRoZSBmaXhlcyB0YWcgbWlzc2VkIHRvIGluY2x1ZGUgdGhlDQo+ID4gPiA+
ID4gPiBkcml2ZXItY29uZm9ybWFuY2UgZmlsZS4gQWRkIGl0Lg0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IEZpeGVzOiBmNTJmYjIwY2JlMzggKCJ2aXJ0aW8tZ3B1OiBzdXBwb3J0IGJsb2IgYWxp
Z25tZW50DQo+ID4gPiA+ID4gPiBpbmZvcm1hdGlvbiIpDQo+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4g
PiA+ID4gPiA+ICBkZXZpY2UtdHlwZXMvZ3B1L2RyaXZlci1jb25mb3JtYW5jZS50ZXggfCA4ICsr
KysrKysrDQo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiBkZXZpY2UtdHlwZXMvZ3B1L2RyaXZlci1jb25m
b3JtYW5jZS50ZXgNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBSZXZpZXdlZC1i
eTogTWF0aWFzIEV6ZXF1aWVsIFZhcmEgTGFyc2VuIDxtdmFyYWxhckByZWRoYXQuY29tPg0KPiA+
ID4gPg0KPiA+ID4gPiBDYW4geW91IHBsZWFzZSByYWlzZSB0aGUgdm90aW5nIGJhbGxvdCBmb3Ig
dGhpcyBwYXRjaCB3aGljaCBmaXhlcw0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL29hc2lzLXRj
cy92aXJ0aW8tc3BlYy9pc3N1ZXMvMjIzPw0KPiA+ID4gPiBJIGRpZG4ndCBjcmVhdGUgYSBuZXcg
Z2l0aHViIGlzc3VlIGFzIDIyMyBpcyBvcGVuIGFuZCBpdHMgaGFsZg0KPiA+ID4gPiB3cml0dGVu
IHBhdGNoZXMNCj4gPiA+IGFyZSBub3QgbWVyZ2VkLg0KPiA+ID4gPiBJdCBpcyBmaXhlZCB3aXRo
IHRoaXMgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gV2h5IGlzIGl0IHN0aWxsIG9wZW4g
aWYgdGhlIGJhbGxvdCBoYXMgYmVlbiB2b3RlZD8NCj4gPiA+DQo+ID4gPiBUaGFua3MsIE1hdGlh
cw0KPiA+DQo+ID4gSSBkaW50IG1lcmdlIGJlY2F1c2UgYmFzaWMgbWFrZXBkZiBldGMgc2NyaXB0
cyBmYWlsIHdpdGhvdXQgdGhpcyBwcm9wb3NlZCBmaXguDQo+ID4gQW5kIHRoaXMgcHJvcG9zZWQg
Zml4IGlzIG5vbiBlZGl0b3JpYWwgaW4gbXkgdmlldy4NCj4gPiBTbyB0aGlzIHByb3Bvc2VkIHBh
dGNoIG5lZWRzIHZvdGUuIE9uY2Ugdm90aW5nIHBhc3NlcywgSSB3aWxsIG1lcmdlIHRoZQ0KPiBv
cmlnaW5hbCBwYXRjaCArIHRoaXMgZml4IGZvciB0aGUgc2FtZSBpc3N1ZSAyMjMuDQo+ID4NCj4g
DQo+IEkgc2VlLCBzaW5jZSBpdCBsb29rcyBsaWtlIGEgbm9uIGVkaXRvcmlhbCBjaGFuZ2UsIHNo
b3VsZCB3ZSBvcGVuIGEgYmFsbG90IGZvciB0aGF0Pw0KPiBDYW4ndCB3ZSBqdXN0IG1lcmdlIGl0
Pw0KPiANClByZXZpb3VzbHkgZ2VuZXJhbCBndWlkYW5jZSB3YXMsIGlmIGluIGRvdWJ0IGFzayBm
b3Igdm90ZS4g8J+Yig0KU28sIEkgd2lsbCBsZXQgTWljaGFlbCBhbmQgQ29ybmVsaWEgdG8gZ3Vp
ZGUgZm9yIHRoaXMgb25lLg0K
