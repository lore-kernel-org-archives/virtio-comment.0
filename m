Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334223446C5
	for <virtio-comment@lists.linux.dev>; Wed,  9 Sep 2026 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924872; cv=fail; b=u3Dw3sC0UxMD7fj1UZhnavXi/k5tYXj9sa8R0mnfUdVsz5/TeoTzrosH7c9jGA3MItXQEjJWi9boE/mxzoXMfaUUAAFyTqfgK6W/2Sl/DaCc6iqFnUbf7E5BFCAO9CN4w6S2Z0cEfxS+Js/+apIP8m1DXICcKBft9AP9ET2B94k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924872; c=relaxed/simple;
	bh=GYJzfVKk2rysN6/8k/W+q46w+qeq4HBf7ZnJcX6iY5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qsto6hXvrVqngy5p/Tnsg14FJ/3QgW7p6lfUpYB1g34T7YRPppE/8c5B5mR5LLzWMHBCV67bS3b0dYjtE311pLJfABUa/Cx8JOuESO/D5GPgD+lAcBt+zvIznAhZHRsYUvdb2oMLFz8ZoDogXf68Y4vpUR1ee30y6CH/VpFAGao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NKme0OBW; arc=fail smtp.client-ip=40.93.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NKme0OBW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdWE3D+WVk31B6zRQgSrmwlsRm7CmySjRG0zKcipexxenFt2PTqnMlIcMBZqHoC8hZ/FUW3WmM5SEy6K3Lmw5l/Qd9UszkqlA4za2SyiW8PDkVwP7l9G1MnNCpvlc4RAQvz4iCM5wJbv8DqTVQf0mwoUPNV9wBcqwcaS/CamsK6kY+LIecOG6Vfmwsu5RD0A/z/5rrMBrBjFKyUOkERo6hCJdIHrE9gxlySdnP0la3MPbhFlzqqd8Iu46M/RzX9n9SiHfdnVnygRH3PR4KmkoQCfBcT5vB8itCXWv3zNQOpiun7H0+hNh474j/RyR29UBT18vFWNbSHfKvq+ksvMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYJzfVKk2rysN6/8k/W+q46w+qeq4HBf7ZnJcX6iY5w=;
 b=G0QGpmxHTW71sCvwkWmYfW8kxdzwsHC9sw/qr1NDZGcwdFjIAW70934ZlHZziGcSwO3Xh/ukPs30Cq9g9e7fx5biDq9Ph+JBS1/p90WDV7BVw5QCmObRESxuMxQjD1bud61cGJeY96fGfGS3cxxPBEBjWPPwXgPn0brlSt/EBlwux73n4wlwtnZIdDvVXdraFiUOMfLGI0j8FTI/43J2WQY4bbPUKWtxJufcBnSc7/SdT056ewIcxhHq0hsGYH4x3LtRtvod+NTJM2hFTd6XvjdqD1cTxlJmrzr8eptKH8qutqkoq48TRyTWqe/kYI46w2ysFofMErb68KvhnyKvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYJzfVKk2rysN6/8k/W+q46w+qeq4HBf7ZnJcX6iY5w=;
 b=NKme0OBW4Onjf84FhE9nVH+PauUgPr+xkgkgJSkqm6H6fyIt1oXdQvFP/8W96Hdbb5nl3gu0PclSIQd6RT9bBn9blJi04swR2rxssHJmlRcHaMnC3F+wXsjdM8jCfEHtSq4evTlTGakDsM2wLsQVsTRNPPazfwTqaaf1RxTaEBWXotJ1EAPyDLY+7f2T5h3X+p5/HZjdNCAvFrI7kmzPiRBDFCGP3xbM184zwyINUDA5Nyj1YomVYDd054tuPcuo/R3nBZE1aK/1e6d0RtxQ4B7dmOFxk7XPtGlZWkAJYlQqzUuPhR5dI6mRSOVTX2MzsPaSPMWQlN6ImCtAdKwEVA==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 03:34:26 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%2]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 03:34:25 +0000
From: Parav Pandit <parav@nvidia.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Thread-Topic: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Thread-Index: AQHdP3lcADyMRQg3EE2Ph3F8XSBQrLbEyp4AgAAa+2eAAJypgIAAFuQA
Date: Wed, 9 Sep 2026 03:34:25 +0000
Message-ID:
 <SJ0PR12MB6806E5F5BE02AC29440E8056DCB02@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com> <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
 <20260908123542-mutt-send-email-mst@kernel.org>
 <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
In-Reply-To: <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|DM4PR12MB6087:EE_
x-ms-office365-filtering-correlation-id: 19f9e327-ab04-4597-3e61-08df0e233f5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|3023799007|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 N9zeY+o8p9tlmtFYPREqUHIkVnp4mCsKHnJfo9bLAtFKl724vAPlCQ0GUHEmIoo6Jp6N30ItpSOlDfGNkv14JeqA1PzWQ34rCXypRbdzvY7GKbhKzyJTMUVsqB4lyvkzvrfXdQBQpHeChzDpZ37EB/n3fwxWqCGwNfxTPP4CD0huGM0OwK2t4WaGSL8uG9wgPr8hOoBWFqICWKddN1WHv3OJl7iA8lsWZf7CrtLyrUHccPZf1znmv1qVB60V7tzCtl5H/EqLZQTOaGiuNrbeHpaxOL5dSL32ReVuzE1YveX6Q8DH6K6uXZ6AslHy/acTKYnjE8ExCRnY91oVvAEtQ8Vb9qDb+KWqKwzqYU6+qTtLYWXmj+Qb6qtfcaIAn2m3a5HH4AXO+LV19ZIZOkr8Gx3AirvtwTgtNe8o/C4G4DsXIxSSpKxCJm7zYA4NJSaeK3XaxU0//rOg6gC3IUbkwxKqoCC3zDxrpQEDULuM3W2DoGgzbuzy5GoqRR0hEbMgIOpeZtUmxFakNMT7dkHGo2Z2i+xs0d1A+bqzzNE+SrhT9qqYO85qH/lii0z4wb3HKWhCtlaw82UPhEG/pn06oIiwNVa2q3OC/lnEUZgoL2d3lFMzSfmDyDQicn9yYyZDbgXoINi4cugFddKni795oiORqir8xPfQjuvG5TOtmnu3ZY6mDHw+e5kaZihdYVnmSM52MzJHrk60cQluEhsbaOaLinSs1w8pPL2710HUuVE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWN0SStjT2pISHlIc0xPUURLY01YRGFab29yNGFwdVhXVElFenRWSThyZlcw?=
 =?utf-8?B?S1hsREZNWVYweGsvWDJLUHFFbE5IdTdXOUFWQnlwTUtPYnJNd25YTWljYmdo?=
 =?utf-8?B?L09tbHN4SC9kMmsybE0xVElZMldzUWFlZlBrcXd0aG43Qm9BbGVSOUtUanMr?=
 =?utf-8?B?UEZsR1ZVejlIeUk1QmFRUmpvOFVyM2V1SmRWZ244U3JvR3BrNXBVYUZwbGR0?=
 =?utf-8?B?Q1JmTUl1U1piM3hZZ0Z6NHNyeGwybHhiYTVmcDhIb1plQ1BaSHBkbjdPQytF?=
 =?utf-8?B?TWxzVXYvSXRhaU9mOTdBYkhwUnFIK1U0NmxHWjdCNnFUYUZ0cFExTW55NHRi?=
 =?utf-8?B?bjE5cVBKVmlwYWZva0lDUGpHNDF0eXpEb1E0cUs5NWpGeHNEY0dmbVlvK3Jr?=
 =?utf-8?B?SFRUK1k0ODhacUNFT3FXdE5zR24reTNhelZvVU5mck10NzYrc1hsbVp0Q2Zx?=
 =?utf-8?B?Z05KbVBZU0Jrb3pvL0lKVmtZQnpDUTZzV2RKOTRPdjIxWVErdVJHaEozU2Vp?=
 =?utf-8?B?Qy9HWGlYWEpmc2cyL0NQZ0JidGMwbkVleHdSd3ZObFhhY2xZUFcyeDhsNjE2?=
 =?utf-8?B?ZDFxcy9aMHI1endPdUdSOHVPcmNQYm42cEJMYmFkb21QdFFYeGFlUWdza3Rp?=
 =?utf-8?B?U1RzVHlZVjJKWUIvKzNuUE1GZ1Nrc3pjaHJlWjFXNTU3Q0lqOUpxZ0lKZnlQ?=
 =?utf-8?B?TWQ1ZWhGUzR5L1ZydzVKWm1SNmoyVU1MRDl1VlpWK2lHL2ltRHRHcmVTdXdm?=
 =?utf-8?B?N3hYYkNIaCtZVE9EYUxhZjlVb2tLNnZsdEVBdVVRZXdVY05vSWRweGJ0ZmNo?=
 =?utf-8?B?R0NwZjVReVVxTW4vd1FnQ3RxeEhlUno5K0dEM3ltRk44TzNidjVlc2tPbkt1?=
 =?utf-8?B?RG10Q2NKZ2RjYWd5d0k2aldyZk5aSWV1YngzYy9HY2tFRUkrVHEyRVJnKzY3?=
 =?utf-8?B?SjR4cFpnK0xDVWdYLzQxWkNhMHVTbjdEaURyU0R6djZEMVRGSlVNS3RXTlAy?=
 =?utf-8?B?TlNqVnJCME9neldzREE4RGRmS0txZTR2UmRZZEdVak8zOVJXMVM2VGt6U1pY?=
 =?utf-8?B?Y2thblFzdTh3RGpuMlFtZTVFTWJsQ2YyWXhnMWVsMkxLdm13LzlmWWZFT20v?=
 =?utf-8?B?clJOVW5jdnY5QlBXMFZITm5WOFMyRFFSTEp3UVB3RGVLMXZXNGtxbE5qWmtX?=
 =?utf-8?B?NDBYRUh0NDc5UFlkdHJpTWdyQmk5bDJ5RzExcmZBQzBRTE1nanlqeUJ3TkRH?=
 =?utf-8?B?RE9jOWpOby9ScFNNVFB3WmFZWXRsMGdKam0waTMrbkNncXdvMkl4M2RwUlMz?=
 =?utf-8?B?WXdaSDFjejBLV2ZVdUNpTE5TRGFhN0VzUEVleGpqUzc4TkRldzhtTWJUd0xU?=
 =?utf-8?B?WDNnekJRYzEwSUVLUjkzWTBlaDRUc05pdnQvaTcvOEx1aDdSbXlqd1F0QkF1?=
 =?utf-8?B?cnpPNzdCcFdtNkNRUXhWMVpNSE9XeGVyVmNQQ3NkbVpsK2dhbm9XT0NnZGNy?=
 =?utf-8?B?eUc2bE9vNVZzNU9uWU8xTm1XUW5lL09kSkNIdmJsZ2g2QlQxZEZvV05LOWNw?=
 =?utf-8?B?c3A5R01HOWd5dmFkTVNYQ3ZRY0o1SjhPQTUwVjdxZk9pSndsUjRncSs0d3F0?=
 =?utf-8?B?VHdtSXpDTGRESjJTd0k1emE2RXd6QlE2VVZkaHdxQzl4UVlOK3B2WG90VVpv?=
 =?utf-8?B?OWdYVVRjUktrczVFOGY2WjN2QnU4OWlsclludWwzR2ZHeHhUMWZrOEJZQkph?=
 =?utf-8?B?WkdsNVlRRUJFK2dGejVCb1BUYVRoajJEOW1KMGdRVXJMNDF4K3BCeHYrdGxz?=
 =?utf-8?B?aUNQandqQzBuZ2JTQisvR3N6V05jcm9MY1hzZDgvWW56aUNQNzI4MzlTa0kr?=
 =?utf-8?B?bEFRSUVvTlU4THhrRmpEbm9ZNXZUR2NsR3NnSXZoL1JSK210VE9rZHhPbkRG?=
 =?utf-8?B?aXhuOHJTVHIxN25mQUJzVnJWcnBzc0s4cVFIZ3E1UzlnSmlJbXBWZ2xwdWZE?=
 =?utf-8?B?STdlT2x6d0FzclRwREhSU3o0MnhkK0FXZ1RyWVRrSk5YeHl5c2dhb0NNUkYy?=
 =?utf-8?B?THdiRndBYkxwQTJYN1h3VTlNb3hTVU5rVmd2SDBCTWlZRk9qVDM3cXFkYU9I?=
 =?utf-8?B?V2F1dExvUm1mMXVlMXdtSkpHeXViaVhRYU1CVXRobEhjcVI2Wm5mSVdkUGZq?=
 =?utf-8?B?a0VNTlI5RHd4OEY4TkkrMkFKdHlDTFFmbDBtcFlSQm53MFJqa3JScTZsc2w1?=
 =?utf-8?B?UDJMY1VQT25XTkVkNXBZUU1MbEZZUHcyYmJBQWMydlBoWTcySnRIVzJ1cFRS?=
 =?utf-8?Q?QbeLn/YbFNC2Qplz4R?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f9e327-ab04-4597-3e61-08df0e233f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 03:34:25.9250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrHvTA0MFh/G0JqNlBHvWW7y3bZ/uyx2siXC67L+Ha2iezXksmNklnpi/Kb5hEzO2LHcOUMIxZ8Pr2jBvjzrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087

DQoNCj4gRnJvbTogRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+DQo+
IFNlbnQ6IDA5IFNlcHRlbWJlciAyMDI2IDA3OjQyIEFNDQoNCg0KPiBPbiA5LzgvMjYgMTI6NDMs
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBUdWUsIFNlcCAwOCwgMjAyNiBhdCAw
NDo0Njo0MFBNICswMTAwLCBSaWNoYXJkIFcuTS4gSm9uZXMgd3JvdGU6DQo+ID4+IE9uIFR1ZSwg
U2VwIDA4LCAyMDI2IGF0IDExOjE0OjQ2QU0gLTA0MDAsIFN0ZWZhbiBIYWpub2N6aSB3cm90ZToN
Cj4gPj4+IE9uIFR1ZSwgU2VwIDA4LCAyMDI2IGF0IDEwOjQwOjUwQU0gKzAxMDAsIFJpY2hhcmQg
Vy5NLiBKb25lcyB3cm90ZToNCj4gPj4+PiArQWx0aG91Z2ggMjQ3IGJ5dGUgZGV2aWNlIElEIHN0
cmluZ3MgYXJlIGFsbG93ZWQsIHRoZXJlIG1heSBiZQ0KPiA+Pj4+ICtpbnRlcm9wZXJhYmlsaXR5
IHByb2JsZW1zIGlmIHN0cmluZ3MgbG9uZ2VyIHRoYW4gMTI4IGJ5dGVzIGFyZSB1c2VkLg0KPiA+
Pj4NCj4gPj4+IENhbiB5b3UgYmUgbW9yZSBzcGVjaWZpYz8gSXMgdGhlIGNvbmNlcm4gdGhhdCB0
aGUgZ3Vlc3Qgc29mdHdhcmUgc3RhY2sNCj4gPj4+IGFib3ZlIG9mIHRoZSBkcml2ZXIgbWF5IG5v
dCBiZSBwcmVwYXJlZCBmb3Igc2VyaWFsIHN0cmluZ3MgbG9uZ2VyIHRoYW4NCj4gPj4+IDEyOCBi
eXRlcz8NCj4gPj4NCj4gPj4gSSdsbCBhZGQgbW9yZSBkZXRhaWwgaW4gdGhlIG5leHQgdmVyc2lv
biwgYnV0IGluIGJyaWVmIHRoZSBwcm9ibGVtcw0KPiA+PiBhcmUgdHdvZm9sZDoNCj4gPj4NCj4g
Pj4gKDEpIFdpbmRvd3Mgc3VwcG9ydHMgdXAgdG8gMTI4ICJjaGFyYWN0ZXJzIiAodGhleSdyZSBu
b3QgcHJlY2lzZSBidXQNCj4gPj4gdGhleSBwcm9iYWJseSBtZWFuIFVuaWNvZGUgY29kZXBvaW50
cyBmcm9tIHRoZSBCYXNpYyBNdWx0aWxpbmd1YWwgUGxhbmUpOg0KPiA+Pg0KPiA+PiBodHRwczov
L2xlYXJuLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2RkaS9z
dG9ycG9ydC9ucy1zdG9ycG9ydC1zdG9yX3NlcmlhbF9udW1iZXINCj4gPj4NCj4gPj4gKDIpIFdo
ZW4gdWRldiB0cmllcyB0byBlbmNvZGUgYSB2ZXJ5IGxvbmcgc2VyaWFsIGludG8gYQ0KPiA+PiAv
ZGV2L2Rpc2svYnktaWQgcGF0aCB5b3UgZW5kIHVwIHVuY29tZm9ydGFibHkgY2xvc2UgdG8gTkFN
RV9NQVggKDI1NSkuDQo+ID4+DQo+ID4+Pj4gK0l0IGlzIGFsc28gYWR2aXNhYmxlIHRvIHVzZSBv
bmx5IDcgYml0IEFTQ0lJIGNoYXJhY3RlcnMuDQo+ID4+Pg0KPiA+Pj4gVmVyc3VzICJUaGUgZGV2
aWNlIElEIHN0cmluZyBpcyBhbiBBU0NJSSBzdHJpbmcgd2hpY2ggY2FuIGJlIHVwIHRvIDI0Nw0K
PiA+Pj4gYnl0ZXMgbG9uZyIgZWFybGllciBpbiB0aGlzIHBhdGNoLiBJcyBBU0NJSSBhICJTSE9V
TEQiIG9yIGEgIk1VU1QiPw0KPiA+Pg0KPiA+PiBJdCdzICJTSE9VTEQiLiAgSSBjYW4ndCBzZWUg
YW55IGdvb2QgY29taW5nIGZyb20gdHJ5aW5nIHRvIHVzZQ0KPiA+PiBhbnl0aGluZyBleGNlcHQg
bGV0dGVycywgbnVtYmVycyBhbmQgZGFzaGVzIGluIGEgc2VyaWFsLCBidXQgYm90aA0KPiA+PiBM
aW51eCBhbmQgV2luZG93cyAoc2VlIGFib3ZlKSBjb3VsZCBpbiB0aGVvcnkgaGFuZGxlIFVuaWNv
ZGUuDQo+ID4+DQo+ID4+IFJpY2guDQo+ID4NCj4gPg0KPiA+IExpbnV4IGFjdHVhbGx5IGhhcyBj
b2RlIHRvIHRyeSBhbmQgaGFuZGxlIHRoYXQuIHVuaWNvZGUNCj4gPiBpcyBhY3R1YWxseSB0aGUg
bGVzcyBwcm9ibGVtYXRpYyBwYXJ0IC0gYXNjaWkgaXMNCj4gPiBmdWxsIG9mIHBpdGZhbGxzLCBl
aXRoIHRoaW5ncyBsaWtlDQo+ID4gc2xhc2hlcyBhcmUgbXVjaCB3ZWlyZGVyIC0gZS5nLiB1ZGV2
IHdpbGwgY3JlYXRlDQo+ID4gYSBzdWJkaXJlY3Rvcnkgd2l0aCBzbGFzaGVzLiB3aGF0IHdpbGwg
d2luZG93cyBkbz8NCj4gPiBhbmQgd2hhdCB3aWxsIGl0IGRvIHdpdGggYmFja3NsYXNoZXM/IC9t
ZSBzaHJ1Z3MNCj4gDQo+IFdoYXQgYWJvdXQgLy4uLy4uLy4uLy4uLy4uLy4uLy4uLy4uLy4uPw0K
PiANCj4gSG9uZXN0bHksIHRoZSBzaW1wbGVzdCB3YXkgdG8gcHJvdGVjdCBhZ2FpbnN0IHByb2Js
ZW1zIGlzIHRvDQo+IGp1c3QgdXNlIGEgaGV4LWVuY29kZWQgb3IgYmFzZTMyLWVuY29kZWQgY3J5
cHRvZ3JhcGhpYyBoYXNoIGFzDQo+IHRoZSBuYW1lLg0KPiAtLQ0KQW55IGlzc3VlcyBpbiBqdXN0
IHVzaW5nIHRoZSBVVUlEIGZvcm1hdD8NCg0KPiBTaW5jZXJlbHksDQo+IERlbWkgTWFyaWUgT2Jl
bm91ciAoc2hlL2hlci9oZXJzKQ0K
