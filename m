Return-Path: <virtio-comment-return-7544-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9311EEB563
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:47:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 416EC21689
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:47:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2AAD798640A
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 06:47:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1A229983DE3; Tue, 26 Sep 2023 06:47:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AE3198639D
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Sep 2023 06:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdlCIJm6KzMlwW+NWLU3QcE509L2eigeQ79LHK9lbnNtSA6VRduIyiiAHfJxdV1D0x5qWLEeMnf2OR3OtgW9+OWYRyAFaz8AeisHmApYaSBEc42SWwGVRaUfUNQY3FsXC2gwA1RYPApAxOJvXSy/qwsUIbxBnU/2V4pq+3bjppaRh3BNKP5UeO0iNEUojFpwsvrPMkcxTqPywJu1v/vCJYFdcLK8k2s62amawYmKhhDphDJ7k2kPvzfZHBOMy9zVfX7UMWhh2/uRdlF2sJM5kXWJJpHBpuRldwpjOukUjmchE8IGg6OslxW92dbfCziUQ+zz0d3CmsWC/jiPvuZfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovDVyk1j27vqn770IZ/h5x7dqNxnPmgmPucBc4JbAV4=;
 b=EhzX9yE9auT8W8qu23loFJT4+X7lYknyL6Q8MAyD0C3eHNPOUBCOvEDHm7wt56pt2/5Wjlg44sK5yhw0Ofbm+iVU81lqgTxeSkzZrJxImOLtYg06HfNSI1vVb5dsm7ou4jHls35Vyef/fyTpjYugoOcUSuqvx8uarDf6ZoctsaKPHCBXouIrBapMVaMIBCnwsm8gMBY4qqFGjoBIdvEvnGlIsnICuHfnmV6HA4UMbUIqvDLxQHo+T5oExpqzhPVXTUZ+QNTdLVQqnf/OUvWNwB1vDFX01nGgFCcpf8v9dp8mk/KE3SlPuucc5TafG7FL/NSzgbNbD2MnIxknuRDdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [PATCH v2 0/2] Support enabling virtqueue after DRIVER_OK
Thread-Index: AQHZ6laRh7FJTu9ta0CmYeB75GOXwLAstQaQ
Date: Tue, 26 Sep 2023 06:47:15 +0000
Message-ID:
 <PH0PR12MB54812F26EDD240E8C14A6C91DCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230918173518.15900-1-parav@nvidia.com>
In-Reply-To: <20230918173518.15900-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB5613:EE_
x-ms-office365-filtering-correlation-id: 10bc366e-23f1-42cb-8587-08dbbe5c6b6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MAWUTto0jymynxCqN11y1XBcl5KKkTiFhl+CamFJ3atAkmT2n2rfCgg8T8168ArX8EJfWEP7wosS6jbVq9jkup+t0rtePPds/llhV36ujn/sChWKWT0K67dFiqu8NhTsOPpRbxQ8bhfyoicv5ekC6PFl8HPrUftFM8aRxtubhFGNjS4Faaw9NHu5jet5sPS4cHbRPRA9qN9taJIQDqr8bD8z6P4Q5qRJ3bVNei47Ox59aoTIf0DJkQJrGIp0eOEsC0j0yN3JuOBfd2TTh+hZ9dhBtCFn20UPCEWRcRwcxuf6lZYW0i4zjpOCnASGKIRRBmJhza95eV3jN879wJWlHq3TrecBBrfy/wFRf0BViYunJPEFLvaMleN+BGkSNKxrMWza1x0e8hFbgKvnxK6qY69kBLYCpXJbTRAt+m9Ia9XiG/Ng4XYQFTWGZMipNi1vynp7At/JcejGvQJNKgPOeEc9bEJtvtoMqz0dRQ2oz/FT0iRawuuX4Po2Jja7kzC61voC1ASKYywOF1tAn8NgDlW87bGV6YH3sY33RhG29dZWaKHwVsy5JU5CwmNTNlF36gTEIk/AO0Bem5ZmF6Mdmq39+MIkiv1rDVpR920r7sM9tbk/s4pNjbHSMXZpGZHwsnAu/PONZ2FYlaD6yXlP84RazGe7Rhm9QZYs3rkkvsg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(33656002)(55016003)(41300700001)(83380400001)(71200400001)(86362001)(55236004)(6506007)(8936002)(4326008)(8676002)(38070700005)(52536014)(5660300002)(26005)(107886003)(9686003)(7696005)(38100700002)(110136005)(966005)(64756008)(122000001)(66476007)(66446008)(2906002)(66946007)(478600001)(54906003)(76116006)(66556008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OE5zeGFFS1NtM2NWaDdrWEZtTFR6WmxGMkFjNWRCOHlVelV5MGYyMCtpU1FS?=
 =?utf-8?B?clp5c21hODB2aGhHZ0xQT3IzVFRPc2RWZWVFUFF2UzJJN0gydXlzVTBudHZN?=
 =?utf-8?B?b25QMFozR2xzRGQ3ajNPYURLdTN5SkFmc0Z2QUIzUkVYdjNib2tCWUhzQnVB?=
 =?utf-8?B?VUc1RFpqcWRxRWQvdE5lNG9NbWp6TlpCMUw0Zzhpcm5YelV3b0RndVZPdExp?=
 =?utf-8?B?Yit6OSsrTURPTWtPWEJZWGFRZ2hzVGlaTkV1b2xSbUkvcW1JaTk4eWVGS085?=
 =?utf-8?B?Q0JWNFA4ZXJVampvZmUrNWhTMmN6RGVrMUhlUW5lcTNCSy9uRUx6UEw0OFB4?=
 =?utf-8?B?dFVocXZYa2ZwYTN3OFVTZEdGc1FIVVdjaFVWQnFvWmVZSUJocllnSXBJbWRF?=
 =?utf-8?B?Z2luaVJ3b2lVdklab05BQk9Kenp4di9oNUlBN2x6QVFpaFpvQ3psNFZYbnJK?=
 =?utf-8?B?aGdsY0prZm5ydlNoTFZ1bTdvc1JzM3F4K04xSHRiT09IVVQ5c29FMCtnOHEy?=
 =?utf-8?B?SEpZcnVua0VlbnhkZEt2T1NYMFBHcmlpZU1KRFFUOXpVQTl1dTF4cFM0Wm8z?=
 =?utf-8?B?S3pHTUhzc1dxVHdnS3BJNXZOYjA0eTZlSS94RFNKaVI2ZHNnVzNtVm82dXUv?=
 =?utf-8?B?bmVhUzR4UHRPZFcxUGZXcUlzYzVVcjJNclcyNXdUcFN3ejk1OGhaWUp6d21j?=
 =?utf-8?B?bDh6bEtLSU9tM21DbmdYL1pXWGcxTHJHNUtrTWR5b05QU2FlUEpkQ25OQ0Uz?=
 =?utf-8?B?ZVlRWWVuQ1BzeUphUktDM3YyWlNGaWpTc2dySUhGckF0V281c2k3NnhIL0Yw?=
 =?utf-8?B?SEdFcCtrTFlwVmdwalpJWlJ4MFlYN3BxYkFpMytrbXUyZTF2VTBJNU4zYytz?=
 =?utf-8?B?bVhPb0M3RU5Ta3d0c3I1c3gwNklVK1dCUUZmL1BQdStPRG5RWDNqZ3lhV0xa?=
 =?utf-8?B?M2NIZ2VEMXFOci9rQWNEVTFwdVlwQUdiN1RCQndxMGh2Q2Q0L0kxdllocEIr?=
 =?utf-8?B?OHBJaUZTYWlwZ1RKRmxmMzVteDhsQ2hBYlVpWXBYY0RjSkZFZGhSK09rQWoz?=
 =?utf-8?B?bmFMM3hxcGl6V2xmcm0yT05IakYxZTU1RlVuNmR3QTh6OWVERUlhNjN1TlFN?=
 =?utf-8?B?cEplR0NsbnZPWXg1Qk9RNkVGKytvUG14U0ZsOFB1SFpIT1I5cU1Ob0s3RjhL?=
 =?utf-8?B?Wk1DajVyVUtQaFY2UzBuaUtrUXdibE13cnJUSjFSWGtUSVZqRDVSOFRPYlZv?=
 =?utf-8?B?N3pSRkp4TlQ4VitZUGU2aGJlOTBHbG5iM2gyeEpnN3ZEL2ZqdTdvbmptWUUx?=
 =?utf-8?B?cm1yMEgxZUxiMVIvbmxiVmVNemJpa04ycGxreU01cFRSdGljNExMV2hlNlRj?=
 =?utf-8?B?NWhtVnFLd3FzNkxKbEIzeVU1MUlwM25TcVBDbjY2Y2s4ZkFNU3hkNGtpWmFY?=
 =?utf-8?B?dXgxT3M4MjJBTzBTVGVmMm5vZk4zZUliWi9PS1hINGNkcThaUWxudDFxQ3JX?=
 =?utf-8?B?WHZJVnlpT3puc3l3VDhtc1J3K3FkWm5ydE5VRE1OMjU0NFdVVk1RRUlmbUJy?=
 =?utf-8?B?eUE2ZXhYaDZpNVdpdGJudmVOa1A0Z0NYaHZ1eVMvYkNwTk5PVEhzNkVoVGNh?=
 =?utf-8?B?STY5MXROT0Y2dEI2ZVMxUHZYaHNBUEFJYjlJVFozeWZ2RnBvYXloTkFlVk5v?=
 =?utf-8?B?RWJYSWtudVJYWWxodzlON213aERsMEVpendmR04rT0tEd0hNUk9OSnBZQ3l3?=
 =?utf-8?B?WkhjMU1CV1hibk9RMENUWjR6S2NiQTh1RHVRRVlSZkxEUkRMZ3pkM0p6OUZ1?=
 =?utf-8?B?QlpHQkxMNjNaWGlxYlk5Vk13RmRSTWxsR1U0eEpVWTJER0FPTFZkWTBpdmVD?=
 =?utf-8?B?Z0lYSDhZZmtFRE11WWFVVGp2UGd1c05walVjUUV0dGVqRUFvK1NITnJBRUFi?=
 =?utf-8?B?aEhuRUdTZzVUeFpLanR2dnpoTldpNjdXNlViTCtPSmIyNTZkT3Jnb3VyYk9W?=
 =?utf-8?B?MDJuZklsV1NEYy81ZTk3TERnaWxvd0dEQ2pkWnpDeElGNnRwRzNONmsxbFFh?=
 =?utf-8?B?VzRvb2pHdTV6QktzVWVlNEpIbUZ0dEJtRDJlRmJmRXRla3lSdnczQVoxSjZM?=
 =?utf-8?Q?yWAo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bc366e-23f1-42cb-8587-08dbbe5c6b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 06:47:15.1009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7m+GNcVjtZsw6FPu5dbOZolJLfctScN/1nR51ygYCGubFm3zNnr/hlAHR26joH3jBLzAKkgxJ2m7xhAxrwHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613
Subject: [virtio-comment] RE: [PATCH v2 0/2] Support enabling virtqueue after DRIVER_OK

SGkgTWljaGFlbCwNCg0KPiBGcm9tOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE4LCAyMDIzIDExOjA1IFBNDQoNCj4gU3VtbWFyeToN
Cj4gPT09PT09PT0NCj4gVGhpcyBwYXRjaCBlbmFibGVzIGRyaXZlciB0byBjcmVhdGUgdmlydHF1
ZXVlcyBhZnRlciBEUklWRVJfT0sgc3RhdHVzIGJpdCBpcyBzZXQuDQo+IA0KPiBUaGlzIHBhdGNo
IHRha2UgdGhlIGluc3BpcmF0aW9uIGZyb20gdGhlIHRocmVhZCBbMl0gd2l0aCBjcmVkaXRzIHRv
IEV1Z2VuaW8gUMODcmV6Lg0KPiANCj4gRGV0YWlsczoNCj4gPT09PT09PT0NCj4gQ3VycmVudGx5
LCBhIHZpcnRxdWV1ZSBtdXN0IGJlIGVuYWJsZWQgYmVmb3JlIGRyaXZlciBoYXMgc2V0IHRoZSBE
UklWRVJfT0sNCj4gc3RhdHVzIGJpdC4NCj4gDQo+IHNwZWMgY2l0YXRpb24gdG8gc2VjdGlvbiAi
RHJpdmVyIFJlcXVpcmVtZW50czogRGV2aWNlIEluaXRpYWxpemF0aW9uIg0KPiANCj4gIlBlcmZv
cm0gZGV2aWNlLXNwZWNpZmljIHNldHVwLCBpbmNsdWRpbmcgZGlzY292ZXJ5IG9mIHZpcnRxdWV1
ZXMgZm9yIHRoZSBkZXZpY2UsDQo+IG9wdGlvbmFsIHBlci1idXMgc2V0dXAsIHJlYWRpbmcgYW5k
IHBvc3NpYmx5IHdyaXRpbmcgdGhlIGRldmljZeKAmXMgdmlydGlvDQo+IGNvbmZpZ3VyYXRpb24g
c3BhY2UsIGFuZCBwb3B1bGF0aW9uIG9mIHZpcnRxdWV1ZXMuIg0KPiANCj4gVGhpcyBpbXBsaWVz
IHRoYXQgYSB2aXJ0cXVldWUgbXVzdCBiZSBlbmFibGVkIGJlZm9yZSByZWFjaGluZyB0aGUgRFJJ
VkVSX09LDQo+IHN0YWdlLiBUaGVyZSB3YXMgbm8gZXhwbGljaXQgbWVudGlvbiBhYm91dCBhYmls
aXR5IHRvIGVuYWJsZSB0aGUgdmlydHF1ZXVlIGFmdGVyDQo+IERSSVZFUl9PSyBzdGFnZS4NCj4g
DQo+IEluIGZvbGxvd2luZyB1c2VjYXNlcywgY3JlYXRpbmcgYSB2aXJ0cXVldWUgYWZ0ZXIgRFJJ
VkVSX09LIHBoYXNlIGlzIGRlc2lyZWQuDQo+IA0KPiBVc2UgY2FzZXM6DQo+ID09PT09PT09PQ0K
PiAxLiBEeW5hbWljYWxseSBjcmVhdGUgYXEgd2hlbiBhZG1pbmlzdHJhdGl2ZSBjb21tYW5kcyB0
byBiZSB1c2VkLg0KPiBhdGUgdGhlIG5ldCBkZXZpY2UgdHgvcnhxIHdoZW4gZGV2aWNlIGlzDQo+
ICAgIG9wZW5lZCB3aGVuIGRlcGxveWluZyBmb3IgYSBjb250YWluZXIuDQo+ICAgIEluIGEgY29u
dGFpbmVyLCBudW1iZXIgb2YgdmlydHF1ZXVlcyB0byBiZSB1c2VkIG1heSBiZSA8PSBtYXggcXVl
dWVzLg0KPiAzLiBEeW5hbWljYWxseSBjcmVhdGUgZmxvdyBmaWx0ZXIgcXVldWVzIG9mIG5ldGRl
dmljZSB3aGVuDQo+ICAgIEFSRlMgb3IgZXRodG9vbCBmaWx0ZXJzIGFyZSBlbmFibGVkIGFzIGxp
c3RlZCBpbiBbMV0uDQo+IDQuIER5bmFtaWNhbGx5IGNyZWF0ZSBydGMgZnVuY3Rpb25hbGl0eSBy
ZWxhdGVkIHJlYWQgdmlydHF1ZXVlIG9ubHkNCj4gICAgd2hlbiBuZXQgZGV2aWNlIHdoZW4gdGlt
ZXN0YW1waW5nIHRvIGJlIHVzZWQuDQo+IDUuIFdoZW4gWERQIHByb2dyYW0gaXMgc2V0LCBvbmUg
Y2FuIGNyZWF0ZSBhZGRpdGlvbmFsIFhEUCBzcGVjaWZpYw0KPiAgICBxdWV1ZXMgd2l0aG91dCBh
ZmZlY3RpbmcgZXhpc3RpbmcgcXVldWVzLg0KPiANCj4gSGVuY2UsIFRoaXMgcGF0Y2ggaW50cm9k
dWNlcyBhbiBleGlzdGluZyBxdWV1ZSBlbmFibGUgYW5kIGRpc2FibGUgKGFrYSByZXNldCkNCj4g
ZmFjaWxpdHkgYW5kIGEgbmV3IGZlYXR1cmUgYml0IHRvIGV4cGxpY2l0bHkgaW5kaWNhdGUgc3Vj
aCBzdXBwb3J0IGJ5IHRoZSBkZXZpY2UuDQo+IA0KPiBXaXRoIHRoaXMgZmVhdHVyZSwgZHJpdmVy
cyBjYW4gc2tpcCBvcHRpb25hbCBxdWV1ZXMgY3JlYXRpb24gZHVyaW5nIGRyaXZlciBpbml0DQo+
IHRpbWUuIEZvciBleGFtcGxlLCBhIExpbnV4IG5ldCBkZXZpY2UgZHJpdmVyIGNhbiBjcmVhdGUv
ZGVzdHJveSB0aGUgdHJhbnNtaXQgYW5kDQo+IHJlY2VpdmUgcXVldWVzIHdoZW4gbmV0IGRldmlj
ZSdzDQo+IG5kb19vcGVuKCkgYW5kIG5kb19zdG9wKCkgY2FsbGJhY2tzIGFyZSBpbnZva2VkIHJl
c3BlY3RpdmVseS4NCj4gDQo+IFsxXSBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hp
dmVzL3ZpcnRpby0NCj4gY29tbWVudC8yMDIzMDgvbXNnMDAyNjMuaHRtbA0KPiBbMl0gaHR0cHM6
Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tDQo+IGNvbW1lbnQvMjAyMzA2
L21zZzAwMDk3Lmh0bWwNCj4gDQo+IFBhdGNoIHN1bW1hcnk6DQo+ID09PT09PT09PT09PT09DQo+
IHBhdGNoLTEgZml4ZXMgdG8gYWRkIHZpcnRxdWV1ZSByZXNldCBjb25mb3JtYW5jZSByZWZlcmVu
Y2VzDQo+IHBhdGNoLTIgYWRkcyBWSVJUSU9fRl9SSU5HX0RZTkFNSUMgZmVhdHVyZSBiaXQsIHJl
cXVpcmVtZW50cw0KPiANCj4gUGxlYXNlIHJldmlldy4NCj4gDQo+IC0tLQ0KPiBjaGFuZ2Vsb2c6
DQo+IHYxLT52MjoNCj4gLSBmaXhlZCBjb21tZW50cyBmcm9tIE1pY2hhZWwNCj4gLSByZWR1Y2Vk
IGRldmljZSBhbmQgZHJpdmVyIG5vcm1hdGl2ZXMgKHNpbXBsaWZpZWQpDQo+IC0gcmVwbGFjZSAn
YSB2aXJ0cXVldWUnIHRvICd0aGUgdmlydHF1ZXVlcycNCj4gLSByZXdvcmRlZCB0byByZW1vdmUg
J2ludGVyZXN0ZWQnDQo+IC0gYXZvaWRlZCByZXBlYXRlZCAnZGV2aWNlIGluaXRpYWxpemF0aW9u
IHRleHQnLCByZXBsYWNlZCB3aXRoDQo+ICAgRFJJVkVSX09LIHN0YXR1cyBiaXQgbGFuZ3VhZ2UN
Cj4gLSBhdm9pZGVkIGNvbmZ1c2luZyB0ZXh0IGFyb3VuZCAnTUFZJyBpbiB0aGUgcmVxdWlyZW1l
bnRzDQo+IC0gcmVwbGFjZWQgJ3RoZSBxdWV1ZScgdG8gJ3NwZWNpZmljIHZpcnRxdWV1ZXMnDQo+
IC0gcmVwbGFjZWQgcXVldWUgdG8gdmlydHF1ZXVlDQo+IC0gc2ltcGxpZmllZCBjb21taXQgbG9n
IHRvIHRhbGsgYWJvdXQgbXNpeA0KDQpJIGhhdmUgZml4ZWQgdGhlIGNvbW1lbnRzIGluIHYyLg0K
RG8geW91IGhhdmUgYW55IGZ1cnRoZXIgY29tbWVudHMgb2YgdjIgZnJvbSBsYXN0IHdlZWs/DQoN
CklmIG5vdCwgSSB3b3VsZCBsaWtlIHRvIHBvc3QgdjMgd2l0aCBsaW5rIHRvIGdpdGh1YiBpc3N1
ZSBhbmQgcHJvY2VlZCB0byBuZXh0IHN0ZXAuDQo=

