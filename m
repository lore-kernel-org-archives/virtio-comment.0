Return-Path: <virtio-comment-return-7663-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63357CD6E5A
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:54:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A4C747E2A9
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:54:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89A0798680A
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:54:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 756CC986602; Wed, 11 Oct 2023 10:54:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 661BD986603
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 10:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMvZOYVpGs9ebrNDsFYYzKkbtNOHjAe+TCbLMg5xtWTYP2pRMPz0O6LMPu83k3IQtTjuGf4NuTduwo4FarrIMqj2gi4I1Qny5O/VyI7QF3jy475jR3NS2gQZ2TxhUJRMLdTGDr2PhjuniyrMmPm068yEnVfzC+o/chpWW7N5QtHjud/Kr2pWP+RFaoJZEe4Ye3HBSaooMckEsBCeSBfq/kK/ALjmVU7PkNi0pWIkgpt8s9x+yiLiWSCkKvvSdVcLNQBcCqZnBKwiwXXlZBQUZ8vA5S6xHSD/n8yzluJRlpTSnOSAvAitUv8IFzcZwvsQDVqdAiU3FB+zlv9iKO3zRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBAGXDb9oeRYXtal2ncHW9GKAskZOvIeCbbVncdv3SA=;
 b=i3nZ+HNXMrAplOxBiMIZkvbR4cJPscmz+V9uuE+Hj+xpzelNDxNDraAb5FtmgNlohrLUCSjOguMRb/R3gDv1Y3XgpALspFFfHAY57pnRpHi9e3cZOVwGif97A2CLN3jx70hWfY8Y5gTyhOlbyQTRQ21i+cYIy13Upr4zCJTqZAN1o5/IiAyOQ6qq/BbRaH9EcXaA4UIQp3hPPeZiqd+cW17F73JP4SK9nVmpe+38VdMzvLfXxFG4Y+VaZehy7KGWUgJk+7+OPdRO94esR+Iutk1+lrKIwVL4m7fZUOaJeyAr1BgFQo4Ho9IFLlDLp9gee648qn0CmOa7HGVqubxO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKA
Date: Wed, 11 Oct 2023 10:54:39 +0000
Message-ID:
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
In-Reply-To: <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8972:EE_
x-ms-office365-filtering-correlation-id: 5f4d0a1e-b46b-4176-2568-08dbca487772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M57JWWbeGHWDXB3aMm/C5Hls7JAH4WX0ybcWXMMfX77V+LOfsUvieO7WSRwUkdnzEhO1+Abj+S7sQqo6Yy5mg/FXigtv4tSU+12lrIAORHLcdSYDcVnVFTrHIAsA4VpI+/L5xpe3cKxim34N6M8P8a0P4tCnvAkd0HwY2k+jj6MeOeW5EZgpbDypX0M8KeZZA8uMcVxibCQPcFuYTHb3KZyghprz+HHIzBrGhCdyhqEpNsunrJ+r1TtDlfoRgm1nEgCNh8V+eTIWRObeMQ8AAeasJMbLDAN2ZewvGjal6xf+XwJKkzaRf1DX+f6V8Pgm1wcjbgRI4KtdDRt33SVBf4j8IQxmd0FO2XzimQqCRZwzLHN2UsLHsq1PW9ZffFZGZ4r2rIkaivmxQeBVKxh/dKmjlxZyy8NlGQFAfnGk0TMPnIC9/hiXKlikHDPmHRrHFbBfjdPqCQubbwqOl/9rWwO1yu6oNv4tUbj+SIPvoVubb/fkQDfIApKwMaWzGMy3tl2HAiOyHSm3Fb1ykUyiG/SKJDyCM9loSAEAODWupiqZPy4W1k1JO/BJHquESE0uAwD88VCerv02CPxKm4BOu/yaAN2TQUGGoL+3UAwHqZWVREiM0WWYqFD67XVZp7iA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(107886003)(110136005)(55016003)(64756008)(478600001)(5660300002)(71200400001)(7696005)(86362001)(9686003)(6506007)(38070700005)(66556008)(41300700001)(38100700002)(66476007)(66446008)(316002)(76116006)(54906003)(66946007)(8676002)(2906002)(4326008)(8936002)(52536014)(122000001)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TCtuaUhnWmhuRVdnU21aRTdtczVOZFdSSUdqMy9uMWlxenBsb1NRcURmUDdp?=
 =?utf-8?B?a0R0dlR2WHMrdVBlTU9HTWNsNVVvUU8zWTR4cnNaMDBoRlF1cE5SNDgvdTVj?=
 =?utf-8?B?T2wrOTBQZTVxZzdyUWYxYXRkYklpcEdlb0pIdXZOdCs3OWkrYTdSL0x5a1dm?=
 =?utf-8?B?SXA1OWxQdUxCQlhsMjV6M21kbFlYQXR3b0oyT1gvYmlXeFhQUEplaG9QU1dv?=
 =?utf-8?B?emJnQzk5Z2IvRFBJNFpFNUdMeVdpaGl1emJhWE9iRTJWQzdtYVpBSXJUSnlv?=
 =?utf-8?B?cll1SEE4UU9BcFF1SWdBT3F6d1FnZ2tEL2FSc3Z5d0JoMEtodlcvc0R3U05E?=
 =?utf-8?B?VXBJUVZMWVo1QzQ1S1luZFFCSkNhVFkvbnRIV1VRQkYxTWoxaGswWXRBRVpQ?=
 =?utf-8?B?SU5oR1ErM3Z3VnlJSHN6Y3Q1N0JydGc3VlF5VnFDN1RUaDZuaUlRL2FOSE1B?=
 =?utf-8?B?Y1VLdjdzQVFqa3JvV2pjRVUrWGtOZXp3R09xYkJ6KzkrbkFSczl1bnlSb25C?=
 =?utf-8?B?NWVISlNSM3l4T1BBUWpnaWx5WTBKWVA3cjU2MGVuYS9aYTk4ZFQrSGVSNFJl?=
 =?utf-8?B?RkMvNm9YcDNycEFaVUp2ZElsTmdDUDd5RS9VZmNBMHBRM0tYdnlVY1FDam5o?=
 =?utf-8?B?Z3VjNzFZdjYvWWU4ek4wRDdqd3lpaWlFQ05wMy9NWE91VzBsUUdKbXdJdGd6?=
 =?utf-8?B?QnZxdGpzMVpVdnp4OHI2QUxwb3lmNW5NYmJjbXhycGNJV1FoRk8rSk9PNnQv?=
 =?utf-8?B?M3VKNVFVYjNzQnJuNW5sSmxuZ2JrSTJiMkM5V3Fkem1uV1FtVnFYUU9rbUZK?=
 =?utf-8?B?dGRodktmbzR5UmFzbzJxODIvOUpSQm1iWTN1T1I4aFlSOWZZalJPQi9vVzYy?=
 =?utf-8?B?V0RFSUdjMG1sZEdiaTFsVzhWemMwODZEY0R6dlFEcEluTEdrQ2xNUngwZ0xw?=
 =?utf-8?B?MXJuRzk1eWFidlZhVkw3RFVMeFV3c09GcjBCbFdsbjBzQ3NEK21aeUljMTdP?=
 =?utf-8?B?bW8wSmJDMVhSR1NrSGsxV0tzRi96RWhlNmdHNnI4UEdsWmIwNm1mS3k1dEUy?=
 =?utf-8?B?NlVOdkdXN1E5YSswVUdON2ZwU2JxeTVtaElQWnREa0VCNzdzM3F6MmIrSndI?=
 =?utf-8?B?YytFQVdsckhQRUxTaVRaa2tuUkZRemEvbXkvYUgwYUtLOHFJSUJ5ODBSWTFI?=
 =?utf-8?B?SEdlY01RM1hvaDdFK2pGdVh5NTVIcGZXcEx1dlB0NG0wZi9lMjB0cjVSa2tl?=
 =?utf-8?B?T2hRZ3VKMWNWZjNFLzFSaGN1Z3dyVitrOU9SRHkrdEJLbHBzdmZ1RW5TR3U1?=
 =?utf-8?B?UE5ZU2hoQitTbVRMNU4rU2hETENsdmFPNzNXSUh5clVVZVc3NklJVnZ2WHhW?=
 =?utf-8?B?TVdHeW1MTFVpaDdBNFhnU3JYZklrVkl1RngxczJ3OUYzVFZoMzNGcWVxc0E0?=
 =?utf-8?B?ZVl3V1NrVkl3TVpLMlA1bTJZc3R2REVHNUM5S1FGdG1tRWNGUVVWRk01bHdy?=
 =?utf-8?B?L1VjZDVVZDJWVnUxV3hkbUdCQTBZUWJBbXdydHVSeEJlRUhDWGM5Q2FuRURz?=
 =?utf-8?B?THZCbVJENUNrUXpRUmVDVmNleDNPa2NQZDNXZTBHb1ZKZlk3dnU4OWlpakw5?=
 =?utf-8?B?bDJUa2NheFl5b0crOXM0c2tlbWdoek1NOG9zQkFvUXRtYjJuVTRSam5NNENY?=
 =?utf-8?B?VTZtMTRBOTkxZlBKdjdTYXdJR2lVVjcxN0ZDVnBGa2o5VllTTnNGNnkvNG9t?=
 =?utf-8?B?c1RDdGNGNGxrUmVEV0M3WDZPNFBBSkxpT3NMU2xFb2FNSmpJdjN2UWJoa2VY?=
 =?utf-8?B?Uk9xYmdTUDRmRVJFQlR1a3NJcnNPUXZPZWEvbkNOaVMzWUFUZnhjSVZ6Zzkw?=
 =?utf-8?B?eXovdFdEdHcwcUVYVEQwblJld3FIOXFkWkNqZHYxbjJnQVJSZURvdmVWUElN?=
 =?utf-8?B?SWlCbWFZL2dhV0ZmcThqdEkxQjF4alRZK3pWeWkyV2hEdTkzYnNicVZGV3JX?=
 =?utf-8?B?NS9JYnpyQngzODhMaE5WWVlzSDQyVGJXQ2Y2d3dqZzBoUllXd1k0UDY4SUJQ?=
 =?utf-8?B?c2RWWVMvWWljdXlKWGVDQWVqaWtYaFNpRlN6YnU2Ti9BYTdjY1U3YVJDaUt1?=
 =?utf-8?Q?1o0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4d0a1e-b46b-4176-2568-08dbca487772
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 10:54:39.3388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r81ajCAQTQJmMonV3pG3q9PD1uh1AImLbzdVNl+l+XtgPaOCDO3YsH+rtXEwmqWYJeNgAhPMLgL+cAppt/fUTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgT2N0b2JlciAxMSwgMjAyMyAzOjM4IFBNDQo+IA0KDQo+ID4+IFRoZSBzeXN0
ZW0gYWRtaW4gY2FuIGNob29zZSBvbmx5IHBhc3N0aHJvdWdoIHNvbWUgb2YgdGhlIGRldmljZXMg
Zm9yDQo+ID4+IG5lc3RlZCBndWVzdHMsIHNvIHBhc3N0aHJvdWdoIHRoZSBQRiB0byBMMSBndWVz
dCBpcyBub3QgYSBnb29kIGlkZWEsDQo+ID4+IGJlY2F1c2UgdGhlcmUgY2FuIGJlIG1hbnkgZGV2
aWNlcyBzdGlsbCB3b3JrIGZvciB0aGUgaG9zdCBvciBMMS4NCj4gPiBQb3NzaWJsZS4gT25lIHNp
emUgZG9lcyBub3QgZml0IGFsbC4NCj4gPiBXaGF0IEkgZXhwcmVzc2VkIGlzIG1vc3QgY29tbW9u
IHNjZW5hcmlvcyB0aGF0IHVzZXIgY2FyZSBhYm91dC4NCj4gZG9uJ3QgYmxvY2sgZXhpc3Rpbmcg
dXNlY2FzZXMsIGRvbid0IGJyZWFrIHRoZSB1c2Vyc3BhY2UsIG5lc3RlZCBpcyBjb21tb24uDQpO
b3RoaW5nIGlzIGJyb2tlbiBhcyB2aXJ0aW8gc3BlYyBkbyBub3QgaGF2ZSBhbnkgc2luZ2xlIGNv
bnN0cnVjdCB0byBzdXBwb3J0IG1pZ3JhdGlvbi4NCklmIG5lc3RlZCBpcyBjb21tb24sIGNhbiB5
b3Ugc2hhcmUgdGhlIHBlcmZvcm1hbmNlIG51bWJlciB3aXRoIHJlYWwgdmlydGlvIGRldmljZSB3
aXRoL3dpdGhvdXQgMiBsZXZlbCBuZXN0aW5nPw0KSSBmcmFua2x5IGRvbuKAmXQga25vdyBob3cg
dGhleSBsb29rIGxpa2UuDQoNCj4gPg0KPiA+Pj4gSW4gc2Vjb25kIHVzZSBjYXNlLCB3aGVyZSBv
bmUgd2FudCB0byBiaW5kIG9ubHkgb25lIG1lbWJlciBkZXZpY2UgdG8NCj4gPj4+IG9uZSBWTSwg
SSB0aGluayBzYW1lIHBsdW1iaW5nIGNhbiBiZSBleHRlbmRlZCB0byBoYXZlIGFub3RoZXIgVkYs
IHRvDQo+ID4+PiB0YWtlDQo+ID4+IHRoZSByb2xlIG9mIG1pZ3JhdGlvbiBkZXZpY2UgaW5zdGVh
ZCBvZiBvd25lciBkZXZpY2UuDQo+ID4+PiBJIGRvbuKAmXQgc2VlIGEgZ29vZCB3YXkgdG8gcGFz
c3Rocm91Z2ggYW5kIGFsc28gZG8gaW4tYmFuZCBtaWdyYXRpb24NCj4gPj4+IHdpdGhvdXQNCj4g
Pj4gbG90IG9mIGRldmljZSBzcGVjaWZpYyB0cmFwIGFuZCBlbXVsYXRpb24uDQo+ID4+PiBJIGFs
c28gZG9u4oCZdCBrbm93IHRoZSBjcHUgcGVyZm9ybWFuY2UgbnVtYmVycyB3aXRoIDMgbGV2ZWxz
IG9mDQo+ID4+PiBuZXN0ZWQgcGFnZQ0KPiA+PiB0YWJsZSB0cmFuc2xhdGlvbiB3aGljaCB0byBt
eSB1bmRlcnN0YW5kaW5nIGNhbm5vdCBiZSBhY2NlbGVyYXRlZCBieQ0KPiA+PiB0aGUgY3VycmVu
dCBjcHUuDQo+ID4+IGhvc3RfUEEtPkwxX1FFTVVfVkEtPkwxX0d1ZXN0X1BBLT5MMV9RRU1VX1ZB
LT5MMl9HdWVzdF9QQSBhbmQgc28NCj4gb24sDQo+ID4+IHRoZXJlIGNhbiBiZSBwZXJmb3JtYW5j
ZSBvdmVyaGVhZCwgYnV0IGNhbiBiZSBkb25lLg0KPiA+Pg0KPiA+PiBTbyBhZG1pbiB2cSBtaWdy
YXRpb24gc3RpbGwgZG9uJ3Qgd29yayBmb3IgbmVzdGVkLCB0aGlzIGlzIHN1cmVseSBhIGJsb2Nr
ZXIuDQo+ID4gSW4gc3BlY2lmaWMgY2FzZSBvZiBtZW1iZXIgZGV2aWNlcyBhcmUgbG9jYXRlZCBh
dCBkaWZmZXJlbnQgbmVzdCBsZXZlbCwgaXQgZG9lcw0KPiBub3QuDQo+IHNvIHlvdSBnb3QgdGhl
IHBvaW50LCBzbyB0aGlzIHNlcmllcyBzaG91bGQgbm90IGJlIG1lcmdlZC4NCj4gPg0KPiA+IFdo
eSBwcmV2ZW50cyB5b3UgaGF2ZSBhIHBlZXIgVkYgZG8gdGhlIHJvbGUgb2YgbWlncmF0aW9uIGRy
aXZlcj8NCj4gPiBCYXNpY2FsbHksIHdoYXQgSSBhbSBwcm9wb3NpbmcgaXMsIGNvbm5lY3QgdHdv
IFZGcyB0byB0aGUgTDEgZ3Vlc3QuIE9uZSBWRiBpcw0KPiBtaWdyYXRpb24gZHJpdmVyLCBvbmUg
VkYgaXMgcGFzc3Rocm91Z2ggdG8gTDIgZ3Vlc3QuDQo+ID4gQW5kIHNhbWUgc2NoZW1lIHdvcmtz
Lg0KPiBBIHBlZXIgVkY/IEEgbWFuYWdlbWVudCBWRj8gc3RpbGwgYnJlYWsgdGhlIGV4aXN0aW5n
IHVzZWNhc2UuIGFuZCBob3cgZG8geW91DQo+IHRyYW5zZmVyIG93bmVyc2hpcCBvZiBMMiBWRiBm
cm9tIFBGIHRvIEwxIFZGPw0KDQpBIHBlZXIgbWFuYWdlbWVudCBWRiB3aGljaCBzZXJ2aWNlcyBh
ZG1pbiBjb21tYW5kIChsaWtlIFBGKS4NCk93bmVyc2hpcCBvZiBhZG1pbiBjb21tYW5kIGlzIGRl
bGVnYXRlZCB0byB0aGUgbWFuYWdlbWVudCBWRi4NCg0KPiA+DQo+ID4gT24gdGhlIG90aGVyIGhh
bmQsDQo+ID4gTWFueSBwYXJ0cyBvZiB0aGUgY3B1IHN1YnN5c3RlbSBzdWNoIGFzIFBNTCwgcGFn
ZSB0YWJsZXMgZG8gbm90IGhhdmUgTg0KPiBsZXZlbCBuZXN0aW5nIHN1cHBvcnQgZWl0aGVyLg0K
PiBwYWdlIHRhYmxlcyBjb3VsZCBiZSBlbXVsYXRlZCwgYXMgc2hvd2VkIHRvIHlvdSBiZWZvcmUs
IGp1c3QgUEEgdG8gVkEsIG5lc3RlZA0KPiBQQSB0byBuZXN0ZWQgVkENCj4gPiBUaGV5IGFsbCB3
b3JrIG9uIHRvcCBvZiBlbXVsYXRpb24gYW5kIHBheSB0aGUgcHJpY2UgZm9yIGVtdWxhdGlvbiB3
aGVuDQo+IG5lc3RpbmcgaXMgZG9uZS4NCj4gPiBNYXkgYmUgdGhhdCBpcyB0aGUgZmlyc3QgdmVy
c2lvbiBmb3IgdmlydGlvIHRvby4NCj4gdGhlcmUgYXJlIHBlcmZvcm1hbmNlIG92ZXJoZWFkLCBi
dXQgY2FuIGJlIGRvbmUuDQo+ID4NCj4gPiBJIGZyYW5rbHkgZmVlbCB0aGF0IG5lc3Rpbmcgc3Vw
cG9ydCByZXF1aXJlcyBpbmR1c3RyeSBsZXZlbCBlY28gc3lzdGVtIHN1cHBvcnQNCj4gbm90IGp1
c3QgaW4gdmlydGlvLg0KPiA+IFZpcnRpbyBhdHRlbXB0aW5nIHRvIGZvY3VzIG9uIG5lc3RlZCBh
bmQgaGF2aW5nIG5lYXJseSBzYW1lIGxldmVsDQo+IHBlcmZvcm1hbmNlIGFzIGJhcmUgbWV0YWwg
c2VlbXMgZmFyZmV0Y2hlZC4NCj4gPiBNYXliZSBJIGFtIHdyb25nLCBhcyB3ZSBoYXZlIG5vdCBz
ZWVuIHN1Y2ggaGlnaCBwZXJmIG5lc3RlZCBlbnYgZXZlbiB3aXRoDQo+IHN3IGJhc2VkIGRldmlj
ZS4NCj4gPg0KPiA+IFdoYXQgY2FuIGJlIHBvc3NpYmx5IGRvbmUgaXMsDQo+ID4gMS4gV2hhdCBh
ZG1pbiBjb21tYW5kcyBhcmUgdXNlZnVsIGZyb20gdGhpcyBzZXJpZXMgdGhhdCBjYW4gYmUgdXNl
ZnVsIGZvcg0KPiBuZXN0aW5nPw0KPiA+IDIuIFdoYXQgYWRtaW4gY29tbWFuZHMgZnJvbSBjdXJy
ZW50IHNlcmllcyBuZWVkcyBleHRlbnNpb24gZm9yIG5lc3Rpbmc/DQo+ID4gMy4gV2hhdCBhZG1p
biBjb21tYW5kcyBkbyBub3Qgd29yayBhdCBhbGwgZm9yIG5lc3RpbmcsIGFuZCBoZW5jZSwgbmVl
ZCB0bw0KPiBoYXZlIG5ldyBjb21tYW5kcy4NCj4gPg0KPiA+IElmIHdlIGNhbiBmb2N1cyBvbiB0
aG9zZSwgbWF5YmUgd2UgY2FuIGZpbmQgY29tbW9uIGFwcHJvYWNoIHRoYXQgY2F0ZXIgdG8NCj4g
Ym90aCBjb21tYW5kcy4NCj4gdmlydGlvIHN1cHBvcnQgbmVzdGVkIG5vdywgZG9udCBsZXQgeW91
ciBhZG1pbiB2cSBMTSBicmVhayB0aGlzLg0KTmV3IHNwZWMgYWRkaXRpb24gaXMgbm90IGJyZWFr
aW5nIGV4aXN0aW5nIHZpcnRpbyBpbXBsZW1lbnRhdGlvbiBpbiBzdy4NCk5ldyBzcGVjIGFkZGl0
aW9ucyBvZiBvd25lciBhbmQgbWVtYmVyIGRldmljZXMgZG8gbm90IGFwcGx5IHRvIG5vbiBtZW1i
ZXIgYW5kIG5vbiBvd25lciBkZXZpY2VzLg0KDQo+ID4NCj4gPj4+IERvIHlvdSBrbm93IGhvdyBk
b2VzIGl0IHdvcmsgZm9yIEludGVsIHg4Nl82ND8NCj4gPj4+IENhbiBpdCBkbyA+IDIgbGV2ZWwg
b2YgbmVzdGVkIHBhZ2UgdGFibGVzPyBJZiBubywgd2hhdCBpcyB0aGUgcGVyZg0KPiA+Pj4gY2hh
cmFjdGVyaXN0aWNzDQo+ID4+IHRvIGV4cGVjdD8NCj4gPj4gb2YgY291cnNlIHRoYXQgY2FuIGJl
IGRvbmUsIFBhZ2UgdGFibGUgaXMgbm90IGEgcHJvYmxlbSwgdGhlcmUgYXJlDQo+ID4+IHNvZnQg
bW11IGVtdWxhdGlvbiBhbmQgdmlvbW11LCB0aHJvdWdoIHBlcmZvcm1hbmNlIG92ZXJoZWFkLg0K
PiA+IER1ZSB0byB0aGUgcGVyZm9ybWFuY2Ugb3ZlcmhlYWRzLCBJIHJlYWxseSBkb3VidCBhbnkg
Y2xvdWQgb3BlcmF0b3Igd291bGQNCj4gdXNlIHBhc3N0aHJvdWdoIHZpcnRpbyBkZXZpY2UgZm9y
IGFueSBzZW5zaWJsZSB3b3JrbG9hZC4NCj4gPiBCdXQgeW91IG1heSBrbm93IGFscmVhZHkgaG93
IG5lc3RlZCBwZXJmb3JtYW5jZSBsb29rcyBsaWtlIHRoYXQgbWF5IGJlDQo+IGFjY2VwdGFibGUg
dG8gdXNlcnMuDQo+IE1hbnkgdGVuYW50cyBydW4gdGhlaXIgbmVzdGVkIGNsdXN0ZXIuIERvbid0
IGJyZWFrIHRoaXMuDQpIb3cgbmV3IHNwZWMgYWRkaXRpb24gc3VjaCBhcyBjcnlwdG8gZGV2aWNl
IGFkZGl0aW9uIGJyb2tlIG5ldCBkZXZpY2U/DQpPciBob3cgbmV0IHZxIGludGVycnVwdCBtb2Rl
cmF0aW9uIGJyZWFrcyBleGlzdGluZyBzdz8NCkl0IGRvZXMgbm90Lg0KVGhleSBhcmUgZHJpdmVu
IHRocm91Z2ggdGhlaXIgb3duIGZlYXR1cmUgYml0cyBhbmQgYWRtaW4gY29tbWFuZCBjYXBhYmls
aXRpZXMuDQpJdCBkb2VzIG5vdCBicmVhayBhbnkgZXhpc3RpbmcgZGVwbG95bWVudHMuDQo=

