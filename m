Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA13D6497
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032548; cv=fail; b=M724dNfypSPgd+Q51SqdCCnX2DfuAfbnH89xBLThBg8NtTwwTMy/KIRRD3VBfjkdSXXFBfwURmV+ajgtyGdJUWpH4FJOPdnF8SscgcPEGJsWN/VKS1h+8JM3JAYlm/NawMe1pqcpJPQvxJjRi+Aryr+LiPMWe5rEPNz6Kc+GbL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032548; c=relaxed/simple;
	bh=D9dqsgsYQvSm6/VRxfGN5HjiND0IFA7ZOnv+WHjE5e0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HxFONhZlufQrRH4XKgAdik8VsNRAzPhuBrN6llP3w/bxo5lZyjSdsJYoc6fhhvQBSVG5115T6bNK7gKjUWr+Kx/zpagC4QH+w+JD3sxLtOKxhTW99mExMaV6nv3OfL/nJ3ERfM3WjA91QF69hLg7LTsgUxCyfYa+uiVv+5oIs7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iCRsyAI8; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iCRsyAI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8rdf8vykytCD8VpUTPdJ/skqc8IUIYsTsLhW/vcZc7dHqHlasPtolNl53YsWN80EeJ//K4PpAW6uqihvpDB1lUlly3cBtwPuxd2HSeO1kOPLRpmi9WhY9uFU92kqFJ2mOh2A1ynZC2cyq5YQx7x/wfCWzwXYxKXXk87ZGYx7Vz4x14Tf6/+ARdX6eL+Gh/7j4Wc1a7HDMA3hCHJDtS0bE76gecXn9+hcLRheGfrPymX+oLB0MgMa4AmwQQROydbJzpLz+S51MoPYXxiNuflROShAShprl+9bLHb8a8qjZYRxSRBtPFjvlN5/yMTEhq8qsV6R8bCcRdqQn6ipNmUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9dqsgsYQvSm6/VRxfGN5HjiND0IFA7ZOnv+WHjE5e0=;
 b=atGx+0hx/Uxjgd9GZgOFp609lvMCqSWdd/CacaEWV93i+55L0ezPTOFscMXf/VoThzaY+hcsEFhuNbUa3KJghXY9HOQE0Sj240DtABlnz0X44QbydMS0E7TS2pjFdMZ5QRDh8DcwNq8XJYumOjf6KVXllJL0Bkv64zOL7NFMDdU23uhlIM9pJZ3/57MA9/0DwoQXrIX6QzXAsTc4POavtz5QhvJ/qjk6Rl3BjWSTd6BsEKANbMb6nw70QU59OyrxQjo3d8oIf30aufzlORb5jpGggzNltnqtsjoCxVQPaGS5MpgysuD9S7Z5SGPvXJWlRSsLb3N4CpcRnpRPy5BuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9dqsgsYQvSm6/VRxfGN5HjiND0IFA7ZOnv+WHjE5e0=;
 b=iCRsyAI8/QZXP/PbG73XNerv/l0b4F7+MigHGehCI/Eh4V97NmLaW8etLrJ0prIgX1J/+zx7o/3oC7dVFfgifJpV0XrY8v0PQUQUs+2C0xUOzgJx4ZH/Cib2alHDEqTrVslFJXZJUiYXWJ4lX+WtzqzF4ym6keIuGlxRqWaDFsN9kgWaaoWy0URfaKDYawrBV1J8Mr1MiUrV7GHru/+2sLswQa6sYzf3kwSqlfR2qfFGb6hzan+sPDWUccppTWKGroR8hkTMyCLj0vNPbjmMSfzMqBtMFzTgJWXxQmDX4T55AwOBZ/k3Yq7t7Sd2yhpyA6xJOiv6pz1QSGRI1F1v5w==
Received: from CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.25; Wed, 25 Feb
 2026 15:15:42 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:15:39 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%6]) with mapi id 15.20.9632.010; Wed, 25 Feb 2026
 15:15:39 +0000
From: Parav Pandit <parav@nvidia.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: RE: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFu3dyU46FhXkWSoPS8nyUxT7WAvzgggAoZRoCAAGdhoIAAMZEAgAfGMQCAAAUmAIAAIlAAgAACG8CAAAYFgIAARRCAgAAB9wCAAAEjAIAAAL7AgAAEIoCAAABxMA==
Date: Wed, 25 Feb 2026 15:15:39 +0000
Message-ID:
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
In-Reply-To: <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
 SJ0PR12MB6806:EE_|CH8PR12MB9816:EE_|DM4PR12MB6664:EE_
x-ms-office365-filtering-correlation-id: d8a16d2f-451c-41dd-765f-08de7480bc09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 2j+q2dugffxlBHSttQGJIDtNhHTAxsKdAbaVFrTcDDHc8rt25cOtFgkEF/fZ21rR19Wseh//N5Wr/azrlQzgKLkPVhn80B/Jmz95C720VoilaG/NX2EUeCrxismToEpjgL3IcG+RhTseqDTLKA+bQ5gLVvCHG40E6cuBMKGltyRdej7tW+nDmyUESyfjYO8aSn08s3VrRXq/RKxE6Utkq29syN1mKCr/e+0HQpeGiDFwUqQeQscMax03hn7aqFAehWomNF/PmEv7m1154PrRgB5oEdidN6+LS5lXLurV05ktGil6ctu6/vwOtQLyPz6Ot8iQC5uT5B7u8ZdMoncrEXR0J5p6Zga/QYWL+dBDXI3eaY7N+E2oIkfjrR+U7Ky5Eh0xg0piCyYR9L+p6RJwJjdJ7RrbGXeKCcmru09PMmeOVQtD1qN0bzTvR/K6VFpABexF3E3v3utrgijNotwmkgN+PZ5L41GLiwA8u/I3gCQfciBbbLbk0pzKMLyUuHWpQY7LyjCnFvYY+ibvTyWa7v+c+VnCyoAJWlw2da26RUzvj2pUOVAM7bYn7OLvdfA1co7kKBvaleNSl9Ok/4MLo4ikMCvkMoLUP1mu8oWASNMZqNHffaa+j3gRcf6GtdvGTByPPEH21uvhnNA7//ZfWaWTprB6WZBuukRZjHzzBVxDukSMKsdkjMznJUpkTSSsjd4Xy9zesgLV+ofPab1VVPCcYcdbUV7rjy8JyiH/gZf957YPy/5CN5ezlGSj5AqvkcZ6+HZj/aRVQ3RkC94pau5da6Hagiin9Lo2qee1Z48=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9816.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFI0TjBJM0JBdHhFVkkyd0NwNFBWWjhqMUtFN0N1UzNJYVZMVThDWnhmM1JN?=
 =?utf-8?B?cDBVT0NLZFRFelBhbzFSaFVEQWlUb2VKSmRuT2JRRjlYdStxcnJKTHVSTnVY?=
 =?utf-8?B?MGJQTXFVOTJ6SjFOelo0UnZPMkpkZXk0WWZML2NVVHhpRmpKT0hxY0NIZHJP?=
 =?utf-8?B?U1h0S0dQcUIxTGgyL2JBaitQQ0VHVHNCZjVPbUpWNU9Vek5YaTVqYU95R1pN?=
 =?utf-8?B?eHJBNmNMaEhIcWZaeEVxb2xmQWJnQlBiTE14Q3pXNlREU0xnWTg3Y21yZXlW?=
 =?utf-8?B?cWNwelFZU1FobzUvaXJLQ1VFbWtuSllzNXp0TE1HeXBsWWV1NjJSMUVEMVNI?=
 =?utf-8?B?M29VdFIwRXVzRURYK203eS9JWUdwZFlVa1pEYVZFYzFHdkdHeG5DN3NyZ2Nw?=
 =?utf-8?B?RWFxOE85b0xpamF6U0JERHppeFVaSzArL3JyV28xZ1dsekJiN2dEbXN0R3Bn?=
 =?utf-8?B?R3VzQnRvSDZOOU1XTytZeUd5ME1ZTmM0eE96MDhONXJSRkx5QlEwMXM1RVFX?=
 =?utf-8?B?bzV3S2g0RWl0anVkSmlXNnB3d09DT3UwREh0MzhzSy96Uk04cUM3cTVsR0tk?=
 =?utf-8?B?dXBremU3UEZaTUtxaEF3RFZYYkdrckllQUd2N1FMQkRHV1phTlduREZHUTVU?=
 =?utf-8?B?eTlRT1p3YXlOZTFESVFkZWE5N0pwMmFubnc4TjVHVkxaVTZTVExTVGlFNnJM?=
 =?utf-8?B?RGJwbjlMK3VnVVlyUit6QnF1b2JIQ3hZdjM5NjBlOGJNTUdRSy9zL0xpM0d6?=
 =?utf-8?B?VllRY25RY2NYVkh0dkFhOHNhNk5xMXNFdTFqME5uNVRhcW1VVDBzM3dHeStR?=
 =?utf-8?B?V2k0VlNiZlJYaVNhQTBSL0tPZ3RydGlKL0dqV0g5WHpHL0UxZi9qaTN1Vzc1?=
 =?utf-8?B?R05pRWUxMDV4MFpwdXhYOXRkeVYxMXZ6ODNzTGwyVVdJWCs0RzJoOFlhTjFS?=
 =?utf-8?B?d1MySlM2SGJPVCt4bzQzdUk5WTRrQ3hHdnlqajYrSHhyL25OMWUrMkRBSTZM?=
 =?utf-8?B?L1FSTzlzbzVhak5QTVBpSjBRM250Q0VkdG5FSVdtSENFZGlTY1ZEZTdDOWhh?=
 =?utf-8?B?cEpWK2hsQWFIUEhGQmROZ0NkL1hLK1hOaEExeGpBSDFPaE5HVHNFRWNpU095?=
 =?utf-8?B?M0VhTGJaUTVWMEpHS3VoS0d0ckllN1FTVXZGbDFHa1ZCUTVMTi8veE9vN2hs?=
 =?utf-8?B?Z1V5QVUvNENlRm9wd1kxOC9JVDk5OEtFWVF5eVN3TjlLYkFzQlIrNTAzYUhK?=
 =?utf-8?B?aC83OXZrdXZ1N1crVFJIcURMbHE1N3RXS3pVVkpjaVd3NWRZYTZTUHZ1WlEv?=
 =?utf-8?B?WStOK3Yvd3ZhUVVNNmRJS3Fud2Jad3Z4QXJ5dmg2TkNlb3hmN1E1Z2RxMWMr?=
 =?utf-8?B?cGtTTkc5NDQrNXgzd21lMEtGVlhmU3dBSkh0U2hPek5BTkRKeXF1L29iL2JY?=
 =?utf-8?B?elFSU25MMWdRYlJ2SVB6Vk0rRC9QdU9oUDhFOSsrdG5LeTBmbjY3T21NY2JN?=
 =?utf-8?B?QW9nb3JDLzJBT1hpdThIdVdSaGs2QkE4RWFvMVBvSzQ1KzBGTHpVTnVjdnl6?=
 =?utf-8?B?eGlpT05lN1FxODdHSE1NSnZXcy9hblRtVlRMc2JNT05OblB1aEdvZnVWWGdP?=
 =?utf-8?B?RGx3YTN6Yld6MkY5dG1QSTJJWGplYmwyVEdRbFhQZGV4Z2VuTlJVekJpOHBG?=
 =?utf-8?B?Vm5tYVo3a3FudVI2d1B1eHFWTzFRTzlUbHRHTHBlQ3U0U3lwWWdXNGliM0Ni?=
 =?utf-8?B?WnlHUSt3dUZEajB4bzIxeldXVU5MMDM2SXZrR2g0aDJwQ3NMcU5iTTB4dXJQ?=
 =?utf-8?B?NG9IaGZtOXRZaHhTMS90UTJsRlR5SDJ5RE1yVUNaTkxheVNTbHJGZEJ5U0th?=
 =?utf-8?B?YUpobmc1eStWcmwyMFJDdXdxNU5aRFUxTndycUdPYk1LTFduZ3N6NmdybWxK?=
 =?utf-8?B?NlRoZ0xBUTlldkQzbzRqSFplK3RtMkYvU1FlcnVjRWRvdDVnS2hGUjJqdmtm?=
 =?utf-8?B?MXAzSjBZS012N2Q0T1NUZEZIb3Jsb3pBbXByWWplbEREZmltZVd6WDAwZ0pT?=
 =?utf-8?B?K3Y3eFV3OWU5RWJBOFRkUXdoNzFMcTQwUGtDbnpDNnRxM1c4UnhsSnRLTEVp?=
 =?utf-8?B?cU0xUWRaYTJIWVZaRlRnaExRUVJTUXNmS1Y0MCtCSkp3SkpBa3JjRmYxOXpz?=
 =?utf-8?B?N0orOVJxQllmNDY3UUlDNnNvVjUxS3lCOHlVUXBVMTZlM3VBbjlyZVNnQWVn?=
 =?utf-8?B?N0s4dmdxUndmWnF2UUFFdG1lc2pDSDh5dDlEUDhSVktMK1R6SUptR1plMGtu?=
 =?utf-8?Q?k5Rv2jjm3KuXQEBa2P?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a16d2f-451c-41dd-765f-08de7480bc09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 15:15:39.1697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DB+EPAU007xjYA+Xr33VI3MdKOlcXlGNYTtv0YxvJBpqu15OvlE05bl88EW4LCNqQG/RZLCqtlkdQgNqnczFPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664

DQo+IEZyb206IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPg0KPiBTZW50
OiAyNSBGZWJydWFyeSAyMDI2IDA4OjQxIFBNDQo+IA0KPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBh
dCAwMzowMDoxOVBNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+IA0KPiBbLi4uXQ0KPiAN
Cj4gPiA+ID4+IFllcy4gVGhpcyBtYWtlcyBhIGxvdCBvZiBzZW5zZSBub3cuDQo+ID4gPiA+Pg0K
PiA+ID4gPj4gVGhpcyBpcyBhIHZpcnRpby1tc2ctdHJhbnNwb3J0IGRldmljZSB0aGF0IG5lZWRz
IGl0cyBvd24gZGV2aWNlIGlkIGluIHRoZSB0YWJsZS4NCj4gPiA+ID4+IEFuZCBpdHMgYmluZGlu
ZyB0byB0aGUgUENJIHRyYW5zcG9ydC4NCj4gPiA+ID4NCj4gPiA+ID4gb2suIGhvdyBhYm91dCBh
biByZmMgb2YgdGhhdCBpZGVhIG9uIHRoZSBsaXN0Pw0KPiA+ID4NCj4gPiA+DQo+ID4gPiBJIHdp
bGwgbGV0IEVkZ2FyIGFuc3dlciBvbiB0aGlzLg0KPiA+ID4NCj4gPiBTdXJlLg0KPiA+IEFsc28g
cGxlYXNlIGV4cGxhaW4gaG93IGlzIHRoaXMgZGlmZmVyZW50IHRoYW4gU1ItSU9WIGRldmljZXM/
DQo+ID4gT24gYSBQQ0kgZGV2aWNlIHRoZXJlIGFyZSBzb21lIGNoaWxkIGRldmljZXMgZXhwb3Nl
ZCB1c2luZyBzb21lIHZpcnRpby1tc2cgYnVzIHRyYW5zcG9ydC4NCj4gPiBBbmQgYWxsIG9mIHRo
ZW0gYXJlIGdvaW5nIHRvIHNoYXJlIHNhbWUgUENJIEJERi4NCj4gPiBUaGVzZSBpbmRpdmlkdWFs
IGRldmljZXMgY2Fubm90IGJlIG1hcHBlZCB0byBkaWZmZXJlbnQgVk1zIChzZWN1cmUgb3IgcmVn
dWxhcikgaW4gYSBwZXJmb3JtYW50IHdheSBlaXRoZXIuDQo+ID4gU28gd2hhdCB3b3VsZCB0aGlz
IHZpcnRpby1tc2ctdHJhbnNwb3J0IGRldmljZSBhY2hpZXZlPw0KPiA+DQo+IA0KPiBJREsgd2h5
IHlvdSBhcmUgY29tcGFyaW5nIHRoaXMgdHJhbnNwb3J0IHdpdGggU1ItSU9WLCB3aGljaCBhbHRv
Z2V0aGVyIHNlcnZlcyBhDQo+IGRpZmZlcmVudCBwdXJwb3NlLg0KPiANCkluIHRoZSBleGFtcGxl
IHNob3dlZCB0aGVyZSBhcmUgbXVsdGlwbGUgZGV2aWNlcyBiZWhpbmQgb25lIFBDSSBkZXZpY2Uu
DQpXaHkgaXMgaXQgbm90IHNpbWlsYXIgdG8gU1ItSU9WIHRoYXQgZG9lcyBleGFjdGx5IHRoYXQs
IG9uIG9uZSBQQ0kgbGluaywgZXhwb3NlcyBtdWx0aXBsZSBkZXZpY2VzLg0KDQo+ID4gSWYgdGhl
cmUgd2FzIG5vIFBDSSBidXMgd2hlbiBpbXBsZW1lbnRpbmcgdGhlIHZpcnRpby1tc2cgdHJhbnNw
b3J0LCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGF2b2lkIHRyYXAtZW11bGF0ZSBzdG9yeS4NCj4g
PiBCdXQgdW5kZXJseWluZyB0cmFuc3BvcnQgYmVpbmcgUENJLCBpdHMgYmFjayB0byBzcXVhcmUg
b25lIGZvciB0aGUgb3JpZ2luYWxseSBkZXNjcmliZWQgbW90aXZhdGlvbi4NCj4gPg0KPiANCj4g
RXZlbiB3aXRoIFBDSSBhcyB0aGUgcGh5c2ljYWwgYnVzLCB3ZSBkb24ndCBuZWVkIGFueSB0cmFw
IGFuZCBlbXVsYXRlIGFzc3VtcHRpb24NCj4gd2l0aCB0aGlzIHRyYW5zcG9ydCwgYmVjYXVzZSB0
aGUgY29tbXVuaWNhdGlvbiBpcyBtZXNzYWdlIGJhc2VkLCBub3Qgd3JpdGluZyBhbmQNCj4gcmVh
ZGluZyByZWdpc3RlcnMgZGlyZWN0bHkgaW4gdGhlIEJBUiBtZW1vcnkuDQo+IA0KVGhhdCBpcyB0
cnVlLiBTb21ld2hlcmUgaW4gdGhpcyB0aHJlYWQsIHRoZXJlIHdhcyBtZW50aW9uIG9mIHRyYXAr
ZW11bGF0aW9uIGFzIHJlYXNvbiB0byBjcmVhdGUgc29tZSBtc2cgYmFzZWQgdHJhbnNwb3J0Lg0K
U28gSSBkbyBub3Qga25vdyB3aHkgdCtlIHdhcyBtZW50aW9uZWQuDQpJIGRvbuKAmXQgaGF2ZSB0
aGUgbGluayB0byB0aGF0IGVtYWlsIGF0IHRoZSBtb21lbnQuDQoNCj4gLSBNYW5pDQo+IA0KPiAt
LQ0KPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+N
DQo=
