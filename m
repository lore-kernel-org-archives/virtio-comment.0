Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4404EFFD2
	for <virtio-comment@lists.linux.dev>; Thu, 15 Oct 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070323; cv=fail; b=vAfau1NWyGnvILSJX0kHehBLAwdAVxE37upovGVM5xzmjf7XzC2hHh033lZlZFki21AZ4qX8NzMNEuxR1LseCQY17K5BnlIgT4skGZiXOB6/OdHDvbJ911xDXL2nFQ/23r6Jf2cqElJ805QROLGNayazEpqVnk9eyAfYDSbi8qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070323; c=relaxed/simple;
	bh=TpFdpo1JPLveq8eHXGiCiXm2fkKbGe6OxK8gveIUPmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nM2I2wsGWfkRoY9ItxmMKtwAnRw61RNfG7f17jQO6XjW/fvnPu5Wj+NouwsE4KzPShwf6DXWUlwKAcawtt+TuCMwI7ghr4VYWleJowTT2kpKb77+aZ4B9XIZ3l1X99dpmpcamEO4oTtNKoevOI2w1jsmFZcU1pkK8OyyiQw2jrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U8voDIic; arc=fail smtp.client-ip=40.107.200.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U8voDIic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7W3s8hTDYa0FaIogo0x7lNiwtJKYOKyblrKuMfr0nhqSsG/epccUDVIzpZXYXFRGVvs5/JQWZajttg31lYiMfsatLkcoXrPlwr7NQOynNWB2XCz18GMpPwsJ/ZUPzjrdDIViP/miJfn5NzNCcDNgdk0K5QohG33DNWbHaQLN6vLz9CGh+BoGPdjVGKvcfOcpsB+QWTNoWxEA4BH9VhD7C5OpX8Fhj+MZ9WmAQF6myCC4TY7U4emZCb1uCeEjc9Yac77CG++2pjYj80iMdcOfNXfTilOJIyQHN9M7b5nQCgOxqSWyJj/w9Xko6PAnk50VPnpc90AY1hEfpV24AXSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpFdpo1JPLveq8eHXGiCiXm2fkKbGe6OxK8gveIUPmU=;
 b=g2QoT6vcFubdowz0HpA62DcBzMMkLEZ+69Cdrpmt0mmtijTQICeSdUjO3e66XkcrfW9uGDMVikKdiXuc3mWwh3kXEXdghEZHAYB1kly8vTlN+kjoWvCyh7RP/W8cTKxIH5aOGeTgYwwks6o7RbJ2nh2zlXvbV7ppOWsszVVy7h2LigVESN2HD/1Bs/dvTj3Bu/sYyyqdk6VmiFUuLbl0K/W5T3ZvhNtoyrJhblsg1r8/sm11jaUKB0pTdUAcVwGN/NFPi9kc+51rXz3W8W3o6GT11KFhgxV356tDn8ZjoGw5H9ncSIDiL9nOfppG65DyKN5ighx/OYkStfPm/1EFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpFdpo1JPLveq8eHXGiCiXm2fkKbGe6OxK8gveIUPmU=;
 b=U8voDIicVqhnL7+FkGUndhs4mFpwo3riUkCMPxOV3JsJ9qWFd6KYVr7swfKk5Ydce4l6CxhDdL6IQMY88w4Mlvh9Lpxe79wddHWMgt8WjlUy9sJhgobgaCngBbhnVXjo3IKSITzwzYDHMj8INB47ChK/3EgEtJV7f7pe3/iXy5Z7kA5NdcSTcuRw/n8mSz5GW9SjmZV/z+b6W9NNTyVe/q6NRbWbWgeAt5TqDTi0NK2bMKAkwGXjLnj0APW+jF+YTqXKekQcROyw0c/SaWD2Eyg69OgVsAYwvzfeUs9+a+KiwKnlWtsMA5SuApSTMH7Lt2FsSAwNUXqD4f8Z1oBbtw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 13:18:37 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 13:18:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment
	<virtio-comment@lists.linux.dev>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "ebiggers@kernel.org"
	<ebiggers@kernel.org>, "neeraj.soni@oss.qualcomm.com"
	<neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v3 0/2] virtio-blk: Add inline encryption support
Thread-Topic: [PATCH v3 0/2] virtio-blk: Add inline encryption support
Thread-Index:
 AQHdWp8h+w9D4Gdj+EO+ya5EUIel1Lb7qRyAgACzgBCAAEpkAIAAArDwgAAQJICAAAHAgIAAAZ4AgAHcFoCAAABGYA==
Date: Thu, 15 Oct 2026 13:18:37 +0000
Message-ID:
 <SJ0PR12MB6806E6C827BD828065A847B9DC9C2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <de535820-591b-40f2-b840-d987c3253765@nvidia.com>
 <9515779b-a6da-407f-99f2-011e51683d15@oss.qualcomm.com>
 <20261008060644-mutt-send-email-mst@kernel.org>
 <d503aee0-9920-4c0b-b9a0-c08e505cc3ea@nvidia.com>
 <426abc9a-c7b4-4631-a5fe-3b2bba1d0414@oss.qualcomm.com>
 <SJ0PR12MB68060279EA2241FAEB2EDE8CDC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014032222-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E08103C7BC39C61EADF9DC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014035225-mutt-send-email-mst@kernel.org>
 <13419c56-ef94-4dfd-ba44-a3dffe5f73f2@nvidia.com>
 <20261014044718-mutt-send-email-mst@kernel.org>
 <0829d340-6085-45a8-8c0e-99c9d77b9625@oss.qualcomm.com>
In-Reply-To: <0829d340-6085-45a8-8c0e-99c9d77b9625@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DM4PR12MB7622:EE_
x-ms-office365-filtering-correlation-id: 7da3a90d-7761-4832-1962-08df2abed272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|22082099003|10067099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 UWam+l2oUgfRMxcrN8TrMGM8Qp2+R7nl9PfEdY1hxiR0aTbq61mILmYVbjlthwBqo8BzyaNdUVNPnTm9U8XkRTxxbloNxJo1oS5oOP0xapTzLpL6OWfXM/TjKNyc8KFmSXYwIh+YzRxKGIRUazOSb2U5gD1uNRczdbuclKe3gFwFnPZuwDcb0PHonZ/bS8NvwH5alkcov5/uLAk8GFqzD18q32oW3ERNojGi7qT9xANGLS6oRGNJ+wKk5mYSPyBc0tXyApdRKqTNpobOg5e9LEx+6+gEmZZUbST/f/krczVGSn7EFsECk/avatwzyCm6tBYM7YI/gpSmBv3gSBU182KmTlyN1bx+aiBb14GHSio8dW8hn2x4eKqwxUaezorEqCmBm4NUoMEjbOkrsOJk9SkDb16kNAu8B0HJ+TGnhRLaJATN+S/afPVxGAJGHmy+jdmsBILQcShlYX2F1FsmLpfQR4DiIIUTAf7oPNViChWcTHCTCRWwBu8eV4Pu5Xq/ON7Rio1caYSodDEZbRnu7KHVJoKuxtRYg5+t8WqQ3PZYOLBegPhh0o0ZtUFPVi9AWvrBDyUayCg/M3pdRX1/VWBNO+nyTT26Wlc8Qp0m+YCIBuKyHwBO7JuRMDNstLQ7jxYGbdiYhfvgSwd3yEvc2ycWi/8+XeiUs6LpQbkZuSpuO6n7APoOb3GBMms/A1m7JL/bigE1yK7XL2jPqmMPnnPfuRhEcELF5OYLzs/+xJY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVhQL0Q5cHdYNzdCbmJUbTVsbGwxV2g0MTYzRUYxMGZMUm5jNHdOZ01xU3Uw?=
 =?utf-8?B?Mkc1cTFHY0M3TWJRdFZJNXFpeXp6bWZmNkhCUDRhS1FWZ2NycXlFMVJvZ2ZY?=
 =?utf-8?B?dktpeHlSbVdZS2JqTC9aY0dPbUVnWVZWeDRCd3FlK1pYVzNuSFV1NUg2akth?=
 =?utf-8?B?enVuT2daaTUvemlYMisrVVhNZVMySm5oV25ibWhCQTdwUG1XQnhPcHB1d3pr?=
 =?utf-8?B?bGd3WElwelNnWHVrN0lic285QmV4dTUwdUtBd2tkZkd3Ynd4VzZ6YVpBdjJ0?=
 =?utf-8?B?SEU1MmpPbGF3WUVxSzNteVpKVmhCeEs0RjNHQ2oyaGFhSkhENklUOWZySTBp?=
 =?utf-8?B?b01YQUtjeXBXRDRxWFpJaHZCVi9OelZMYXI5QTFHZHJlbjJrdERQWjZRSFp2?=
 =?utf-8?B?OU5hNktaMEViaGZRa3FyenRsTmk2Y0FDNkpmSytQMzByMDRzckNrOXJuTEdK?=
 =?utf-8?B?MEx5NFJOekswSlRDQzd1M3dKRXVYUWhNcVc3WWtUZEpTMzM1d0xWdXF2Q0FE?=
 =?utf-8?B?c091SEFaQWdTV1ZyS05RSnBIa1lOcXl1R2x4aDVUSE53VlpwM3N2R1FQOE1C?=
 =?utf-8?B?VkxzNXlaN1VEY1BteFlYTWJ5MXlGQ1UrRlR1eHJsN3pKU3dRK2VzSURiZ0hJ?=
 =?utf-8?B?SnRCZDRYQm9Qd1I0ZW9LemJ0Z2hyMVQ0NUhOcHcvQkpyK3FMZGFFOU1ESlAz?=
 =?utf-8?B?cnFLbk1ycENPQjdWOEgwcTNPd1Bsc1FYWm8zOFVnTlhOcTgxdmhua3ZlK2J3?=
 =?utf-8?B?em5rSFFmWnpTTStUWjNXWTVsZllqd1RQSDRTMkFRZks4Z3hSemRRalpyRXFx?=
 =?utf-8?B?M1dkNktNK3o0YWZKVFg3QUlHNW5sUGt6bDFWWTFMZnExMGRSdTZrWVFBNDNU?=
 =?utf-8?B?QUkrVExKMXVXbkFPTVBoZ1RpTzZ5aXd5eHBXM0JrR1ZSRjBrSUdqdjJtREJn?=
 =?utf-8?B?R1FHaCtWYzBhSHhWWlFDbmx1ekYzbjBUanJvVytOQUtmUUp5VGloaCswQ2xD?=
 =?utf-8?B?bDZzUXErR1dhNE1FN2VwNkx0VDJKTUVzdGtoV3h3M2lnbnBoNWpVSi9ybGE3?=
 =?utf-8?B?YlVHTWZHQWYvNkxkM3piNDFWY1FmajlpdXBQWWppQVBNaitLS3VwbkQyZGpx?=
 =?utf-8?B?dGNmOVFUNTNmUzgzbzJ4NUNNQnNhR0hXQkxQOW5UaHAvbUYyVFRjYzdsY3Mv?=
 =?utf-8?B?cENOYURiUzB5OG9YR2dodDdUOUJQYVdaQTArWFRHTUd1dHl5NS94d2JnYVpw?=
 =?utf-8?B?NTdMTmI5ak1QbzlWaitOcFo1S1Y5Wjg2OUpNZVcxT0FpNWR3bG5pZDdLOUht?=
 =?utf-8?B?ZXNOSWN0bVdiYWkxZFJRTjdSdGtybE5SazVzbzFCREtJeUR2V1k4a3Vha2Jv?=
 =?utf-8?B?S2JlcVo2NXl4NGRKejU4bmJLejZDamd0SjFpbko2ZEhXeFUxV3NuUkc3dDVt?=
 =?utf-8?B?OHBHUklmRFVHb25LSWhvWjRlN3dTQTE3TUYzbGxDeVpxTDNYSkRFTTlnSFJG?=
 =?utf-8?B?NUcxSS92TC9IU2R4ZnQ2M29ReFgrSVduWCt3bjRYb0JDcXU3UE9xYTEwbzBC?=
 =?utf-8?B?YmY1b2g0Q0tiMGhuSW0yUTRnb2dEeVZaeEE0UzF0ZXYrVzVFSWVGYmVIbW13?=
 =?utf-8?B?aENlcHNocGs2Y29NdmJPN2dzcnJWWmZ3RHpwa2x5NGdkdUZLVnU0VzQ3R3hy?=
 =?utf-8?B?L2NxSTdwM21hOEMwOE1DcTYzVTNLcVdiMzBkSGwvbFg1STJyVXAzL252anVP?=
 =?utf-8?B?S2RrNE5SNnlSSVZiT2hEcjZ3bkZlL1VzRHpHTGRMRGt4cEJ3V21FSU1ITnpp?=
 =?utf-8?B?dTFqRDlxOFAreTYxWDdvTTNiMWRjWlZ4YVpFSzRMcTVIdnFhQTh4bkQzanJ2?=
 =?utf-8?B?RTA0aUJVVTE5ZTBEb0wzM0hGZHEwNDhCbUU5S2VBaGtHQ2xlWGt4L2h0UEo1?=
 =?utf-8?B?WndpYXVDemM4aUtObUE2c3lvM29MS0t6Unp0clI1RVB3dTVuMUJaWHZuWjMy?=
 =?utf-8?B?UDNCblovSk82OTVnUmZySzR3MFNaZnVVaFhCYnoxd2I2VFQ2Ym04TlFUZmZC?=
 =?utf-8?B?VXYvZlBBTDhRbFR1ZTRzS0tOMFZTVUs5SVNTbzVPWW9objVGWFNEZTJRak05?=
 =?utf-8?B?V2pqS1ZsYzB2bDU0V01zRUNYZTNFaXpZczlESzBmZ2YxZFBQSSs3TktDZ1Ns?=
 =?utf-8?B?UVZlNDZyenB4QVg2dGNTMTA5dnlPZE1MQWVNWWFSOHYrRGI5bCtnR1Vnby83?=
 =?utf-8?B?UjVOa1U5dE14SUVhamFPaGplc0lSU2VaT2tSZmIwS2RxODV5Zk9TWldoTVlM?=
 =?utf-8?Q?3BJiGKlTYFjDu38AXH?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da3a90d-7761-4832-1962-08df2abed272
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 13:18:37.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlueIUjonCwtETTjGv7ZnxyY5YZviNYgfx/oD+VMITisTHcLROA24sHmmhYl93y6bkGVUjDXFd2iMhVMRragpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622

DQo+IEZyb206IExpbmxpbiBaaGFuZyA8bGlubGluLnpoYW5nQG9zcy5xdWFsY29tbS5jb20+DQo+
IFNlbnQ6IDE1IE9jdG9iZXIgMjAyNiAwNjo0NiBQTQ0KPiANCj4gKyB2aXJ0aW8tY29tbWVudCBm
b3IgcmVhbC4gKG1pc3NlZCBpbiBwcmV2aW91cyBlbWFpbCkuDQo+IA0KPiBPbiAxMC8xNC8yMDI2
IDQ6NTEgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBXZWQsIE9jdCAxNCwg
MjAyNiBhdCAxMTo0NTo0OUFNICswMzAwLCBNYXggR3VydG92b3kgd3JvdGU6DQo+ID4+DQo+ID4+
IE9uIDE0LzEwLzIwMjYgMTE6MzksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+IE9u
IFdlZCwgT2N0IDE0LCAyMDI2IGF0IDA3OjQ0OjExQU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90
ZToNCj4gPj4+Pj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4g
Pj4+Pj4gU2VudDogMTQgT2N0b2JlciAyMDI2IDAxOjAyIFBNDQo+ID4+Pj4+IFRvOiBQYXJhdiBQ
YW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4+Pj4+IENjOiBMaW5saW4gWmhhbmcgPGxpbmxp
bi56aGFuZ0Bvc3MucXVhbGNvbW0uY29tPjsgTWF4IEd1cnRvdm95IDxtZ3VydG92b3lAbnZpZGlh
LmNvbT47IFN0ZWZhbiBIYWpub2N6aQ0KPiA+Pj4+PiA8c3RlZmFuaGFAcmVkaGF0LmNvbT47IGVi
aWdnZXJzQGtlcm5lbC5vcmc7IG5lZXJhai5zb25pQG9zcy5xdWFsY29tbS5jb20NCj4gPj4+Pj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzJdIHZpcnRpby1ibGs6IEFkZCBpbmxpbmUgZW5jcnlw
dGlvbiBzdXBwb3J0DQo+ID4+Pj4+DQo+ID4+Pj4+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDAz
OjEwOjU1QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+IHJlbW92ZWQgdmly
dGlvLWRldiBtYWlsaW5nIGxpc3QuDQo+ID4+Pj4+PiBBZGRlZCB2aXJ0aW8tY29tbWVudCBtYWls
aW5nIGxpc3Qgd2hlcmUgdmlydGlvIHNwZWNpZmljYXRpb24gY2hhbmdlcyBhcmUgZGlzY3Vzc2Vk
IGJ5IGNvbW11bml0eS4NCj4gPj4+Pj4gUmlnaHQuDQo+ID4+Pj4+DQo+ID4+Pj4+Pj4gVGhlcmUg
aXMgYWxzbyBhIHRyYW5zcG9ydCBjb25zaWRlcmF0aW9uOiBWSVJUSU9fRl9BRE1JTl9WUSBpcyBj
dXJyZW50bHkNCj4gPj4+Pj4+PiB1bmF2YWlsYWJsZSBmb3IgdmlydGlvLW1taW8sIHdoaWxlIHRo
ZSBwcm9wb3NlZCBjb250cm9sIFZRIGFwcHJvYWNoIHJlbWFpbnMNCj4gPj4+Pj4+PiB0cmFuc3Bv
cnQtaW5kZXBlbmRlbnQuDQo+ID4+Pj4+IFNvdW5kcyBsaWtlIGFuIGltcG9ydGFudCBsaW1pdGF0
aW9uLCB0byBtZS4NCj4gPj4+Pj4NCj4gPj4+Pj4+IFBsZWFzZSBkZWZpbmUgYWRtaW4gY29tbWFu
ZHMgZm9yIE1NSU8gYXMgd2VsbCBpZiBpdHMgbmVlZGVkLg0KPiA+Pj4+PiBUcmFuc3BvcnQgZGV2
ZWxvcG1lbnQgaXMgaGFyZCwgTU1JTyBlc3BlY2lhbGx5IGFzIHRoZXJlJ3Mgbm8NCj4gPj4+Pj4g
YWN0aXZlIHRyYW5zcG9ydCBtYWludGFpbmVyLA0KPiA+Pj4+IFNlZW1zIGxpa2UgYSBzdHJvbmcg
aGludCB0aGF0LCBpdCBoYXMgbm8gYWN0aXZlIHVzZXIgYmFzZSBlaXRoZXIuDQo+ID4+Pj4gb3Ro
ZXJ3aXNlIGNvbnRyaWJ1dGlvbnMgdG8gTU1JTyB3b3VsZCBiZSBtb3JlLg0KPiA+Pj4gWW91IG11
c3QgYmUgam9raW5nLiBGaXJlY3JhY2tlciBpcyB2aXJ0aW8gbW1pbyBldmVyIGhlYXJkIG9mIHRo
aXMgc21hbGwNCj4gPj4+IHByb2plY3QgY2FsbGVkIEFXUz8NCj4gPj4+DQo+ID4+PiBPaCB5ZXMg
aXQgaGFzIGFuIGFjdGl2ZSB1c2VyYmFzZS4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+PiBpdCBpcyBh
bGwgZHJpdmUgYnkgY29udHJpYnV0aW9ucywNCj4gPj4+Pj4gYW5kIGl0IGhhcyB0byBzdGF5IGxp
Z2h0d2VpZ2h0IGFuZCBzaW1wbGUgd2l0aCBtaW5pbWFsIGV4aXRzLg0KPiA+Pj4+Pg0KPiA+Pj4+
IE5vdCBzdXJlIGhvdyBDVlEgaXMgYW55IGxpZ2h0ZXIgdGhhbiBBUS4NCj4gPj4+PiBHaXZlbiBB
USBpcyBnZW5lcmljIGFuZCB2YWxpZGF0ZWQgb24gb3RoZXIgdHJhbnNwb3J0LCBzZWVtcyBhIG5h
dHVyYWwgZml0Lg0KPiA+Pj4+DQo+ID4+Pj4+IEZsb3cgZmlsdGVyIGNhcGFiaWxpdHkgdG8gd2hp
Y2ggeW91IHJlZmVyIGhlcmUgd2FzIGFkZGVkIG1vcmUgdGhhbg0KPiA+Pj4+PiAyIHllYXJzIGFn
bywgc3RpbGwgbm90IHN1cHBvcnRlZCBvbiBNTUlPLg0KPiA+Pj4+Pg0KPiA+Pj4+IE5vdCBmaW5k
aW5nIGFueSB1c2VycyBkZW1hbmRpbmcgdGhpcyBlaXRoZXIgdW50aWwgbm93Lg0KPiA+Pj4gVXNl
cnMgZG9uJ3Qga25vdyBleGFjdGx5IHdoYXQgdGhleSB3YW50LCBvZnRlbi4gQnV0IHllcyBBUSBp
cyBjb21wbGFpbmVkDQo+ID4+PiBhYm91dCwgYW5kIGxhY2sgb2YgY29tcGxldGVuZXNzIGFjcm9z
cyB0cmFuc3BvcnRzIGNvdWxkIGJlIG9uZSByZWFzb24uDQo+ID4+Pg0KPiA+Pj4+PiBTbyBubywg
SSBhbSBub3QgaW5jbGluZWQgdG8gYWdyZWUgYW55IGFuZCBhbGwgY29udHJpYnV0aW9uIHRvIHZp
cnRpbyBpcw0KPiA+Pj4+PiBub3cgYmxvY2tlZCB1bnRpbCB0aGlzIGlzIHJlc29sdmVkLg0KPiA+
Pj4+IE1heSBiZSBMaW5saW4gY2FuIHRha2UgYSBzdGFiIGF0IGVuaGFuY2luZyBNTUlPIGZvciBh
ZG1pbiBjb21tYW5kcy4NCj4gPj4+PiBQYXRjaCBpcyB3ZWxjb21pbmcgdG8gbWUgdG8gdW5pZnkg
YSBxdWV1ZSBhY3Jvc3MgdHdvIHRyYW5zcG9ydHMuDQo+ID4+Pg0KPiA+Pj4gSXQncyBhbiBvcHRp
b24gSSdkIGJlIGZpbmUgd2l0aCwgYnV0IEkgZm9yIG9uZSBpcyBub3Qgdm90aW5nIGFnYWluc3Qg
dGhlDQo+ID4+PiBmZWF0dXJlIGlmIGhlIGRvZXMgbm90IHdhbnQgdG8uIEFuZCBJJ2Qgc2F5IGNj
dyB0b28uDQo+ID4+DQo+ID4+IEFkZGluZyBvdGhlciB0cmFuc3BvcnRzIHRvIHN1cHBvcnQgQVEg
aXMgb3J0aG9nb25hbCBmb3IgYWRkaW5nIGEgbmV3IGZlYXR1cmUNCj4gPj4gdG8gc29tZSBzcGVj
aWZpYyBkZXZpY2UgdGhhdCB1c2VzIHRoZSBBUS4NCj4gPj4NCj4gPj4gTGV0J3MgcGxlYXNlIHNl
cGFyYXRlIGl0IGludG8gMiBhY3Rpdml0aWVzLg0KPiA+Pg0KPiA+Pg0KPiA+DQo+ID4gQW5kIHdo
byBpcyBkb2luZyB0aGUgb3RoZXIgYWN0aXZpdHkgYW5kIGluIHdoYXQgdGltZWxpbmU/IGl0IGRp
ZCBub3QNCj4gPiBoYXBwZW4gaW4gbW9yZSB0aGFuIDIgeWVhcnMuDQo+ID4NCj4gPiBBZ2FpbiBp
ZiBMaW5saW4gd2FudHMgdG8gc3VibWl0IHRoZSBmZWF0dXJlIGFzIHBjaSBzcGVjaWZpYyBmb3Ig
bm93LCBJJ2QgYmUNCj4gPiBmaW5lIHdpdGggdGhhdCwgdG9vLiBCdXQgaWYgaGUgd2FudHMgaXQg
Z2VuZXJpYyB0aGVuIEkgZm9yIG9uZSBhbSBzeW1wYXRoZXRpYywNCj4gPiBpdCBpcyBhIHJlYXNv
bmFibGUgdGhpbmcgdG8gd2FudCwgYW5kIHNhZGx5LCBBUSBhcyBhIGRlcGVuZGVuY3kgaXMgb3V0
IHRoZW4uDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMhDQo+IA0KPiBBIGdlbmVyaWMg
c29sdXRpb24gaXMgd2hhdCBJJ20gbG9va2luZyBmb3IsIHNpbmNlIHRoZSB1c2UgY2FzZSBJJ20g
d29ya2luZyBvbg0KPiBpcyBlbWJlZGRlZCBhbmQgYXV0b21vdGl2ZSB2aXJ0dWFsaXphdGlvbiB1
c2luZyB0aGUgdmlydGlvLW1taW8gdHJhbnNwb3J0Lg0KPiBUaGVyZWZvcmUsIHRoZSBzb2x1dGlv
biBuZWVkcyB0byB3b3JrIHdpdGggdmlydGlvLW1taW8gcmF0aGVyIHRoYW4gYmVpbmcNCj4gbGlt
aXRlZCB0byB2aXJ0aW8tcGNpLg0KPiANCj4gSSdtIGFmcmFpZCBJIGNhbm5vdCB0YWtlIG9uIHRo
ZSB2aXJ0aW8tbW1pbyBBZG1pbiBWUSB3b3JrIGFzIHBhcnQgb2YgdGhpcyBlZmZvcnQuDQo+IEl0
IGlzIGEgc2lnbmlmaWNhbnRseSBsYXJnZXIgdHJhbnNwb3J0LWxldmVsIGNoYW5nZSwgYW5kIEkg
ZG9uJ3QgY3VycmVudGx5IGhhdmUNCj4gc3VmZmljaWVudCBiYW5kd2lkdGggdG8gaW1wbGVtZW50
IGFuZCB2YWxpZGF0ZSBpdCBpbiBhZGRpdGlvbiB0byB0aGUgdmlydGlvLWJsaw0KPiBpbmxpbmUg
ZW5jcnlwdGlvbiB3b3JrLg0KPiANCkkgZG9u4oCZdCB0aGluayBpdCBpcyBzaWduaWZpY2FudCB0
cmFuc3BvcnQgbGV2ZWwgY2hhbmdlLg0KSXQgaXMganVzdCBhbiBhZGRpdGlvbmFsIFZRIGxpa2Ug
Q1ZRIHRvIGJlIGF2YWlsYWJsZSBvcHRpb25hbGx5Lg0KDQo+IEkgYXBwcmVjaWF0ZSB5b3VyIHN1
cHBvcnQgZm9yIGtlZXBpbmcgdGhlIHNvbHV0aW9uIHRyYW5zcG9ydC1pbmRlcGVuZGVudC4NCg0K
YWRtaW4gY29tbWFuZHMgYW5kIEFRIGlzIHRyYW5zcG9ydCBpbmRlcGVuZGVudC4gUGxlYXNlIGV4
cGxvcmUgdGhlIG9wdGlvbmFsIG5ldyByZWdpc3RlcnMgdG8gZXhwb3NlLg0KSSB3aWxsIGFsc28g
ZXhwbG9yZSB0aGlzIGVhcmx5IG5leHQgd2VlayBvZiBpdCBvZiB3aGF0IGNoYW5nZXMgbmVlZGVk
Lg0K
