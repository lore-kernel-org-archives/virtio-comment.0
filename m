Return-Path: <virtio-comment-return-8514-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0CC61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 03:46:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C37312AEDE
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 03:46:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A42B398689F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 03:46:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8628B98413A; Wed, 22 Nov 2023 03:46:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DFD6986892
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 03:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFZcT5toHCnyDJcliZYnADOU1D+WcrcYRN+KxDtPeHFxsT9Z+YKj1NJcxH+91DlowMFeqZ3otQX4/uv3bjbuT06pTzJIKK1AwjdgJBblG0dB4pxDOY2kLgNatEp7mGCV6D6MnDtTv4T+0ZOxoSx5nTZfdGSS/hZGLLA5adp3DD6JnAVZW1KjFalto4PGpaQC0TsVX3oP8ZFEh37d95s2X9gxKbWLhpzYOLYjz1VfPEKiEM/dvtT9In1YT9mbfO7JpoYQ6l1jVGOd5EMPfrLwq0iJhwawNenD1fwNb3/zWuiNyZH+G40GmANpk3DOYhj0WV5igFgW9fM9OmIvMOMDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIfjpESWFMd8vdm0Ak9Fi7e247lyafxGsDpU16UUiSs=;
 b=i9jQrPViZEHPwIbNzhlAGzJ5ApngiEWjimfNmoi0qQZvuTdOw6uZGbrv/LyfYIBXeuvTSkjbNSz9z4gg+Nrt43iWQ53XkZ+wVYhvR2ZtO6auhQ89esZU71O6oRds0RwRgHZBwbgtVWxRHlvNfvqzdQv7Lqu/lKeoCKcO3IlpP89I5Pdpi25W5syj4nwgNe+PdWY/eIp6sJL39aHSeWoTXAFmVTQWKAfoWx/3U2di/Q5L3/oqLWex5N92IAC28XdPZONwTaWj6jz/hHlb0GNJk5yHgO00zreGBonGifrI2PeR9Rncov9QvE0kX0Hh6eKWK5FH6JPcZn6EXJlxP8i7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+CAAAy2AIAAAzkwgAAMKgCAAA13IIAABX6AgAACmVCABcrCgIAApljQgABhVACAAHDekA==
Date: Wed, 22 Nov 2023 03:46:41 +0000
Message-ID:
 <PH0PR12MB5481660D3DC8EA45BFD7AAA3DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
 <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231121155805-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231121155805-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6998:EE_
x-ms-office365-filtering-correlation-id: dd5c8889-fe97-4b8f-50a5-08dbeb0da37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lwSzSr4cPhiuJRZ4n+W0NR3bMzpfuMMHQh9NIJMbd7EZA/DbGAq/rXawfbQ/kWudjJz7mt2yVXa7v63N3XzISkuWTIcLXlUD7olnb0BUHpVgQ3ONAIcpQrv6k04lGlThX/iB5rl75nH6T9pLzU7LBehw0a6tqCU/q3KD1x5A0A2j7Y1AR6VnNKHzQhHVoI6LREBw7RgJIy3R0hrMgpA+gxcMhFEYiENEGOG4aGMEj6vDkjqVHneP1jQAsWyXFxvLPYzet7Tw81yyo9Hy6CUiRVROLgASpZgyX0/wyGLMPQvncWWIfa0SwyRe9MEqdkWGjoWvRMX/U8ZnwvvX2kPpaTgeApcd25D7OwrfRZRPXvjsNzkjpZmpST0FHobqSmJCqzdnGRKm1vvB5F1U5sPxFWUuzSvrALn7pw8AITmfJpMxP1R9bjIUPX/zbYixeIq02ZLSnFa9OFd6EPoCtBPwfpddZoEY/nkxUNgY6SUupUR8HS+dA9dDFMEjJRbYMP3HDtWaGzHBkwlABSMZ+MP31W4YE5VV4zRxipI++qkRcB2uFBT+4lpgrLpwGFuk+gdjC/8q4RUdR1lUkbDi7EB7hVWIDBa6bBZB0TgiKws9ex7OEgNYvPk6x4fMQxtyCY6p
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(2906002)(4744005)(26005)(4326008)(478600001)(38100700002)(8676002)(8936002)(52536014)(41300700001)(5660300002)(6506007)(76116006)(54906003)(7696005)(316002)(66946007)(66556008)(71200400001)(6916009)(64756008)(66476007)(9686003)(66446008)(122000001)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzBiQ0xtaDZqeEduSmx4cWYxQ1FUTDNyQ3gwRUg3RnZjU25nSzZDUTZEbjRH?=
 =?utf-8?B?QzBvb29tZG1TclUvenhNVlB4L3gwR0h2YUlNZlpoTnpoWTU2SXV6Y1BYNzZx?=
 =?utf-8?B?VEliRy9SdkVPS1QwbzVvZklmWjlaam9sdjh5OHlUa1hmUFprdDNNQzdjTVYz?=
 =?utf-8?B?eTRUWS9qQXNpeUFZTHlJUkFlWDlXZ1hLeDYwWmEzcU5lUDhKZnhXbUNBWk5K?=
 =?utf-8?B?enlKWVVmRW9Td2RZUDh5SWY2d25kWFEvV3F6M1lYcVcwSi84ZzZNM0lSOW5r?=
 =?utf-8?B?QjM1MnZ4QXh5WXJUSnNVZ3FCc2pCd3hSR0IzL2s5RlhFVXZEVFc5MkdzTzNS?=
 =?utf-8?B?RlRSSkVsWXhINUFkY2p5dmV3dXJNSzhxZlduVUtYeC8vQ2R4MUtJelRLT1Zo?=
 =?utf-8?B?VFkyWStycG9nVUpNeWE4ajZoRDR1RWs4NS9PZWVKcVpMREVaem5ETXVVMzFq?=
 =?utf-8?B?K0tHSmZyRHRtZjkrL2pBdkJVUlpKTGY5SzEvOWI5dXhrU3hEOEQrMi9pcmJ3?=
 =?utf-8?B?a2JXdTN4STVOR2U0ZTlWQnRWL2NvY01HU0dLTk53U3Y2elhKaUxSZk5QdjBB?=
 =?utf-8?B?bkNOK3lBcy9sK3BWL0s2bXRsa1lORmVySThzVHoyN2VzeUNpN3lLcnRhZU5Y?=
 =?utf-8?B?YkwvNHRjL1hoOWhFdWZUZHBXaElVRG9qRDZzTVlOTmFaMTRPd0t6Tlc3Q3Ni?=
 =?utf-8?B?cTkveDBJak5ybC8zc0diNTAzaHB6NkptOEJXRy9HN0taNHFvZW9kd1ZIOXIr?=
 =?utf-8?B?OHF6WHpKOVJKWnNDNnh3MlJDQVhPN0JsMjhsRG9zNktjTHVCd0gvRXpoZVZt?=
 =?utf-8?B?aVBxcHVNK2hQU2pPVzF3V1pObU5rL25qUDZUc25teFFOelNOSWFVMDBpUkhG?=
 =?utf-8?B?Q25YdVAwWFlXTmROUko3dVpYRlJTYTJKcnN0Z0xFbTVFbWFDdVB2WmZxZnE5?=
 =?utf-8?B?dFpPbU5Nek83Qnl1bmcvekJZeDd2eEE4RGlLNWRRYmU0WWh5UzVJazcvMUlH?=
 =?utf-8?B?NFJHOUYxQVF5ZVVaNmVCdUNWNW5BYlowczlTaEc0c2VYTDR4eWxnVnNIbFdN?=
 =?utf-8?B?MjIrMjhTOWdLS1hnQW0xRUlhblRTZXNpeGdFWjRvQU0wNHU0WWlLdE1oUHFT?=
 =?utf-8?B?SWo5UnhkZjkxQURna2JJMmlLOFJ3djcwM3h4V2FGZjFKbmpUeWlESUF4MkJs?=
 =?utf-8?B?dVpUWjZhZ29QTFlMbHlUZmhnTzVUS2xkODdoeFNobXl4dE16cFIzanRTbVF1?=
 =?utf-8?B?eGFxdUEzbTZSQzV6Y1FMOHUvZ0p0ZFNsenhaQ1c5d3c4ZFl0WDR2MnVRc0xv?=
 =?utf-8?B?WDJmR1pYbWxsTDViY0JweWZuQ3dSc2RXeHJzTUxQMXdhdFd2YTRITHAxNHFs?=
 =?utf-8?B?VWVZUXJYejBwekNFenhORU9HQ0p2Wm1vOTRiejNidkdNY0Mrd2RRK2NwT09W?=
 =?utf-8?B?WHpKdmVrNTZMcVpWTHhGVjdzS0xQL21uUk5nS0habndBMThSL3F4NjJrdmlE?=
 =?utf-8?B?TzFFdzlPRzdnREIvWTFzMHE1UUlpT0Z2MzkvTzRlMVk3Qm83ZXFtK0pqNjdI?=
 =?utf-8?B?VTNCdXdndWtVdTVuczIzblA4N1VjeGx1T1c5bDdyUUMweEI0cFJEWEJSbnFW?=
 =?utf-8?B?MjFNVmYrRnZMVDV6ajVDeGhWUjlRVDUzdnJoeTRkc044dGNFK0k3U3poYWo0?=
 =?utf-8?B?bzgwWWQzYVdrSVhCVk5oL3JvRkpqeE1SSjU1K1Y4S1I2NFM2N0dRVEF5MHpp?=
 =?utf-8?B?T2FvaitkNk5uS3p0eGlFOGo1dnJsNFl5Ny81Rm1XclJLcnNjdWloYTNvV1Uz?=
 =?utf-8?B?WDA1U2NhUERCK3VETlZGT1JDOEE5bHBVS3BqYmpRa3h4RnpwWXREVXVHUVpG?=
 =?utf-8?B?Q1E2MXRuU25oaHprR2VNckYxVEJsOHR3c1lseUFabFdmTTVscnVrV2hKeTVa?=
 =?utf-8?B?d3d6VlZCMURKbTM2QlJ2aE9qWG81aWQxQUVmR05xVTM2QXhzODJId1ljV0cz?=
 =?utf-8?B?RWpmdjlLU21CelBBYVpsWmJvV2tWcDBScXpJbDhmblFBNWZWSTZBbFQyVWps?=
 =?utf-8?B?aHU1VWR1UTRKZFpkR2FFSVR0WEdNNDhCVGtCc3hZVXBwdnE2ajg2ZmZiSlQ4?=
 =?utf-8?Q?Y9Ok=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5c8889-fe97-4b8f-50a5-08dbeb0da37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 03:46:41.2677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvq0ECy46hjpP57nys7kfwDlrT8+Cu0GrepNEkdeLiFxA5Hyq9/gIOxkTkhds3q2hj4LBnOCrdx/3sf2ZuMVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBOb3ZlbWJlciAyMiwgMjAyMyAyOjMxIEFNDQo+IA0KPiBPbiBUdWUsIE5vdiAy
MSwgMjAyMyBhdCAwNDoyOTozNlBNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gQmFz
aWMgdGVzdCB3aXRoIGlwZXJmIGlzIG5vdCB3b3JraW5nLiBDcmFzaGluZyBpdC4NCj4gPiBBbGwg
b2YgdGhpcyBpcyBjb21wbGV0ZSB1bnJlbGF0ZWQgZGlzY3Vzc2lvbiB0byB0aGlzIHNlcmllcyB0
byBzbG93IGRvd24gdGhlDQo+IHdvcmsuDQo+ID4gSSBkb27igJl0IHNlZSBhbnkgdmFsdWUuDQo+
ID4gTWljaGFlbCBhc2tlZCB0byBkbyB0aGUgdGVzdCwgd2UgZGlkLCBpdCBkb2VzIG5vdCB3b3Jr
LiBGdW5jdGlvbmFsbHkgYnJva2VuDQo+IGNvZGUgaGFzIG5vIGNvbXBhcmlzb24uDQo+IA0KPiBJ
dCdzIHVuZm9ydHVuYXRlIGl0J3MgdW5zdGFibGUgZm9yIHlvdSwgaWYgeW91IGNvdWxkIHNob3cg
cGVyZiBjb21wYXJpc29uIHRoYXQNCj4gd291bGQgYmUgYSBzdHJvbmcgYXJndW1lbnQgZm9yIHlv
dXIgY2FzZS4gUmVwb3J0aW5nIExpbnV4L3FlbXUgZmFpbHVyZXMgdG8NCj4gdmlydGlvIFRDIGlz
IG5vdCBnb2luZyB0byBoZWxwIHlvdSB0aG91Z2gsIHdyb25nIGZvcnVtLg0KDQpBcyBJIGV4cGxh
aW5lZCwgdGhlIGJhc2ljIHJlcXVpcmVtZW50cyBhcmUgbm90IG1ldCBoZW5jZSwgdGhlIGNvbXBh
cmlzb24gaXMgbm90IGFwcGxpY2FibGUuDQpUaGVyZSBpcyBubyBwb2ludCBpbiBkaXNjdXNzaW5n
IHNwZWNpZmljIE9TIGltcGxlbWVudGF0aW9uIGFueXdheS4gWW91IGFza2VkIHRvIHJlbW92ZSB2
ZmlvIGNpdGF0aW9ucyBoZW5jZSB3ZSByZW1vdmUgb3RoZXIgY2l0YXRpb25zIGFzIHdlbGwuDQoN
ClRoYW5rcy4NCg==

