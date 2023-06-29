Return-Path: <virtio-comment-return-6592-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6790BEB64D7
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:47:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A55D42564
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:47:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D8A49865AA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:47:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 57FE2986588; Thu, 29 Jun 2023 02:47:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44B8C98658B;
	Thu, 29 Jun 2023 02:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE3XdvR3AvsT5ETyf5UQtKo9UJ37V1a2BeEjqlrXtqghNZxxgtig2yN6EbO3uDHbJAsHmem6+W6DtCDebeM5gffMz8pwNwi4b5iva59g6G8qEonR4MbpTQiAWgmc8MPlNf2zugRU9Jdly9TePyuY+6qJZpfEUKtcLFNEPdjRKWej1yKqpwo9abSDgt05z670Vmqts4tkSQ7gZHgVDGOi9BRNd1BtRGFgdVzZbXotUX1y/yJgAO448OlZbf5fXjutiEGE/gOnMENLHYNpLVI17rXKC7tUkV+2uX53dt2s2fHmuGveO0MHkTPnTOk7LQT//WGsF8Qh5tkc/xFIZGwQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fio8BNKqTdm3oJKeAnPfisGtU9r0BOk+Pnoy2cO84Q=;
 b=V5o4XcJK3UBPye7CHVsGBECjamtmHoqThgLlh4BbZCHy21BKdpwitHRIITk+P2zyIscVnvsqMNNvNnGe3fpcZ6Wcj8ShHsFML4H8K2GK2ePh4rBUgFWdXMzbW/SD85s8CSjDsePMtCD/bJZJ6ZfhpB5ASWAQzjsAc+EP+XXUso2RXKMYCDOGCXaEPpZ/PZw0vS98Bec+SwlzDmyXU23UP97z7UH/Wpc1SeBDjlBLphantk9vsuPPyOrFM0lKZY9JoSgdRExjfJYz/MImcVHywDfCVTSI6ZwjqsWBMl7iYQeeSkf974JvEuNUja82qZOP/rBGbDw1/n2aqfGx0BQT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed
Thread-Index:
 AdmpVpzpKKBUbqM4Qgq425cUop3WcQAO9SoAAAusrWAAG7XmgAAACPggAACt3gAAAAnhcA==
Date: Thu, 29 Jun 2023 02:47:04 +0000
Message-ID:
 <PH0PR12MB5481532D87D5606D90938B39DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
 <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
In-Reply-To: <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6666:EE_
x-ms-office365-filtering-correlation-id: 65e87224-b0b8-4987-e701-08db784b1f30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F1lcNuA8hT8tZGRcNAOIMBJ2lDb4Nn1jvsQhJ05F+eMhUcuJilIssiMQGR9mEIZJZy3AjsUcBXR6tij+TOZbBFfxo3PVh229nUeXGjUyMA8R6W5XNwCxCe3z84BRSuOAR/WhdcqZ4qUY/eLJH+QFuyVreXOaERQVr/IFFGMbpwMcYuUWJz8YyLTlUgtbHvmnv9Ve3qf928X0KCXQBMvcE0IOPAWmb8GgVgo7F1ZHInF2Tr6wElRWo2tm6dAK6FScpAm+BxgtFoO4up/6nKLtDXNUrqvhU68kixVO3AHEumdLHdc+3Ib6rhCDhgxmahnd0eMnWsV+X/VM/o5mdp7noevc7/e7UEFzLmijudGYCU3SDc6J5pVg6JRFQ/HbVF/BHynI2prC7Jv6FFo1TZ+usREejx1SFxYfdqrKfatQi+wnwfvGIvMG+OdGljkcUM9NPYmk5ufkB7f2aS733NiMKnB32c123glva9+Z1Oy+mqAp1/r8yN6a0U878eDwBSl90y49GMkEPOceLyDrvI6vv5VSm6cDMKnGDF7xxT/LXuNLsSiNVIJxhxg15alOgQMH8TIZC6+Z0qmWu1n3lVl1EhXQR+VauULokKSf6DGYU/SnFtHcOULuDpoAUP6kpjK8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(66556008)(66446008)(4326008)(66476007)(316002)(76116006)(6916009)(38070700005)(64756008)(478600001)(33656002)(66946007)(8936002)(8676002)(52536014)(5660300002)(2906002)(26005)(54906003)(86362001)(55016003)(41300700001)(7696005)(53546011)(6506007)(71200400001)(9686003)(122000001)(186003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEt3elZlYW81VGtoUE9wUk1EMmFZZUJxNVJBUHJ3eGd5YmU5QmV0YjVzR0Jp?=
 =?utf-8?B?eG1UVU8xSEo2Znh3RzlvaUI5QitBcitreWNYNEtkUjhuc0ozWkJXNnJFbTV1?=
 =?utf-8?B?d0xsUG1BWWFWSnVydTR0TDBkSHZ1dFpNdFBtZVNhOFl1VDhpYVZaT1lzZjYz?=
 =?utf-8?B?eTF4Rk52ZlR0amdWTWlCQ09rUCtFQ05Idm5VTDdzSDdoRWRsR0VTWWkzSjhz?=
 =?utf-8?B?QWtBbURDWXNLRXdGbDN4U2tiTmpORnF1TFlvRnVDaHJCRXFPRmRadEVQMXhG?=
 =?utf-8?B?YVNkakRiWDNmelZpVTBZQkNUSTJQakUwTm5SS014cW9mZHBGb1FkVnVqeDB6?=
 =?utf-8?B?a0VhcWo2a2ZDVXpvRlo1aG9aUm9HMXF4cDcxb2s2UG9YZUQrQW1HRFBiWllo?=
 =?utf-8?B?ZGhGaEsyQnNHYndicEI5RVVnSkhHdW1aOVQ5UG5yUTFMMGhONFMzZGcyRXR0?=
 =?utf-8?B?NlZqS2pndVRCTmhyWlFQaDd3Ukg1SmNPM2hOQnVwWEZzTXNuSVgvSFkxVlM3?=
 =?utf-8?B?a1FhNmw4cUVrQk45c0I1aTQwa1pvdkkrUi9kK0dNd3ZqODM0S1QzM2lpd1Q4?=
 =?utf-8?B?Q25QeFlNdENpQWpYa05WYko2OVE5QVl1L0RnZ2tWeGI3azNnVEVySWpMemJE?=
 =?utf-8?B?MzZoZE05WTdaYUMvSTdNVW1vK3hvUS9QOFNXcFJxbmd4SXVjdms5czVSM2c1?=
 =?utf-8?B?MFUyeTFOamVVUHhub011UzNHK3E0enYrVHpRRlZzeVhlVTJFQkxhTnZIU2xj?=
 =?utf-8?B?RzhFcVdueEU4cjlTZ3JVM1I4anVsMFBweC9JR0UzTy9kdnR1ZDZuL3dWblFq?=
 =?utf-8?B?VVFaYmpVUnBmOUFoUW9BQmM3VmtkUkZWZlZSZDRVdWlmZkhQa24xRDlXYmox?=
 =?utf-8?B?TFFLYTl0eGJBZXVValB2MW4xNzZUMlRHekJpNzMwbUdXN05KNTJjU2d0OHdE?=
 =?utf-8?B?R3dodHJGWngyS3BLdFlwTjllblR3ZXNWdDkwOGV2b0x4R0hkdDJxRDJmZ0lY?=
 =?utf-8?B?WXc5SHhrSlptajZvUjM0UitRUStzc3FRSHcyOFI5a2hwcWVUdzFVQU5DVFJp?=
 =?utf-8?B?TjJxUWJBdEtsZTl3RVVNcXZ5QlpyZ1ROZGJyd3hOZWFqRUpFQWZvSWJSU1N6?=
 =?utf-8?B?cnUxOG9FVzdabmM2K0RlSGFKYTBOcy9EZStYNXlqT3FMMTVtQ0h5N0F0cWdm?=
 =?utf-8?B?L2VSNG1EV2FESFRMSkVaWnhMd1ZMV3IzWDNUcVpLUS9paDVrWnpDUG1XaUtq?=
 =?utf-8?B?VVZqU0ZaMHVKV3ozK1FCUGN2bWlBdG1PdktwS0VUTVlDNGJ6eGZ0N0p1K0x2?=
 =?utf-8?B?SU5xaHUrazhpTSsyTDU3eG5hb1VaVW5QREoxMENYWDFha1NSYlMwSHY2VDFR?=
 =?utf-8?B?L3NqQk0vcVNHTS82RGltWGFKSmpKeFdTYUZHQ3BPamJZbGlqR3dNbERWM0JI?=
 =?utf-8?B?OTJ3WC81SnU4bWZhM3k1SjdBTmQ5ZTVlSzY4YXZJQS9kYVZGcUh3WlVpTG11?=
 =?utf-8?B?c0JEdEZGeXpOUkRsMFd5YlVmTnZrRUZXMGFKTmN5dWZhOEgvcGJUaWU4Mm9j?=
 =?utf-8?B?YkkzUVM0RFovc0tQd1BGUkxqZXJLc2d4UDAyNWJqRTYwc1BIdkFaSFRjNzh3?=
 =?utf-8?B?aHVqQXRBR1c1Mk9rSWZZRmZpMUFETnVFQ29tZERLd0ZuWUZXMEJtWnAwRG5a?=
 =?utf-8?B?UUFwRFF0cThscmxGWGlNZmw0WWpkSkE5Y3FONlVtRm1lRTZibWFobDBiL2g2?=
 =?utf-8?B?ZHEzREg2aHRLeFh5VlVTb0tDN3RtTFByZnVydkdQdGgwRzVCVlVqa0FLaWRt?=
 =?utf-8?B?cVIxcVh3Z002cERSdFBqWkpTT0pEdTY2THRsTkxiZGM1MGkyQy93cjF5cFgz?=
 =?utf-8?B?UTJLVjB4NmFlTFNDV1FTOXMyZC8wRGNPUStzZnA4V3g2WXRIaitja1hlY2p6?=
 =?utf-8?B?SVc2UzIya3JWcnNJeUltc0hVVER4dmpkZGZIenEraXp3UnlpLzVqajZwbEpW?=
 =?utf-8?B?Q0lrZ1EyUWV4M0M2aEVlOXMxTjRXRTl5cTQ4djBWL3A1bnpxTVcvY0pDMFNx?=
 =?utf-8?B?TFp5dkNHeDRiYUs4UFpVZWU5OVVkWW5kckRWSUJKUlY1NDJDaWd0TXEvb3kr?=
 =?utf-8?Q?peq0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e87224-b0b8-4987-e701-08db784b1f30
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 02:47:04.3968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l29rAD3QpXhjI+xzzf9FBzWL81mfQSGS/bWkS14NpiUWyoEIzeW8CmJOjsee72iEfZwmvg0feTGN9uMYDM/t2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
Subject: RE: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVuZSAyOCwgMjAyMyAxMDozOSBQTQ0KPiANCj4gDQo+IE9uIDYvMjkvMjAy
MyAxMDoyMyBBTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBaaHUsIExpbmdzaGFu
IDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjgs
IDIwMjMgMTA6MTggUE0NCj4gPg0KPiA+Pj4gU28gbXNpeCBwcm92aXNpb25pbmcgdmlhIEFRIGlz
IGZpbmUuIFZGIGNhbiBleHBvc2UgbmV3IE1TSVgNCj4gPj4+IGNhcGFiaWxpdHkgcG9zdA0KPiA+
PiByZWNvbmZpZ3VyYXRpb24gdmlhIEFRLg0KPiA+PiBJdCBpcyB0aGUgZ3Vlc3QgdG8gY29uZmln
IE1TSVggb2YgYW4gYXNzaWduZWQgVkYgYnkgd3JpdGluZyB0byBNU0lYIGNhcGFiaWxpdHkuDQo+
ID4+IEhvd2V2ZXIgaG9zdCBvd25zIHRoZSBBUSwgbWVhbnMgaG9zdCBjYW4gbW9kaWZ5IHRoZSBN
U0lYIGNvbmZpZyBldmVuDQo+ID4+IHdoZW4gZ3Vlc3Qgb3BlcmF0aW9uYWwgcnVubmluZy4NCj4g
PiBIb3N0IGNhbiBkbyBtYW55IHRoaW5ncyBub3QganVzdCBNU0lYIGNvbmZpZy4NCj4gPiBIb3N0
IGlzIG5vdCBzdXBwb3NlZCBtb2RpZnkgdGhlIGNvbmZpZy4NCj4gPg0KPiA+IEluIHNvbWUgT1Mg
TVNJLVggYWN0dWFsIHZhbHVlcyBhcmUgbm90IGV2ZW4gd3JpdHRlbiBieSB0aGUgZ3Vlc3QuLi4N
Cj4geWVzdCwgY3VycmVudCBob3N0IHN0YWNrIGlzIG5vdCBwZXJmZWN0Lg0KPiBTbyBsZXRzIHJl
c29sdmUgdGhlc2UgaXNzdWVzIGZpcnN0IHJhdGhlciB0aGFuIGludHJvZHVjZSBuZXcgYXR0YWNr
IHN1cmZhY2UuDQo+ID4NCj4gPj4gQSBuZXcgc3luY2hyb25pemF0aW9uIG1lY2hhbmlzbT8gVHJh
cCBhY2Nlc3NlcyB0byBNU0lYIGNhcD8gQmFuDQo+ID4+IGFjY2VzcyBvZiBNU0lYIHRocm91Z2gg
QVEgYWZ0ZXIgRFJJVkVSX09LPw0KPiA+PiBEbyB5b3UgaGF2ZSBhbnkgZGV0YWlsZWQgaW5mb3Jt
YXRpb24gYWJvdXQgaG93IHRvIHByZXZlbnQgdGhlDQo+ID4+IGNvbmZsaWN0cyBsaWtlIHRoaXM/
DQo+ID4gQSBoeXBlcnZpc29yIGlzIGEgdHJ1c3RlZCBlbnRpdHkgdG8gbm90IG1lc3Mgd2l0aCB0
aGUgVkYuDQo+ID4gQSBoeXBlcnZpc29yIGNhbiBnbyB0byBhbiBleHRyZW1lIHRvIGV2ZW4gZG8g
UENJIEZMUiB3aGlsZSBndWVzdCBpcyBydW5uaW5nLi4NCj4gPg0KPiA+IFNvIG5vIG5lZWQgdG8g
Z28gdG8gdGhlIGV4dHJlbWUuDQo+ID4NCj4gPiBXaGVuIGh5cGVydmlzb3IgaXMgdW50cnVzdGVk
IGluIHJlbGF0aXZlbHkgZmFyIGZ1dHVyZSwgd2hlbiBhIFZGIGlzIHB1dCBpbiBzb21lDQo+IHNl
Y3VyZSBlbmNsYXZlIGFuZCBsb2NrZWQgaHlwZXJ2aXNvciB3aWxsIG5vdCBzdWNoIGFjY2Vzcy4N
Cj4gPiBBdCB0aGF0IHBvaW50IGxhcmdlIHBhcnQgd2lsbCBiZSBjb3ZlcmVkLg0KPiBUaGVyZSBj
YW4gYmUgb3RoZXIgbWFsaWNpb3VzIHNvZnR3YXJlIGFuZCBhIGh5cGVydmlzb3IgbWF5IGNvbXBy
b21pc2UuIA0KDQpJbiBhbnkgY2FzZSBpdCBpcyBub3QgdGhlIHJvbGUgb2YgdGhlIEFRIGV0YyB0
byBwcm92aWRlIHN1Y2ggcHJvdGVjdGlvbiBldGMuDQoNClNhZmVndWFyZGluZyBmcm9tIGh5cGVy
dmlzb3IgaXMgY29tcGxldGVseSBkaWZmZXJlbnQgdG9waWMgdXNpbmcgY29uZmlkZW50aWFsIGNv
bXB1dGluZywgVERJU1AgYW5kIG90aGVyIGFmZmlsaWF0ZWQgc3RhbmRhcmRzLg0KSXQgaXMgZmFy
IGJleW9uZCBtc2l4IGNvbmZpZyBwaWVjZSB0byB0YWNrbGUuDQoNCkJlZm9yZSB3ZSByZWFjaCB0
aGVyZSwgdmlydGlvIHNwZWMgaGFzIGNlcnRhaW4gZnVuZGFtZW50YWwgY2F0Y2ggdXAgdG8gYmUg
ZG9uZSwgYXQgbGVhc3QgdG8gbWUuDQoNCj4gSSBzdGlsbCB0aGluayB3ZSBzaG91bGQgcmVzb2x2
ZSB0aGUgaXNzdWVzIGZpcnN0Lg0KSSBkb27igJl0IHRoaW5rIHRoaXMgaXMgcmVhbGx5IGFuIGlz
c3VlLg0KUGFzc3Rocm91Z2ggVkYgZGV2aWNlcyBhcmUgYWxyZWFkeSB0aGVyZSBmb3IgbW9yZSB0
aGFuIGEgZGVjYWRlIGFuZCBtc2l4IGNvbmZpZyBpcyBqdXN0IG9uZSBzbWFsbCBwaWVjZSBvZiBp
dCB0byBwcm92aXNpb24sIGFtb25nIG90aGVycy4NCg==

