Return-Path: <virtio-comment-return-8073-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766BCC4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:02:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AEBB126A31
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:02:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98CE1986BAC
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:02:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8493D981235; Wed,  1 Nov 2023 03:02:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 748A1986BAA
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 03:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzLv4+Eor+NO2vtT8gyxMpn3mU9bUV+7BFW7spPhOJmpnHezT72Tyoc6cz2jHJeUR1s1dWWZX5FRfedPpcVD8vO+o3WNSlDMdUDy+17GlG8dBhOy8rm8nLhpJNF2i5TJnJv9GTtYQJ6auerRvushr+pYZsOwkloD5HAKfW1pylUuHymyfGJ61VudS8wbnc2rK6y/T+VWKL2LO06eVQiYvaBcYX2BulPOGcB9TCSTQCzCBXKVPODPS+0sOypoyIMjQoBnn1cP++q3EscSo2r6XzciGpRACPxNQw2tucJpfZHAcEv25ZmRKOFHKIvGg5ysQmiwGYUF1MQFgrz/izwliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgfmrO9x2PBbK20h66fIuK6KdjAuvY+xuYaRTGy8G0k=;
 b=T6294PZGdVPtjTUi+LFKQvKE5j97un8Uae53JwYDV0O9LIrgQjWEczWKKYruJm0apgK9bSEfexoQykZraQ2aSNkSN916Iparx/3mYD5+IadnvMtOEHPJzrKDE6PyeJ8afY5cclfxGOroBWhW1EzN8aJFV0GfmvEP5rmXPophczP+/p1t9bqjAWClPkHwATWs9cMrQtnQVslEKyKF50EPo73aArp7oawBTXVWd6K3AkvOwXVROq6Hmng5hbIZp0JNjTiGuSMuzxLQB7PGur4y2zpfkGvv+hpScy42e3DLNFhsTffwoCBXUpq2EKsJXY7/fVXiDN0HmGLFEoqip5eGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index: AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfA
Date: Wed, 1 Nov 2023 03:02:22 +0000
Message-ID:
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
 <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
In-Reply-To:
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DS0PR12MB7825:EE_
x-ms-office365-filtering-correlation-id: ccea69f1-0223-47ca-6dad-08dbda86f7f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ElgbsVvaarpQ7eJz4lIjUt23s1mCealNS3R6aaujiXceXxYPYOpYPKhVW7t2M6eK8qWduXmK0FSSh7R5tADvjPaVZzIp/9nf2UxAVlJk2vXFje+euSrZC0oCU704UGPiwUV3sbLj3exG6o8ARcjV9IywulCscAZyqODz14MHP+Tac32GZ2hI4lELCEaIJpuhew2s/TzdLnrAVAlVO5iY8gbaaQFTDOBkTasA6ffNIqtCFj9u5IKa6Fd8FmFlN7begpbmTD1T4QYrod2ab0RWXQNz6w01FiAo8DkZPQdEig5XH0tSLLpsA5BGrVbLDjd1uClF2bvkqzwiXs6WQD503FKVLHPX0lm3DX9NI/EIB3mc6ML8L8c9ofFaWyQK4Q+tsmcv+3aCDFsG518YztNkTndsN6JdKTmxrDEluebeeuM3Roosat7pz+z4SBAiOLWcVSHzjwSPQYcVzb9gAGRVj4BkeSZk+XG17LrVPBrHaCRljVSNXTPHo7M0FXLgZ3MZrLyJ0QZqFmLHM16lfX1FIIuv7TYXPrLRuzl4ML/LiYmVWo+Kq3NlXJiH7TkJxKWpNCBxz55VL1irlAY/YFwLxi0zNd3fPaEf/BCUgsc5v2NFK6r951Tl3v2cI8lVkFsv0uMqPEcDQDW++LVl8QQn+xbp5W/oQvv/duVZ5gZsFoM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(6506007)(7696005)(53546011)(55016003)(122000001)(38070700009)(9686003)(38100700002)(33656002)(86362001)(83380400001)(5660300002)(66556008)(76116006)(64756008)(66476007)(54906003)(66946007)(66446008)(52536014)(8936002)(8676002)(4326008)(6916009)(41300700001)(316002)(71200400001)(966005)(478600001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHlLU2pMVWpDbXUzc0NQemsvL1Zuc052a1dtaVZPOVltVS96K0svMFdjam53?=
 =?utf-8?B?MVQ2NURnWElyY0xzdFVMcGNxSmlZVUtnVmhzMUpEb0tDZXZwSkYzdGRxZlYr?=
 =?utf-8?B?T0E1bFZDSkZKWnE1MHdwRWw0QTBkVEY3MEhnalpVQlNpenpVamJhSUNTdER6?=
 =?utf-8?B?aTFnWjU1Sm80TkNXbjMzV2pZdFQ4NHg3bDJSR1A0UjNMcWdNaGsvSldkZUVv?=
 =?utf-8?B?U0NpeE1HNEVoUlJaamoxcjhMWEorRWt0YmdIT3NyY2MwaUltQ213ckNCeERR?=
 =?utf-8?B?WXpLV2JYL08rRWEzdTlSSDJxcjhTVUx2UkYvUmw5amJIVVp1R21tTzIyWHp5?=
 =?utf-8?B?aFhNcFdUMEJKUWYvdXhKV2NoS2xId3dDRDlUYmlqS2VXTDM3VTlzZGNyWGIv?=
 =?utf-8?B?YzZvbTNZLy9tMmlVMXZzeEgrMmhjR3RtaU5vYjk5UUx2U1J1b2s4OGNBOEpr?=
 =?utf-8?B?ZTR6MzVGbUxRNDhEVnBkZUZoUis5MldQRDVPbnkySm9mVks5dHBjaXZrbi8w?=
 =?utf-8?B?eGVFVmJSREVPRjBJWnNRRUFGRkJHalIzT29YRTFrWlhlckdqUDMxODNxcDd3?=
 =?utf-8?B?YmtNdFR2Tndqd0JMSjAzeWFjZ21xc2JMRjR4ektHdWE0QTYxV1JvekZFOGgx?=
 =?utf-8?B?Q1ZTMUpvS1B5TW1rSk5qU3JBaFJxcXRWRjBYZHVUN0FHZE9PWnkzQzdPODlt?=
 =?utf-8?B?T1NhcnRjUnNFcEFMUmhPU016YkVKN2dadlFWOTdJV0trem0rTzgrQm8vWlIy?=
 =?utf-8?B?R3E0ZkxneXVnbUVKdGRmQ3Nzc1U2aDJUcjNDd3hRWHYyRFduUVpLSXJHS3NB?=
 =?utf-8?B?VUJ2c1ZsTy9wemZhUkxKdHc5REdDVXN5eFYrRy95bzM5ZGFmQ3VUTVFyOWlE?=
 =?utf-8?B?L3BzT2VuV0hUR0lFTnlidXNmc3NoeDZuZHdPa3JuaDVNV2ZjNlBuZVdjQjZv?=
 =?utf-8?B?L3VBbzFsMWdtRVNSUTF3M1E0UHJYOFhJVWlvSVR3Z25rdU5ZTm1uQzBudGlo?=
 =?utf-8?B?WUZCUHVMQWU3SEdBTUZMRTNyUVlmVFNTMWhZcDIwWmZWTGJLR2krRzdLQ0U5?=
 =?utf-8?B?NzhFVjZxa0t5QXFub25ibStVeEUwZklac1dwTkhRUmhyUGkyeURVdWorNUNO?=
 =?utf-8?B?SDZFU1ZqWUE1MkFJV1krcktudkg5UTU1R0R6VGRSRU1vOVNjNDlleExZMjFZ?=
 =?utf-8?B?ZCtCNlRHSHhWN2lmQWZWK0Ryck1FaVhocXlSaExrRm1KemJHa01ZazB2QVdG?=
 =?utf-8?B?eHl0WEhvQTZickJ3Ym9NdnppMW1MKzBvT1pHN01KM01sL3J0b2U3RGpBaEQ2?=
 =?utf-8?B?T0FPYVd3L0dMai81Z2VsbUpEN3RnYkZyMm9BSGhaSGt5d0FhazREeThYQkVi?=
 =?utf-8?B?SkpLZmlucFZQdER2ZUxOTVZPbTY2YTljUUVKZGxHYTAxbDhGL3FOR3BaUkN3?=
 =?utf-8?B?OFdjU25hSGxaaGtNNzJhYjVHOEF6TXh2VXpLb3d5R2JoUWtXMHFXR2o1WXlq?=
 =?utf-8?B?TSs5bWEvR0V5NExweXdkSjFIZCtCbnlvN2VUVGNRVTVpMHR5QTZpekhLV2la?=
 =?utf-8?B?SWY1SVY0MTl3czBKZ0FPR2Mxb3QzRTh5L0JYTHVhem03cktjYmF3MTlMamRI?=
 =?utf-8?B?Z1VlRWhtcU9pUzJyaWczdW1UWFozRHlMTDJObW1PMDdBQzUzOUg4ZkRYOTNC?=
 =?utf-8?B?Qk84Sy9sZlFSVG5IZ1lXTmpKdGdQbmFOalVsbmNUdVNmQ2FoSVp4Nys0a25k?=
 =?utf-8?B?RGROc0dKRSt3MnJibHJkS3NQN2NVazJKcm9wcjErTmdxY2dHVUhBek1tOTBh?=
 =?utf-8?B?aThQY1FuZHN0a3cwc09TSmtYT09NcU5USW9Ua29hVTAzZ1hkcEtHVGhHdWdG?=
 =?utf-8?B?QUwvWlYxNEt0L1o5YmJCS0Zvd1JWajJ2NUVoUUhhYS9kMW1nVGxyNSswaDA0?=
 =?utf-8?B?SU9Hcms5dVVoSFpSWUxjQ0Y2T2d1Vjg4WmVhcENQaXluQkhIV2NNak1OS0h5?=
 =?utf-8?B?M2lDWXBzWXl3VWlXZ3krRTZRRW9ZcG9iWVVVajJoS0NZSHBuVmxQWFFDS1Rm?=
 =?utf-8?B?NE9IMXNHVDh3L3NFZTRObUVaWTlUeW55K2Nzc21YUGZtYTl4UFVqdmY5cTh4?=
 =?utf-8?Q?Kb+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccea69f1-0223-47ca-6dad-08dbda86f7f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 03:02:22.2842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9c9U4NJtRFCIyhZMS4u7iLOeWrojMJ2oFRgRDGjxGcSaUeoORlKN/7aD4UrSvTh2OutLx5gAuUqhWtkDgPpUWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBOb3ZlbWJlciAxLCAyMDIzIDY6MDAgQU0NCj4gDQo+IE9uIFR1ZSwgT2N0IDMxLCAy
MDIzIGF0IDExOjI34oCvQU0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToN
Cj4gPg0KPiA+DQo+ID4NCj4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5j
b20+DQo+ID4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDMxLCAyMDIzIDc6MTMgQU0NCj4gPiA+
DQo+ID4gPiBPbiBNb24sIE9jdCAzMCwgMjAyMyBhdCA5OjIx4oCvUE0gUGFyYXYgUGFuZGl0IDxw
YXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gRHVyaW5nIGEgZGV2aWNl
IG1pZ3JhdGlvbiBmbG93ICh0eXBpY2FsbHkgaW4gYSBwcmVjb3B5IHBoYXNlIG9mDQo+ID4gPiA+
IHRoZSBsaXZlIG1pZ3JhdGlvbiksIGEgZGV2aWNlIG1heSB3cml0ZSB0byB0aGUgZ3Vlc3QgbWVt
b3J5LiBTb21lDQo+ID4gPiA+IGlvbW11L2h5cGVydmlzb3IgbWF5IG5vdCBiZSBhYmxlIHRvIHRy
YWNrIHRoZXNlIHdyaXR0ZW4gcGFnZXMuDQo+ID4gPiA+IFRoZXNlIHBhZ2VzIHRvIGJlIG1pZ3Jh
dGVkIGZyb20gc291cmNlIHRvIGRlc3RpbmF0aW9uIGh5cGVydmlzb3IuDQo+ID4gPiA+DQo+ID4g
PiA+IEEgZGV2aWNlIHdoaWNoIHdyaXRlcyB0byB0aGVzZSBwYWdlcywgcHJvdmlkZXMgdGhlIHBh
Z2UgYWRkcmVzcw0KPiA+ID4gPiByZWNvcmQgb2YgdGhlIHRvIHRoZSBvd25lciBkZXZpY2UuIFRo
ZSBvd25lciBkZXZpY2Ugc3RhcnRzIHdyaXRlDQo+ID4gPiA+IHJlY29yZGluZyBmb3IgdGhlIGRl
dmljZSBhbmQgcXVlcmllcyBhbGwgdGhlIHBhZ2UgYWRkcmVzc2VzDQo+ID4gPiA+IHdyaXR0ZW4g
YnkgdGhlIGRldmljZS4NCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNv
bS9vYXNpcy10Y3MvdmlydGlvLXNwZWMvaXNzdWVzLzE3Ng0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFNhdGFuYW5kYSBCdXJsYSA8c2J1cmxhQG1hcnZlbGwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gY2hhbmdlbG9nOg0KPiA+ID4gPiB2MS0+djI6DQo+ID4gPiA+IC0gYWRkcmVzc2VkIGNvbW1l
bnRzIGZyb20gTWljaGFlbA0KPiA+ID4gPiAtIHJlcGxhY2VkIGlvdmEgd2l0aCBwaHlzaWNhbCBh
ZGRyZXNzDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgYWRtaW4tY21kcy1kZXZpY2UtbWlncmF0aW9u
LnRleCB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FkbWluLWNtZHMtZGV2
aWNlLW1pZ3JhdGlvbi50ZXgNCj4gPiA+ID4gYi9hZG1pbi1jbWRzLWRldmljZS1taWdyYXRpb24u
dGV4IGluZGV4IGVkOTExZTQuLjJlMzJmMmMgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2FkbWluLWNt
ZHMtZGV2aWNlLW1pZ3JhdGlvbi50ZXgNCj4gPiA+ID4gKysrIGIvYWRtaW4tY21kcy1kZXZpY2Ut
bWlncmF0aW9uLnRleA0KPiA+ID4gPiBAQCAtOTUsNiArOTUsMjEgQEAgXHN1YnN1YnNlY3Rpb257
RGV2aWNlDQo+ID4gPiA+IE1pZ3JhdGlvbn1cbGFiZWx7c2VjOkJhc2ljIEZhY2lsaXRpZXMgb2Yg
YSBWaXJ0aW8gRGV2aWNlIC8gIFRoZQ0KPiA+ID4gPiBvd25lciBkcml2ZXIgY2FuIGRpc2NhcmQg
YW55IHBhcnRpYWxseSByZWFkIG9yIHdyaXR0ZW4gZGV2aWNlDQo+ID4gPiA+IGNvbnRleHQgd2hl
biAgYW55IG9mIHRoZSBkZXZpY2UgbWlncmF0aW9uIGZsb3cNCj4gPiA+IHNob3VsZCBiZSBhYm9y
dGVkLg0KPiA+ID4gPg0KPiA+ID4gPiArRHVyaW5nIHRoZSBkZXZpY2UgbWlncmF0aW9uIGZsb3cs
IGEgcGFzc3Rocm91Z2ggZGV2aWNlIG1heSB3cml0ZQ0KPiA+ID4gPiArZGF0YSB0byB0aGUgZ3Vl
c3QgdmlydHVhbCBtYWNoaW5lJ3MgbWVtb3J5LCBhIHNvdXJjZSBoeXBlcnZpc29yDQo+ID4gPiA+
ICtuZWVkcyB0byBrZWVwIHRyYWNrIG9mIHRoZXNlIHdyaXR0ZW4gbWVtb3J5IHRvIG1pZ3JhdGUg
c3VjaA0KPiA+ID4gPiArbWVtb3J5IHRvIGRlc3RpbmF0aW9uDQo+ID4gPiBoeXBlcnZpc29yLg0K
PiA+ID4gPiArU29tZSBzeXN0ZW1zIG1heSBub3QgYmUgYWJsZSB0byBrZWVwIHRyYWNrIG9mIHN1
Y2ggbWVtb3J5IHdyaXRlDQo+ID4gPiA+ICthZGRyZXNzZXMgYXQgaHlwZXJ2aXNvciBsZXZlbC4g
SW4gc3VjaCBhIHNjZW5hcmlvLCBhIGRldmljZQ0KPiA+ID4gPiArcmVjb3JkcyBhbmQgcmVwb3J0
cyB0aGVzZSB3cml0dGVuIG1lbW9yeSBhZGRyZXNzZXMgdG8gdGhlIG93bmVyDQo+ID4gPiA+ICtk
ZXZpY2UuIFRoZSBvd25lciBkcml2ZXIgZW5hYmxlcyB3cml0ZSByZWNvcmRpbmcgZm9yIG9uZSBv
ciBtb3JlDQo+ID4gPiA+ICtwaHlzaWNhbCBhZGRyZXNzIHJhbmdlcyBwZXIgZGV2aWNlIGR1cmlu
ZyBkZXZpY2UgbWlncmF0aW9uIGZsb3cuDQo+ID4gPiA+ICtUaGUgb3duZXIgZHJpdmVyIHBlcmlv
ZGljYWxseSBxdWVyaWVzIHRoZXNlIHdyaXR0ZW4gcGh5c2ljYWwgYWRkcmVzcw0KPiByZWNvcmRz
IGZyb20gdGhlIGRldmljZS4NCj4gPiA+DQo+ID4gPiBJIHdvbmRlciBob3cgUEEgd29ya3MgaW4g
dGhpcyBjYXNlLiBEZXZpY2UgdXNlcyB1bnRyYW5zbGF0ZWQNCj4gPiA+IHJlcXVlc3RzIHNvIGl0
IGNhbiBvbmx5IHNlZSBJT1ZBLiBXZSBjYW4ndCBtYW5kYXRlIEFUUyBhbnlob3cuDQo+ID4gTWlj
aGFlbCBzdWdnZXN0ZWQgdG8ga2VlcCB0aGUgbGFuZ3VhZ2UgdW5pZm9ybSBhcyBQQSBhcyB0aGlz
IGlzIHVsdGltYXRlbHkNCj4gd2hhdCB0aGUgZ3Vlc3QgZHJpdmVyIGlzIHN1cHBseWluZyBkdXJp
bmcgdnEgY3JlYXRpb24gYW5kIGluIHBvc3RpbmcgYnVmZmVycyBhcw0KPiBwaHlzaWNhbCBhZGRy
ZXNzLg0KPiANCj4gVGhpcyBzZWVtcyB0byBuZWVkIHNvbWUgd29yay4gQW5kLCBjYW4geW91IHNo
b3cgbWUgaG93IGl0IGNhbiB3b3JrPw0KPiANCj4gMSkgZS5nIGlmIEdBVyBpcyA0OCBiaXQsIGlz
IHRoZSBoeXBlcnZpc29yIGV4cGVjdGVkIHRvIGRvIGEgYmlzZWN0aW9uIG9mIHRoZSB3aG9sZQ0K
PiByYW5nZT8NCj4gMikgZG9lcyB0aGUgZGV2aWNlIG5lZWQgdG8gcmVzZXJ2ZSBzdWZmaWNpZW50
IGludGVybmFsIHJlc291cmNlcyBmb3IgbG9nZ2luZyB0aGUNCj4gZGlydHkgcGFnZSBhbmQgd2h5
IChub3QpPw0KTm8gd2hlbiBkaXJ0eSBwYWdlIGxvZ2dpbmcgc3RhcnRzLCBvbmx5IGF0IHRoYXQg
dGltZSwgZGV2aWNlIHdpbGwgcmVzZXJ2ZSBlbm91Z2ggcmVzb3VyY2VzLg0KDQo+IDMpIERNQSBp
cyBwYXJ0IG9mIHRoZSB0cmFuc3BvcnQsIGl0J3MgbmF0dXJhbCB0byBkbyBsb2dnaW5nIHRoZXJl
LCB3aHkgZHVwbGljYXRlDQo+IGVmZm9ydHMgaW4gdGhlIHZpcnRpbyBsYXllcj8gDQpIZSBoZSwg
eW91IGhhdmUgZnVubnkgY29tbWVudC4NCldoZW4gYW4gYWJzdHJhY3QgZmFjaWxpdHkgaXMgYWRk
ZWQgdG8gdmlydGlvIHlvdSBzYXkgdG8gZG8gaW4gdHJhbnNwb3J0Lg0KV2hlbiBvbmUgZG9lcyBz
b21ldGhpbmcgaW4gdHJhbnNwb3J0LCB5b3Ugc2F5LCB0aGlzIGlzIHRyYW5zcG9ydCBzcGVjaWZp
YywgZG8gc29tZSBnZW5lcmljLg0KDQpIZXJlIHRoZSBkZXZpY2UgaXMgYmVpbmcgdHJhY2tlZCBp
cyB2aXJ0aW8gZGV2aWNlLg0KUENJLVNJRyBoYXMgdG9sZCBhbHJlYWR5IHRoYXQgUENJTSBpbnRl
cmZhY2UgaXMgb3V0c2lkZSB0aGUgc2NvcGUgb2YgaXQuDQpIZW5jZSwgdGhpcyBpcyBkb25lIGlu
IHZpcnRpbyBsYXllciBoZXJlIGluIGFic3RyYWN0IHdheS4NCg0KPiBJIGNhbid0IHNlZSBob3cg
aXQgY2FuIGNvbXBldGUgd2l0aCB0aGUgZnVuY3Rpb25hbGl0eQ0KPiB0aGF0IGlzIHByb3ZpZGVk
IGJ5IHRoZSBwbGF0Zm9ybS4gQW5kIHdoYXQncyBtb3JlLCB3ZSBjYW4ndCBhc3N1bWUgdmlydGlv
IGlzIHRoZQ0KPiBvbmx5IGRldmljZSB0aGF0IGlzIHVzZWQgYnkgdGhlIGd1ZXN0Lg0KPiANCllv
dSByYWlzZWQgdGhpcyBiZWZvcmUgYW5kIGl0IHdhcyBhbnN3ZXJlZC4NCk5vdCBhbGwgcGxhdGZv
cm0gc3VwcG9ydCBkaXJ0eSBwYWdlIHRyYWNraW5nIGVmZmVjdGl2ZWx5Lg0KVGhpcyBpcyBvcHRp
b25hbCBmYWNpbGl0eSB0aGF0IHNwZWVkIHVwIHRoZSBtaWdyYXRpb24gZG93biB0aW1lIHNpZ25p
ZmljYW50bHkuDQpTbyB1bnRpbCBwbGF0Zm9ybSBzdXBwb3J0cyBpdCwgaXQgaXMgc3VwcG9ydGVk
IGJ5IHZpcnRpby4NCg0KPiBUaGFua3MNCg0K

