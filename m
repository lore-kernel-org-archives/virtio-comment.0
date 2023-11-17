Return-Path: <virtio-comment-return-8427-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA6BC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:59:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ECA0E181FEA
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:59:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFB84986E27
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:59:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5AFD986E1A; Fri, 17 Nov 2023 09:59:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7CB3986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUvtO0X5mZetCFSqqis0Sn6PPbFYlvMd/yCv0DassCxJQnip6DQsCaeDh7e2Z6QggByRyP+3eNNBH7Tmv08j4Dd2Q5F4yrH4QTVikjd360zStsLb+y5CyBbihrZXVdyYt87202kcroepMcZsUsMOk2okZr9WxTdZ9AB8cRExEazQ6/H0G2X2m7jHkCeDKSaexB92MEscN+WdEN41T4iOAqsb2RGG47+9+qVDaq2HVD8n48XEBI/H9mmCjmSDCx5VkT7lmpjcEtYbUUbMo5Sj0QN5g4TmKnEOTdDiAc3mfFPBtrw2WpdW5xG+YiBzi+M4wNRXILxsWjdSp237SN7CXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dghbsBVXYL9tIRe+SoDhgyC0nnzxD80oIg2NqqsCyXg=;
 b=AIFf5ZcbpYnhD+emJ86r1UqnoV6Pamfoe4JDFPt/CsaGn6Pd2yQICmG8/F11aQXrEKYtUT7evPZn1HOJVzhAxQd1LL+7GDn/6lcZ+e5CI1rCbDD50nKc+3MrpsE8qPPtHF6bW1GAsqtrHghyreihLv5Uwnrt03Ow3reWagtG177J0+747YdtPO3GQXTBv1BxKYp7plgPC9iHMGh1MD8a0it780vq/oR/UzaKjBonyYZahLz+wiFD7UU27FPGYDNLQV9kMk8tZHg9JXGmMUDtCQsYhkXP/3eOBp33zABLiKMxL1sM58n3a6fkDc8pOC0F1Wwwto2RVeKthEnyGudZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA98AgAABeBA=
Date: Fri, 17 Nov 2023 09:59:07 +0000
Message-ID:
 <PH0PR12MB54818900F3FADA4CFE435E9BDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e87db22-f24f-4f43-86e2-cdb5ef23acad@intel.com>
In-Reply-To: <8e87db22-f24f-4f43-86e2-cdb5ef23acad@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7545:EE_
x-ms-office365-filtering-correlation-id: 586dd1b9-df9b-4329-f8c4-08dbe753d71b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /UMW+OphmN8qezDN8jUY6zciDx9Si4xzXUwYr1iV4WMttYo7QzfionPkBN97yef+dSc1zxvDZiCFnvSe6vCK1nWx9KPXcwpzKu/j0qtxWqQT9F7mZ+P9O6MMH4fKOwuhVCrX0337A+KJZWeU1294F9bSN7v8OGBJVCPgvM6F/uDCgvUr5yNyPhTa3RMYsnEfkjgX0d5W2dNA9WcyLL5+d5pgJMtidEnmnbIRK/ODywLARZ6uPZCBZCfsDnTOOeRwHSKu4iu5pZzeh1MvC2Wf7RG24V8WHT3rHYs9sBQMAJxY5z0QgDXs/5N+g7YQ+CySP0Icyky0mQZcSJsJpRei0N6qsBLHIm/myo7A+2BaenRnUTeZMo8LJagOGPdq0gVvt5VRfrrP3s0bhTTr2Xwfsmg0FN2BN07CKaFHZw2yq45U+BjB5HyfJx87Nym2chkHpZSBkCRIgg0JiM4YwCdDzZyxgpoGaTUKb0e4evjCvJSfwl7gPuHgE7Mtzd7ukQi7yYzuiwxcYTRQB9eBW7JWhLb4TIdpW3+hBw7TK/ZQJEkJntu9prnR4cgVt37XXfIpA5z77MUVGXDo1wHHiVEpCWi90oyy64grcHxes9wkZcUs+/D53ijEoxf+EzUgc36B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(122000001)(2906002)(38100700002)(55016003)(86362001)(5660300002)(8936002)(52536014)(4326008)(8676002)(41300700001)(83380400001)(33656002)(9686003)(316002)(26005)(107886003)(64756008)(66946007)(66556008)(66446008)(110136005)(66476007)(76116006)(54906003)(55236004)(53546011)(71200400001)(7696005)(6506007)(478600001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clE4bEVSemZUaHE4d3JxUUlZK3JkdW1nbU5NNGFZRnRBK0ZSU2w0YWwzb3lS?=
 =?utf-8?B?MmRpUUZ5T1A3OWl0VnB6UFVhVkJKSndGblR3cGFCWmQ1eUN4OXAvQjlGUS80?=
 =?utf-8?B?Y2RyVnlXa2R4bE5mb3FYNnBwTUtuTVhKN00yOGcvaXBkK21zRGtWTk9YN0pu?=
 =?utf-8?B?UENoRjJwaEVyMkY5QkdIc1ZkYXhFSWhYekNQSWtMdmtIbGRnSGdJN00vaGhh?=
 =?utf-8?B?c2xYMzV0TkpSYkRVci8xOEdOSENpcGFOTkVYSytPZ0RBVGVvNTVrRHVHcVQr?=
 =?utf-8?B?VENTc1JibURueXhsaW05RXpNYTdMcEwzbEE2anFuU29heXVQZGczMHdtRlo5?=
 =?utf-8?B?aGx0bklpZkcrZFliandITmZhalY1WnRsSmVpWDNZV1NTWWt4Vy9FQ0ZHNVpy?=
 =?utf-8?B?QnBNaXh3cEUrczd6UUd2R2lyUk1Md1hQWVA0Y0dZMTBkeng4RXFOdU1ZLzlE?=
 =?utf-8?B?aTFrV2V0aW9YNk94K2JQTEpFbUI1dFZXQm54RzlEMGp4SmlxU2lCbktZcloy?=
 =?utf-8?B?MFpNUVVUMHdwbUcyR1ZRSzdpRXNURXRpT0kreXluTnZRV3Z3d3VJMFdXL3Yy?=
 =?utf-8?B?Yk1DRFdGcTBOQmtxOVdqUDZEb2l5Q0w0dXZGOE54L0x4MldJb1k3T0lqQzh2?=
 =?utf-8?B?Q1RGUVZ6TEpSOFZIL0l1L3IwcFROQ20rcTVjUUxQR29iSEtVVm9TL2cvS3Qy?=
 =?utf-8?B?R0xvV2tCZXM1bmJnLzQzM1Y4TjcwNUtOek4yb1dUMEdnTHM3cmJ4QXlINS9I?=
 =?utf-8?B?ZzRxTWd4NGM4VjY2UFBaR1pybGFod2ttOE9qQ1g3TDZZTmxoWTM0MEtoS1hm?=
 =?utf-8?B?dkpMWnFPc05YMnpDMFBQN1ZndHZHRVlJSXJDaEV6Y3ZvZ0E5TlIyUkRIWTVm?=
 =?utf-8?B?ZVFPeVhnbkZUUnRmQUZwKzdnK2lvUzlqVXBURFlOUEkvM1R6bzRvYTNna3Jx?=
 =?utf-8?B?ajNQZXpLbEg5Wjd6STdXOGJEcXFPTUQyK01NYmdkRDNJSTlLZmwvVEpLRDB2?=
 =?utf-8?B?RVZmVDFXKytCd3o1N3EvdHRzdU5sQVFwV2RpRmhreFVJREQyRW83eUFOUytJ?=
 =?utf-8?B?WmRMNjdSUDhFMzUrcHN3WUlFbHRhZHZuL3VkYlVVVWhXMitENThWdVd2eWcw?=
 =?utf-8?B?Ym1jVmhjcDdCcVd5N2JVMzMwcUUwZWMrMzdTaWFPS3J2RFFsZzQ1c2ZqVkVV?=
 =?utf-8?B?ZzNLQzJEM2N0bU0rWGNxVkkwa2w4WGdvNlEyTFE2TXVjVnZKT1dsTk12NWp3?=
 =?utf-8?B?OUNWZlh4V29TaE1mM0JYdDRQVTl2Z0UxbGoxNVIxckZRVys0OE5WQlQ1QzBI?=
 =?utf-8?B?YWNkLytEekx6SEd4U0JFeWQrR3Y5N1g3M0Yrek5Rd0VaUTJuNFp3S0tMeFFt?=
 =?utf-8?B?QW9ZNTN0VEFIdGJxdEJJYVV6a0lEZjJtNHZwR0Q2bWZVL2lqSG1OSVhHT091?=
 =?utf-8?B?R0hkT2pBQUV0U2NIT2Jxczc0YWVVYVcwcGpQazJ3eDFOaEUyZUhmTG1WTzdW?=
 =?utf-8?B?bzBnNG5ENGs3clNGd2NZRWp4V2ppd2xkV3hsNWJVYlo1TWFOZXNCRnUxeW1u?=
 =?utf-8?B?ZG16VU53UnA3UnJwU2RRL1Rvb2R1UGxiNUhVQ0ZhWnFTREREVGxPVlFrWWll?=
 =?utf-8?B?aDJlWHhuZ1V2QklhbXcrdkNWcW00K09wbG1yNVlGOHg3RHRGVzVBVzZCei96?=
 =?utf-8?B?OUFNUGFFMHAxTHNUeGhXbEZ2WkE4UXhSOVRDVmo1Z0pmQW1jayt6S21sTTFD?=
 =?utf-8?B?dW9CRzlWcnhtTFhTK0d6YXZwbEdQZ1VLSWR1bzZRSHNxblVsMUdNUFdHVXZC?=
 =?utf-8?B?T2l4a1FnTnV5MGwvMmFZYmtMTXNhTm5nelU5aWpzMmVnekVONVBlUG1rR0t0?=
 =?utf-8?B?WWxXWThWenNOM2JzcHNtS3RZdmlDSkp2MVUwRkxKQ2ExU0hWMllXZUxqQzlT?=
 =?utf-8?B?VFpZb2ZLV2FkcjRmTVJSYitRVy9TNExUdGVHZ0hCemxNenRnZ0RSMEc2VkQw?=
 =?utf-8?B?Tml0NVJGWEdIRmpPUGpza3pWR2svNTE3dW5ZUDluRkhRbWd6cmZkYnZWQkha?=
 =?utf-8?B?cmpQQkoxdFgvMjd1RUFKanQyMFNaZXM0Y0pNYVYvRVRGZjNLZSt5cGVGVGRS?=
 =?utf-8?Q?j/S8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586dd1b9-df9b-4329-f8c4-08dbe753d71b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:59:07.9917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnNSrZhzuWlt7TvJFdKh1U12CnTNvMBlF/WLZn/gDvfAwYH2uWWAx4Z+PMvh/QaKueCRqjAWX1FUBDA7mTqtqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogRnJpZGF5LCBOb3ZlbWJlciAxNywgMjAyMyAzOjIzIFBNDQo+IA0KPiANCj4gT24gMTEvMTcv
MjAyMyA1OjQxIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4NCj4gPj4gRnJvbTogTWljaGFl
bCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBOb3ZlbWJl
ciAxNywgMjAyMyAzOjA4IFBNDQo+ID4+DQo+ID4+IE9uIEZyaSwgTm92IDE3LCAyMDIzIGF0IDA5
OjE0OjIxQU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+DQo+ID4+Pj4gRnJvbTog
TWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPj4+PiBTZW50OiBGcmlkYXks
IE5vdmVtYmVyIDE3LCAyMDIzIDI6MTYgUE0gSW4gYW55IGNhc2UgeW91IGNhbiBzYWZlbHkNCj4g
Pj4+PiBhc3N1bWUgdGhhdCBtYW55IHVzZXJzIHdpbGwgaGF2ZSBtaWdyYXRpb24gdGhhdCB0YWtl
cyBzZWNvbmRzIGFuZA0KPiA+Pj4+IG1pbnV0ZXMuDQo+ID4+PiBTdHJhbmdlLCBidXQgb2suIEkg
ZG9uJ3Qgc2VlIGFueSBwcm9ibGVtIHdpdGggY3VycmVudCBtZXRob2QuDQo+ID4+PiA4TUIgaXMg
dXNlZCBmb3IgdmVyeSBsYXJnZSBWTSBvZiAxVEIgdGFrZXMgbWludXRlcy4gU2hvdWxkIGJlIGZp
bmUuDQo+ID4+IFRoZSBwcm9ibGVtIGlzIHNpbXBsZTogdmVuZG9ycyBzZWxsaW5nIGRldmljZXMg
aGF2ZSBubyBpZGVhIGhvdyBsYXJnZQ0KPiA+PiB0aGUgVk0gd2lsbCBiZS4gU28geW91IGhhdmUg
dG8gb3Zlci1wcm92aXNpb24gZm9yIHRoZSBtYXggVk0gc2l6ZS4NCj4gPj4gSWYgdGhlcmUgd2Fz
IGEgd2F5IHRvIGluc3RlYWQgYWxsb2NhdGUgdGhhdCBpbiBob3N0IG1lbW9yeSwgdGhhdA0KPiA+
PiB3b3VsZCBpbXByb3ZlIG9uIHRoaXMuDQo+ID4gTm90IHN1cmUgd2hhdCB0byBvdmVyIHByb3Zp
c2lvbiBmb3IgbWF4IFZNIHNpemUuDQo+ID4gVmVuZG9yIGRvZXMgbm90IGtub3cgaG93IG1hbnkg
dmNwdXMgd2lsbCBiZSBuZWVkZWQuIEl0IGlzIG5vIGRpZmZlcmVudA0KPiBwcm9ibGVtLg0KPiA+
DQo+ID4gV2hlbiB0aGUgVk0gbWlncmF0aW9uIGlzIHN0YXJ0ZWQsIHRoZSBpbmRpdmlkdWFsIHRy
YWNraW5nIHJhbmdlIGlzIHN1cHBsaWVkIGJ5DQo+IHRoZSBoeXBlcnZpc29yIHRvIGRldmljZS4N
Cj4gPiBEZXZpY2UgYWxsb2NhdGVzIG5lY2Vzc2FyeSBtZW1vcnkgb24gdGhpcyBpbnN0cnVjdGlv
bi4NCj4gPg0KPiA+IFdoZW4gdGhlIFZNIHdpdGggY2VydGFpbiBzaXplIGlzIHByb3Zpc2lvbmVk
LCB0aGUgbWVtYmVyIGRldmljZSBjYW4gYmUNCj4gcHJvdmlzaW9uZWQgZm9yIHRoZSBWTSBzaXpl
Lg0KPiA+IEFuZCBpZiBpdCBjYW5ub3QgYmUgcHJvdmlzaW9uZWQsIHBvc3NpYmx5IHRoaXMgbWF5
IG5vdCB0aGUgcmlnaHQgbWVtYmVyIGRldmljZQ0KPiB0byB1c2UgYXQgdGhhdCBwb2ludCBpbiB0
aW1lLg0KPiBJIHRoaW5rIE1pY2hhZWwgbWVhbnMgdGhlIGd1ZXN0IG1lbW9yeSBjYW4gYmUgbGFy
Z2UsIGFuZCB0aGUgZGV2aWNlIG1heSBETUENCj4gYW55d2hlcmUsIHNvIHRoZSBkZXZpY2Ugc2hv
dWxkIHByZXBhcmUgZm9yIHRoZSB3b3JzdCBjYXNlLCB0aGF0IGNvdWxkIGJlIFU2NA0KPiBzaXpl
IHdoaWNoIGNhbiBiZSBvdmVyLXByb3Zpc2lvbi4NCg0KTm8uIHRoYXQgaXMgbm90IHRydWUuIA0K
VGhlIGh5cGVydmlzb3Igc3VwcGxpZXMgdGhlIHJhbmdlIG9mIGFkZHJlc3NlcyBvbiB3aGljaCB0
byB0cmFjayB0aGUgZGlydHkgcGFnZXMuDQpTbyBmb3Igc3VyZSBpdCBpcyBub3QgdTY0Lg0KDQoN
Cg==

