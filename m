Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67243209
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783556; cv=fail; b=rybciAfjR4OU5XYaKO4uVJi+M+NqPUBc2rRi2EBXJZaqoyj+3D+3sUVjmBQUNzxQ+uVpIrDB+XJU3KqmndNRQaw+Xf4DVKuJQ8WNq7YEGMrfI6JB4ktOOm2VUMWP/WVkZBIwl0f5Aka0dv5LNlOVAsnnkFzNSsiCB+gAoSlYGsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783556; c=relaxed/simple;
	bh=7VHNno24GsI6W+xyUw7NI/BYDHCjCYFCIsljeKh1sQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YwZYKezvYFX6ue6YHGkiN8pq3awNR7kRt+/tBO3JpuDcdThr8URTyiL15b0z+CsiXPmhqhD1r9q08ylZ8vU0bzjYf//mm+rVQyaEcnprKFGwzeJZRaD4tbjfblyU/0sz8OXojkap7yq3jaN5X9Y0VU/5ivJ9tBx+TB+QlKsd2a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TjDrUuwp; arc=fail smtp.client-ip=40.107.244.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TjDrUuwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1UNQH2zPEZCvFkOLD3KcTZAe86BcKEtpL1P7K+4af2wA8EKITXev5zVBgpqMAYQ9SeanpNtORNEoVgpEKj6GV/Oh88rT4/ZT+/M7/th6ZBnP0R1NHGaYGzhVOHyAD41sIvhWItcp/JHF5RM6mrpqfTYL6/Rsq6v1yjF/kXrx2BumQV7g65AVIcRxgs48aWAerHe58GyHr+8ZH3dqOdC15beFeN6lMq4wiwpn28NrN1oAGwctZhbZCOgpuhMJfV1AnDFcR4qur0698L4SKU/ajDpKrFcin6ABw1i+iX/JQ9F8A3d5H+K+wQN40MkXP1ufYsKRy8qfgFOohgu0be/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VHNno24GsI6W+xyUw7NI/BYDHCjCYFCIsljeKh1sQY=;
 b=GCZVK+RIc7dSZOZlfSswO1OL5JNtNL2kTk9Mg7Cxne2le99njpp7q9zmuUjUTk7DApMrSpEuA11691dmrr0k+PqkK2MdZrpUsQc7WMeCd3Z0ODZO5rektw9/4/2sHwQlVFb3hhNk9qNyFBh0HTjderzXIBDzPq2NqVFxvz2FNet4an3gAy6lspemov45GUfxlMZ4yclIeJ/PlchZPwBaK6OgX/CiHtek3+Z632a7Pfr5+Nme2061O6+Bf2noTdPJrWKbneM+JfQLNVKTzYMbJM6LFcjCwr6aASyzRymPSC4g1xTl9a+3qJQtyjqamLTr++v+dVUY2GQH8yyEUoVa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VHNno24GsI6W+xyUw7NI/BYDHCjCYFCIsljeKh1sQY=;
 b=TjDrUuwpmxJki2fVZq1higyl15l0I5E212owQHerTFkCveZVytR1VNQHEAZLz97yAuUgf9A0/IywiTvcDdPlSMsBnO1/Ht1Blbtqdbu1OTAnbXQOgrS4QjHj0R1b464Ue8foDI65nNb+F9G6aokF68dQAsa4SPlakSI/qHxjZQmo7mf0KeMLzLKButlYiuo4aB/pQt1db0pgcBlwh6TdoVH5pfRO+0DWF7MEDCa8IqboEm/g7wcBHhG8TRd2qn+YGm6jWIJfbd61kwRivLl2+8hDH0JL/Rlsuv1JCgW4x/vFr+A6IKr2cU6M5+q4BY5smyar4tNFR3aTvMvbfgIh8A==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 11:52:31 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 11:52:31 +0000
From: Parav Pandit <parav@nvidia.com>
To: Alexander Gordeev <quic_agordeev@quicinc.com>, Albert Esteve
	<aesteve@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Aiswarya Cyriac <quic_acyriac@quicinc.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbACulN7OJ8hVWBUuunhxN0rzrwbJoLecAgAmAf7CAAAvJUIAAKTQAgAAMvEA=
Date: Tue, 1 Oct 2024 11:52:31 +0000
Message-ID:
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
In-Reply-To: <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|MN2PR12MB4205:EE_
x-ms-office365-filtering-correlation-id: b9d4da57-d48c-4101-ecaa-08dce20f8828
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ODJQamFCRVNsd3J3QWU1eWZLRW5CRlNtQjB5bFRsZHZPbkV2a2x1Zit4RStK?=
 =?utf-8?B?VkN6OThOOGUwb01YSlYwWENubkNobWorOHZaZndBNnBRSUFjemwxaU9kZjZ1?=
 =?utf-8?B?elFydUVYczZobFZ3emJMVUhBNzAyTDBETkhIYk83bHJqMWllMFFPdmFnbldC?=
 =?utf-8?B?SWt4RE1SV0RuQldackFNTG5mK1VZZ2ZFY2JZeVR4VG5wN1VDYWM3ZWFBSmgw?=
 =?utf-8?B?Y2ZKVzBhZFFPeXFKYnl0TXU5RGFvZG5EQUtZZmx6RVRxQ0xZNjJ2alJoRkxw?=
 =?utf-8?B?V0QwdDdXSzMrWkRkOVVQUjFqR2ZKM2JYQVNqeFdSQU8rbVRRUklOTE51Wlor?=
 =?utf-8?B?VFdwRElTRGUvUmZ4dEVZRC9VMjVKYTBLSm1Ic1pYZlYvOGdVNHEvQnBDeWJr?=
 =?utf-8?B?c0tmQlVNTUxSTlNCTi9yZWZwaloyYWdMbG1WbmMyVWErUldiQXBzK3FZN2FD?=
 =?utf-8?B?a2ZHZWdQVjBaVVdrbTFqSzc0Y2t0OUl6d0c1ZjlaQUs4YjNKL3pCRUFhaUMx?=
 =?utf-8?B?TDdhV2ZCVE0vMmgreUNDenJpdnZmRVMxQnlmeEJGbmMxbVJzU2V4RnNNaGtE?=
 =?utf-8?B?WEk1VnZkdlVMOHZhdTJ4TXZpTUllUmgrMzVtRXlwOFZGRE4ydkphY0NLd2ov?=
 =?utf-8?B?bFlxSHZQTnlqcENmRVNCM1lZTDR4cWQxT2QzQzgxdjVXVVh4UTROU24xbFlo?=
 =?utf-8?B?Tm1DL1JEYkYveUVPM3c0M3A0My9zYzBkTHpqSzgzKzlYT2JVMW1aS3ZScmZx?=
 =?utf-8?B?TmlwVUplSUhnSGhDTlRZbEdRWHF3QlRabVkrbU0xaFU2TFQ2TkhHenlRSFo4?=
 =?utf-8?B?N2Y0NXRhR0V2NWFEWjJyUW5jSkU3T2NyNE5ET3dma2NiN1hUMERjcjFYWUxW?=
 =?utf-8?B?OTBYamZHTFhDWDZOejA0QTNWVEJqclE4LzNzM3hOQnhvSENkaC9ER3FLRkZQ?=
 =?utf-8?B?UUNRV1VUaEFpem1RRlRldmtobmRjbXh4N3NIZFNKc21pVTNMRVRyS2dvSGRk?=
 =?utf-8?B?Q2tKUXNEQ2tMbFIxdTRwSmNNUVBDVzBzSFlQeTJIaXJQMDd4V2l6SGs5Rldk?=
 =?utf-8?B?YXg4UExSZnN3UlRHZlhlakMvb1A3emZFcUlDOWlyRERaZDZwbDluYzBkVDRL?=
 =?utf-8?B?N21DU1JNaTloVXViaVB6Y3kyOVhscW1MaGFZb1FWZCtDQlIva1E1eUxYMEFh?=
 =?utf-8?B?SnplOXVka1huVkh3WUMvLzk1ZWNaK1BaczYxTVEzaEdKVjlOd01DVmJVVmhj?=
 =?utf-8?B?SjZtT3dLU3pOM2VLc2s4Mk5GMkxaR0MvZHgwZHZWZ0IzMjJrc05nNU5PS1BR?=
 =?utf-8?B?czJkbDRoNG5SUHlUdmkrb3puZG1aNkgzbUowS1pqMDJJZHZXOVVydHRoRG4w?=
 =?utf-8?B?SFZBbkRnOC9KbzRuV3JEeE43YitEVzBTeVRPWW9iVWxablVXL21PMElLbTRU?=
 =?utf-8?B?aTlXUGcxdlRkbDZab05PSjhkWmEvOHdGNDl3Z0syK0o2cTJEMHU4MDc0a3Rq?=
 =?utf-8?B?NnJZTEVIZTV3SEw4VnNndllGSlNDZlVYV0VLQk5GcU5Bd2JjT3JJdVhWL3pu?=
 =?utf-8?B?ZllFNHB5TU5ONHlnZVp2WG1jeUdTL3RGOW5jTmVYcDhYVUZFYVpZY0NNczNE?=
 =?utf-8?B?dHN2RFZ0U1BQZERuc0cxWmU5dXV2Sld2WVh1K0VhL3RjU3lITFJjbllkM2R1?=
 =?utf-8?B?cm95YWMzMmZSU2ZDd0NpRFRHTTRTQ1FGZlRNT3ZBN2I1YytEbVJqYmRKOFhL?=
 =?utf-8?B?R1BrcFdsSG1jb1QzRmpJQzF6TTJBU2RKd1VJaGZBOUhubGpsY2tNalF0L2hF?=
 =?utf-8?B?elJZZDR0MXROZDgzSVpRQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVZZbXRtVzgyQ1lHdWhLMmxXT1A3YXhVNXBtZ0NoKzBubVJRTFlDSFNlTFRG?=
 =?utf-8?B?VW9hYXAyQUt4empQcGNDRzJqbXdaS1ozTkNNenBYMS9hdDJBY215cnZ4YThv?=
 =?utf-8?B?LzNHdDE2U1NzZmtLenFVRGRpakRKcFk2ZENHa3plckUwcEs1UGFXc0RVVmV2?=
 =?utf-8?B?TnVIZmQwR1IwSnFlM0wyZnVBNzVqZ2psSzh6R3lUdFp2Z3Z4Nk1FNnJ2U1pq?=
 =?utf-8?B?RFY0aitMMUVKR1BWMDdremtkcHdiZnI2S0pjWG5FR0tXQ2IvWXQ1aG1JaC83?=
 =?utf-8?B?TFJnY2dCVEtPeGpoT2RnVFJ5VFJXMktPT3IvRUJabzNpUXdzQ1VhSWo0RWFv?=
 =?utf-8?B?U1UyeURJVFhHQlBzWjBuVjU1aTdWcldXNlQzcXlmNTlVZTc5Z3hjOFBlREF2?=
 =?utf-8?B?R1lZcUMraEJ4djNmZmNmTU9penJ3V0pRNFFCRGxNSnFid3Q5YWwrcGFEcFRF?=
 =?utf-8?B?RWo5bHlEbTQ2Z1I2NkNjMjZXdDZVbEFjWWJSeVVaTG0vNnFzNWZka2lDSlhY?=
 =?utf-8?B?QlBDYkprZTlYS2ZrV0pZZHJ2aDlGeWpWOVQrbGQ4VG9FMitZSjlkU0p3T3hO?=
 =?utf-8?B?cjYxOWdDWlRDZW9zZndYYjh3Z0NlekFaQTUrRFp1WEZibXorcjlPYSt1YXRy?=
 =?utf-8?B?Z3VhVU50QjZrd3orUlpCVExTSWdtVmhndzg0VmJsWEZKUjRjbndTRlpybTB6?=
 =?utf-8?B?SGdoeFRHbTg5R2lGU2RaRnNJczZLNDVHenN0cUc4RUFKU1pBTnl5bGJnQW1O?=
 =?utf-8?B?RXR5bjV2WHhua0c5SWszTU9lOG8wbk40dzRXc2tnZWNxbWxEbXNmdkRGT2xq?=
 =?utf-8?B?anhzaFQwUklXWmpuYkRpbWt2bllrdmpkVHE1ZnNLS3pmTmVyamgxeDk0Z3Rr?=
 =?utf-8?B?ekF3MFdBelBEVmtHOFVkRlNDR2NwcVBCUmxTUkFqQ1d3enEvU1NDQVdmeVhx?=
 =?utf-8?B?NjlweXRBbmp4aytKMEg4V0NzSmZ4cVRTUUgwV0lSNXpkZUx0Y204YzUyQ0RC?=
 =?utf-8?B?NnhuNmNpU2hSWVUzYU5Ca1lzOEs2SmVudUtndkErY28wenJzSmdzMFc1OXhw?=
 =?utf-8?B?V3N3TjJrRGF0dVJFcXVQREpYL2VFYzBWK2d5Mm0xNEdMZHJzOFVheCttYmow?=
 =?utf-8?B?c2hmUFkxUVdaeU14WTYzNVFVY1JDeWNyMXh0ek54NWlKbkp1Y3FsQXFKY0lN?=
 =?utf-8?B?am90dVNoWmZIMXBMcnNrUVRrT2NDdUgzZ3BUZFlsbHV3QW9Xa0l3OWRFSFBa?=
 =?utf-8?B?Y0RNcDNZVVFZNncrS1FVRko1aUVucUVOeE56RmlyRlNwRHpJUmFTMEJIaFkz?=
 =?utf-8?B?VFBnbVpGeVlWN0dkQnhSTjd4U2hveDdmc0QrZjYxT3M0S0FCN0YwMmhvVXIz?=
 =?utf-8?B?blVjTTlVSVd0YlNJemUzR2JSM0MrR0gxYjR1amFmRy80OW05NDE0dWs4UFp2?=
 =?utf-8?B?MjB5UVVrSElNdlZsbFIyK0VIM21vY1BUWjA0UjE3N2VrZ3VjaTI0RHhMVC9C?=
 =?utf-8?B?elR4ZDFQSkMxZ3IxYlZmcDF1aUYxVlY0MzhQbC8vUjRBcWtwVk81WXBLQ2Vo?=
 =?utf-8?B?R0VpeHc0aG9oMzZvbnNUTURpeGNNS1JMWDB5MEZkNWxMTzc4ZHNpUXNwK2ZI?=
 =?utf-8?B?L0t6NjZIM1hGN1MzTTQvYSs0MnlOWWxPVXVYWmN4Si9uRHpodzFYUTk1dGNw?=
 =?utf-8?B?eWtsOFNNdXRzSUZOcENYNkFTaUx3VnFtQ0FDUGZONVhLUy9XbDJtN2M1blN6?=
 =?utf-8?B?RVpTVXI5VUFOOGRHNUlZV3paUDhiWllsS01yZ1ZJVGZacHlMdU5WVDU2SnM2?=
 =?utf-8?B?ZVh0RFhGN1ROTm9kTVMxSjY2dnBwSVVKQk0rWFZTOEt3QkhISFowN2pHWitj?=
 =?utf-8?B?U1hMWS9BQ3hVZm9UMC9qS09OZWZlOHJVWmtHRU1rNmhsVFBYSXdUenJJTW5C?=
 =?utf-8?B?aDVxcXkxb2xwQmhVaDZzUFRYNURFaUxDU1RvZUQySFl3TFpBTFZjNzQzUjBE?=
 =?utf-8?B?ZUloZHpWeURYSmZCdGo5VDRjUFcyTHhpZ2pDenZWQVR0bUFPaXcxNlhjeWd6?=
 =?utf-8?B?eVVSdTBxK2w5aURrc3BlY2N4K3pFVjlYT0dkWExzMmFKM3FSZlpaY2pKMDlY?=
 =?utf-8?Q?nUFo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d4da57-d48c-4101-ecaa-08dce20f8828
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 11:52:31.6119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSkOkDM05sZk6NOxWZ1nYHMGT6CSxrjEHXnSWVKR2AVUGpwaD7Jc7ImoQNq80beOoTFvmXnuDelmAj2qVd59qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205

DQo+IEZyb206IEFsZXhhbmRlciBHb3JkZWV2IDxxdWljX2Fnb3JkZWV2QHF1aWNpbmMuY29tPg0K
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMjQgNDozNiBQTQ0KPiANCj4gT24gMDEvMTAv
MjAyNCAxMDozOSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gRnJvbTogUGFy
YXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVy
IDEsIDIwMjQgMTozNSBQTQ0KPiA+PiBUbzogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRoYXQu
Y29tPjsNCj4gPj4gdmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2OyBhaXN3YXJ5YS5jeXJp
YWNAb3BlbnN5bmVyZ3kuY29tDQo+ID4+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4gPj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2
aWNlDQo+ID4+DQo+ID4+IEhpIEFsYmVydCwNCj4gPj4NCj4gPj4gRnJvbTogQWxiZXJ0IEVzdGV2
ZSA8YWVzdGV2ZUByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAy
NSwgMjAyNCAxMjoyMCBQTQ0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiBGcmksIFNlcCA2LCAyMDI0IGF0
IDk6MDjigK9BTSBBbGJlcnQgRXN0ZXZlDQo+ID4+IDxtYWlsdG86YWVzdGV2ZUByZWRoYXQuY29t
Pg0KPiA+PiB3cm90ZToNCj4gPj4gUmVzZXJ2ZSBkZXZpY2UgSUQgNDkgZm9yIG1lZGlhIGRldmlj
ZS4NCj4gPj4gQ29tcGF0aWJsZSB3aXRoIHZpZGVvIGVuY29kZXIsIHZpZGVvIGRlY29kZXIsIGFu
ZCBjYXB0dXJlIGRldmljZXMuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFsYmVydCBFc3Rl
dmUgPG1haWx0bzphZXN0ZXZlQHJlZGhhdC5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoGNvbnRlbnQu
dGV4IHwgMiArKw0KPiA+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL2NvbnRlbnQudGV4IGIvY29udGVudC50ZXggaW5kZXggMGE2MmRj
ZS4uNmQ2YjNkOCAxMDA2NDQNCj4gPj4gLS0tIGEvY29udGVudC50ZXgNCj4gPj4gKysrIGIvY29u
dGVudC50ZXgNCj4gPj4gQEAgLTczOSw2ICs3MzksOCBAQCBcY2hhcHRlcntEZXZpY2UgVHlwZXN9
XGxhYmVse3NlYzpEZXZpY2UgVHlwZXN9DQo+ID4+IMKgXGhsaW5lDQo+ID4+IMKgNDXCoCDCoCDC
oCDCoCDCoCbCoCDCoFNQSSBtYXN0ZXIgXFwNCj4gPj4gwqBcaGxpbmUNCj4gPj4gKzQ5wqAgwqAg
wqAgwqAgwqAmwqAgwqBNZWRpYSBkZXZpY2UgXFwNCj4gPj4gK1xobGluZQ0KPiA+PiDCoFxlbmR7
dGFidWxhcn0NCj4gPj4NCj4gPj4gVGhlIGlkIDQ4IHJlcXVlc3Qgd2FzIG1hZGUgc2V2ZXJhbCBt
b250aHMgYWdvIGluIE1heS0yNCBmb3IgdXNiLCBubw0KPiA+PiBmdXJ0aGVyIGludGVyZXN0IGhh
cyBiZWVuIHNob3duIG9uIGl0Lg0KPiA+PiBCZXR0ZXIgdG8gYXZvaWQgaG9sZXMgaW4gdGhlIGRl
dmljZSBpZCBhc3NpZ25tZW50Lg0KPiA+PiBTbyBpZCA0OCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNl
IGZvciBtZWRpYSB0aGF0IGhhcyBpbnRlcmVzdC4NCj4gPj4gQWRkZWQgdmlydGlvLXVzYiBwcm9w
b3NlciB0byB0aHJlYWQgdG8gc2VlIGlmIGl0IGlzIHN0aWxsDQo+ID4+IGludGVyZXN0aW5nLCBp
biB0aGF0IGNhc2UNCj4gPj4gNDkgc2VlbXMgZ29vZCBoZXJlLg0KPiA+Pg0KPiA+PiBHaXZlbiB0
aGUgdm90aW5nIGhhcyBzdGFydGVkLCBJIGFtIG5vdCBzdXJlIGlmIHRoZSByZWFsIGlkIHZhbHVl
DQo+ID4+IG1hdHRlcnMgYXMgbG9uZyBhcyBvbmUgb2YgdGhlIHVuaXF1ZSBpZCBpcyByZXNlcnZl
ZC4NCj4gPj4NCj4gPj4gQW5kIGRvIG5vdCBwcmVmZXIgdG8gcmVzdGFydCB0aGUgdm90aW5nIGZv
ciBzdWNoIGEgc21hbGwgY2hhbmdlDQo+ID4+IGVpdGhlciBvbiBteSBsYXRlIG9ic2VydmF0aW9u
IG9mIHRoaXMgaG9sZS4NCj4gPj4NCj4gPj4gSSB0aGluayB3aGVuIHRoZSBtYWludGFpbmVyIG1l
cmdlcyB0aGUgcHJvcG9zZWQgcGF0Y2ggdG8gYXNzaWduIGlkDQo+ID4+IDQ4LCBzaG91bGQgYmUg
ZmluZS4NCj4gPj4NCj4gPj4gTWljaGFlbCwNCj4gPj4gQXJlIHlvdSBvayB0aGlzIHdheT8gT3Ig
eW91IGhhdmUgYmV0dGVyIHN1Z2dlc3Rpb24/DQo+ID4+DQo+ID4+IEFpc2h3YXJ5YSwNCj4gPj4g
SXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVzdGluZz8gSWYgc28sIGNhbiB5b3UgcGxlYXNlIHJl
cXVlc3QgZm9yDQo+ID4+IHRoZSB2b3RlPyBTbyB0aGF0IHdlIGF2b2lkIHRoZSBob2xlIGluIGRl
dmljZSBpZCBhc3NpZ25tZW50Lg0KPiA+IEkgcmVjZWl2ZWQgYXV0byByZXBseSBmcm9tIEFpc2h3
YXJ5YSdzIGVtcGxveWVyIHRoYXQgdGhleSBhcmUgbm90IHJlYWNoYWJsZQ0KPiBkdWUgdG8gYWNx
dWlzaXRpb24uDQo+ID4gU28gbm90IHN1cmUgaWYgdmlydGlvLXVzYiBhbmQgNDggaXMgc3RpbGwg
cmVsZXZhbnQuDQo+IA0KPiBJbmRlZWQgd2Ugd2VyZSBhY3F1aXJlZCBieSBRdWFsY29tbS4NCj4g
QUZBSUsgdGhlIHdvcmsgb24gdmlydGlvLXVzYiBpcyBvbmdvaW5nLiBBaXN3YXJ5YSBpcyBvbiB2
YWNhdGlvbiBub3csIHNoZSdsbCBiZQ0KPiBiYWNrIG5leHQgd2Vlay4NCj4gSSBhZGRlZCBoZXIg
bmV3IGVtYWlsIGFkZHJlc3MuDQpPayBTbyB3ZSB3b24ndCBoYXZlIHRoZSBob2xlIGJleW9uZCBm
ZXcgd2Vla3MuIFRoYXQgaXMgZ29vZC4NCg0KVGhhbmtzLg0K
