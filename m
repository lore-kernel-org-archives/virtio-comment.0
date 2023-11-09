Return-Path: <virtio-comment-return-8289-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01243C4167D
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:10:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3684D2CAFB
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:10:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13712986CCE
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:10:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E5801986CC9; Thu,  9 Nov 2023 09:10:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D54A7986CCA
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 09:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8wd9QWRT+96ruL4JpchvY3gkgf9TokzXQCF0hQ85kXYMmmwy5leRRd832q+RogeN1gCGuUu2hRjeGKcbNmlqjQpMpPHvV3FJasFzee66gbODZGPhbdFHLtLsVa0mxoqonPCWuKIuSpKVNlhsiLf8vuWykbdrBB2ESM42t8XOXrSL1GSofO0lntA8pzwx2BaakP0wkmgUm1JRW2GEmH3q+mFbMqesB6qwXjvD5XlvRwARb1EEJkceQcksKp1tjpI95CyBnd/uOSLkKy+UCrKtElEQArRxRb1Is4vSf+lSVhX+YEHtz3B1yvdD51ehaxzaCvSCgxtiBC4mmB2f3iJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaBjriijPE8/3SITAMR4SHnGF2AAj1Izk4dQoZWy7Fs=;
 b=jRJYGYwJj5cc6CSgewVcOdqxiavhCGx8cl+ABy0EzZ0aCZUcO+bwpEOVoVJzRfAZgwx0YBVAUS2dvIw3OFJKO4srtwT5fdU4RqbNJIkpj4lMDM6uG6fLrtYyRBfgeoTplbuPU+d+XfM7IfarZe+w19kHXTpUdJXEdsLIiVOUoINB8Ww83vHeZJb/+uR03fSKKroKaxFzvgbQlnq+1CEaDz28MADj2cuLZk+CH9OHhn+/X9JT5+YACdf64mjOQ8Pdg5Kcrs9NNNyjXy+jc60h8ezYOxXseGs+msMSxZMmlv4OpXvCWh52D+p/A71q4uHTFYefDZO4CO+qgvnP4RSw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index:
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAOMuAgAAHrCA=
Date: Thu, 9 Nov 2023 09:10:55 +0000
Message-ID:
 <PH0PR12MB54811CEC8B65FFA26FCA30A6DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
 <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231109033838-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231109033838-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6313:EE_
x-ms-office365-filtering-correlation-id: 46052d32-7691-4799-be60-08dbe103c7ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M8gxfhJcFTJhjSwdRLtKup9PGxv5FCm4+laepeA5aYOMZ3y9w8PbClRUhS5IWkVj3B/GJUpdBUwpfYLw10ESsHRFns5UpZeeBGDqOaXnSJgTYjkN5dAMp+j/2gUMl3wvT8j+GDTXVg0x2nWzoK8C6wSIAO7TIwnWM2V8nQky4fn9dCOoisNPC/9tq4uuR/kg1IgwmYf9Z/jZAw3Rha+gGWkzfSSgLIR0iPnL2i8pwRPWTXPTuX7CfUQVRxnDkPBDjW4srMWK3wRlHEwZKMDyOWuhanwg79c1Hbj7QYOKgqgIKHPkKxil0vUVIUQM0SjZaFmQTe7yVBZ269s+SjtyUaZZ5xUzZYnNsDNw8EBZJ3LzZ3gsdekm2655cG8rvRgoBlTUoTCnYyUGISZkhEHU9ki+ce1aAXBCAiZEQ0RUtBqQGIPgz9KtMeG8EsAjCa9M/9aNPbTdq3V/raNPnEc0kZ/pzAmTzXhWVSI0XL8nxow5Zo1Cwfj+mwMRs6zdNdEPRlVi2o76aLo74KrRjZAbINeOdnycGjkf28ikIDFBGJnVEd/ducJ7TKwzEczaeddB78DPoMtw585vwu20iqN18QPJrGsKqKIDj7FNz+sN/yy3effSa8Voikra4hZlO0NB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(5660300002)(41300700001)(4326008)(9686003)(8676002)(8936002)(86362001)(38100700002)(76116006)(66556008)(66946007)(6916009)(52536014)(66446008)(316002)(54906003)(64756008)(83380400001)(66476007)(478600001)(122000001)(33656002)(55016003)(38070700009)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDFxcm1hMFlDM2RiMzVEdWhtaXVQMFVhSit3Y050N2kxV1J1Q2RaU09zYWZr?=
 =?utf-8?B?Q3pKSDZwRnFYbUc2em10c0I4bDhTN0pSQ3Ava1hXNy9ya1hwS1hyVmpDNFpl?=
 =?utf-8?B?Tmg3bkR0SUJBSU52UGlSTlFCeHBObjZtVlNVZHFCK3dkeXlhNFBFM1llVUJl?=
 =?utf-8?B?QTZ5eWpvcENNSW41NzFsbWw2M1gxdm40Z1MzTE5CbVJ3ZGdOZGFsb3cvZjVt?=
 =?utf-8?B?aC9nb3E3MTdDdURaa0pZWTB4VnpIdis5OTZyWU9kNklyMVpRWm1VclliZWww?=
 =?utf-8?B?ZlF4MDlTVTV6djkyN1ZFUlRwTFRDYU5TMVJuTEhoSy9nQWhoS05vRU41TjJ0?=
 =?utf-8?B?VVJFbE9OTm14OVpxYVlQL3drQ3A2NU5wR1R1bkQ3a2Ywd1VJWUREaXZ2YVJN?=
 =?utf-8?B?akhXWWxqVkVwTGRwYUw1MWlONjJubnIvcUpuYnVpTGNYYndSbTc4RHoyeTZL?=
 =?utf-8?B?bUxDY28rbU1FQlphZDRnUmcwNTFRWFRlRXI4b0E0WjVzMytHems5QWhsVDlo?=
 =?utf-8?B?b09OZEpCUGwyZzZtNy9uVi81L2lLUUwrODFhU2psamRLVDY4bnJZRXp4YU1E?=
 =?utf-8?B?ejZsaWV1YkxLMkhHU2ppYjZidzV0aGxQMSt3cTlTY3l4QlNOSWJwRm0xNy9z?=
 =?utf-8?B?Zms4RDZBWkNoQUk3dWRuWHd5a1RrSGMweUlHTXpoVytId1RDMVIyUzMzb3dr?=
 =?utf-8?B?NFU3bkxEWlluOHJXamRzZ2t6MFE3MzhLbkd5dEtzRUVHUXpNUHRmTGwwRlhp?=
 =?utf-8?B?cUlib1pBaDZYYzFkRWhja1p3RDVkeEtHN1cyUHNxWEtsY1dNbkJ6anhraFdE?=
 =?utf-8?B?ZWl0c296a1dTSVQ1OWI3enlKWE04Z29PL2xOMTE3UGU4MWlkRVJSaXFTdlpm?=
 =?utf-8?B?Tm8xVmFwdG1EdlhEbjBSWDdXcE5uMWVnQTJwNUVJTmtSNDUvNVdpdFJXenl2?=
 =?utf-8?B?Z0xwYzIwM3FuRi9NMVIzQmgxZVpYTDJSb29mejlSOUdyUGh4K3RLUzV1bWxC?=
 =?utf-8?B?R1FaM0hQUW1kckdLazJRWDRYcWhoQTRuUlpoWEJzNkMwSkpQY3RydGtLNW8v?=
 =?utf-8?B?R1RzV25Rc1FoMCtsamVvVEdkRTl0NXhvSW4zNWJSMzJ1bFFIQ1pGZ2psYm1Y?=
 =?utf-8?B?V3Y1em5Wa1lNbWtIcHB1MFZiRGdlRDBXRTFjbG55VS9HRGZhN2VyRndMdXlZ?=
 =?utf-8?B?U0cvRk1UMXBJbnRzQTBSeC9xeGRyWW1rYlpVZXV2MGpoeWQvSmR0Vytrcmtl?=
 =?utf-8?B?NzJUQkdseUpsY2pXV2h0cmtTaFk0MnhqWkZWMG1FQVlLTUlKTzhZNm9FT2NU?=
 =?utf-8?B?ZUNYVlZuOWJ3MXNJNVhiMENqZzhiZlI0VVUwdmxjbWVnUWpRS3RpMS80czV5?=
 =?utf-8?B?QVJ4a3o1Tlk1aWp6aVlwQmk0Vm1uQlZmeElmUW1kYnV0elVjbGIyWXFJdmRN?=
 =?utf-8?B?RVlHYXRhZXJTdExYNWVlL0JNanN4blBMQTcyOWFEOHhCVDhKVzRQVUtycTJp?=
 =?utf-8?B?NFZkZWQxaVZKa2VJTjBnbXozajc4K0RWVnN2N3NIUG03TmhieTI4QTlGWFk0?=
 =?utf-8?B?ZVVDcGllWmZaT01OaS9TeFdQbmtrcHhRdXVudzI3bGxMbmRWNWRzR3k4YS9k?=
 =?utf-8?B?OUo2OUZvS2lEM2ZUNnNyYUpuNk5hdW5zL1ZwVERSTDJmVjBjNHRFc09rdlR2?=
 =?utf-8?B?WHRGZ29EL3gvZVJoQkhsQW0rekZwMkJycXpuN2JXUXZlbkltb1JsY3MrZkVj?=
 =?utf-8?B?MHEyNmpkN3V1eDh1bnFFeVEyOS92QnNxYVhEMmROKzkycWYvdzFIMGxCam9I?=
 =?utf-8?B?UzA3T1ZZNGdtclgwK3dyc2NtbzFWNW95MnlObGRRbEQ2QWxVYmZhek51ODRy?=
 =?utf-8?B?YW40TXloK3JiTVF4Ly85Tm5mZExhWWVoVUpKOE5zODAvSTJUeGJiUk9HSTc1?=
 =?utf-8?B?dDFzNks4MXhKcnZKb0tObjhHUG9yd2Uxa0ZCMHpzWXJrZzZwMEEzSjR6QllT?=
 =?utf-8?B?eXQwcnhNRHE2VExQRmdjcjA0d2pKVzBsR2E2MnpSeEEvOURCM0YyTnk1UFlx?=
 =?utf-8?B?ejZtc254TWxaSC9UWHpLdkRxOHQ1bXIweVBxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46052d32-7691-4799-be60-08dbe103c7ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 09:10:55.3868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrTvo3hNZwN6ns/4qR38P/gBfzqNrbMXce7jEycpngmjfFthV7p1MpzjdGncERyx93G7dJGGdAqiQTZRUghnEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIzIDI6MTIgUE0NCj4gDQo+IE9uIFRodSwgTm92IDA5LCAy
MDIzIGF0IDA2OjI4OjE3QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4+IFRo
ZSByZWdpc3RlcnMgYXJlIGNvbnRyb2wgcGF0aCBpbiBjb25maWcgc3BhY2UsIGhvdyA0MDBHIG9y
IDgwMEcgYWZmZWN0Pz8NCj4gPiA+ID4gQmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZSBpbiBwcmFj
dGljZSByZXF1aXJlcyBsYXJnZSBudW1iZXIgb2YgVlFzLg0KPiA+ID4gPg0KPiA+ID4gPiBZb3Ug
YXJlIGFza2luZyBwZXIgVlEgcmVnaXN0ZXIgY29tbWFuZHMgdG8gbW9kaWZ5IHRoaW5ncw0KPiA+
ID4gPiBkeW5hbWljYWxseSB2aWENCj4gPiA+IHRoaXMgb25lIHZxIGF0IGEgdGltZSwgc2VyaWFs
aXppbmcgYWxsIHRoZSBvcGVyYXRpb25zLg0KPiA+ID4gPiBJdCBkb2VzIG5vdCBzY2FsZSB3ZWxs
IHdpdGggaGlnaCBxIGNvdW50Lg0KPiA+ID4gVGhpcyBpcyBub3QgZHluYW1pY2FsbHksIGl0IG9u
bHkgaGFwcGVucyB3aGVuIFNVU1BFTkQgYW5kIFJFU1VNRS4NCj4gPiA+IFRoaXMgaXMgdGhlIHNh
bWUgbWVjaGFuaXNtIGhvdyB2aXJ0aW8gaW5pdGlhbGl6ZSBhIHZpcnRxdWV1ZSwNCj4gPiA+IHdv
cmtpbmcgZm9yIG1hbnkgeWVhcnMuDQo+ID4gTm8uIHdoZW4gdmlydGlvIGRyaXZlciBpbml0aWFs
aXplcyBpdCBmb3IgdGhlIGZpcnN0IHRpbWUsIHRoZXJlIGlzIG5vIGFjdGl2ZSB0cmFmZmljDQo+
IHRoYXQgZ2V0cyBsb3N0Lg0KPiA+IFRoaXMgaXMgYmVjYXVzZSB0aGUgaW50ZXJmYWNlIGlzIG5v
dCB5ZXQgdXAgYW5kIG5vdCBwYXJ0IG9mIHRoZSBuZXR3b3JrIHlldC4NCj4gPg0KPiA+IFRoZSBy
ZXN1bWUgbXVzdCBiZSBmYXN0IGVub3VnaCwgYmVjYXVzZSB0aGUgcmVtb3RlIG5vZGUgaXMgc2Vu
ZGluZw0KPiBwYWNrZXRzLg0KPiA+IEhlbmNlIGl0IGlzIGRpZmZlcmVudCBmcm9tIGRyaXZlciBp
bml0IHRpbWUgcXVldWUgZW5hYmxlLg0KPiANCj4gTWF5YmUgYnV0IEkgdGhpbmsgbm90IHF1YWxp
dGF0aXZlbHkgZGlmZmVyZW50Lg0KPiBJZiB5b3UgY2FyZSBhYm91dCB0aGVzZSB0aGluZ3MgcGxl
YXNlIHByb3ZpZGUgc29tZSBlc3RpbWF0ZXMuDQo+IEkganVzdCBkb24ndCBzZWUgaG93IHF1ZXVl
IHJlc3VtZSB3cml0ZXMgZXZlbiB3aXRoIDY0ayBxdWV1ZXMgd2lsbCBzYXR1cmF0ZSBhbg0KPiBl
eHByZXNzIGxpbmsuDQo+IA0KSXQgaXMgbm90IHRoZSBidyBvZiB0aGUgbGluay4NCkl0IGlzIGhv
dyB0aGUgbmVlZCBmb3IgdGhlIGRldmljZSB0byBiZSBhbHdheXMgcmVhZCB0byBzdXNwZW5kIHRo
b3NlIG1hbnkgcXVldWVzIHRocm91Z2ggcmVnaXN0ZXIgaW50ZXJmYWNlLg0KDQo+IA0KPiA+ID4g
Pj4gU2VlIHRoZSB2aXJ0aW8gY29tbW9uIGNmZywgeW91IHdpbGwgZmluZCB0aGUgbWF4IG51bWJl
ciBvZiB2cXMgaXMNCj4gPiA+ID4+IHRoZXJlLCBudW1fcXVldWVzLg0KPiA+ID4gPiA6KQ0KPiA+
ID4gPiBTdXJlLiB0aG9zZSB2YWx1ZXMgYXQgaGlnaCBxIGNvdW50IGFmZmVjdHMuDQo+ID4gPiB0
aGUgZHJpdmVyIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGFueXdheS4NCj4gPiBUaGF0IGlzIGJl
Zm9yZSB0aGUgdHJhZmZpYyBzdGFydHMgZnJvbSByZW1vdGUgZW5kLg0KPiA+DQo+ID4gPiA+DQo+
ID4gPiA+Pj4gRGV2aWNlIGRpZG7igJl0IHN1cHBvcnQgTE0uDQo+ID4gPiA+Pj4gTWFueSBsaW1p
dGF0aW9ucyBleGlzdGVkIGFsbCB0aGVzZSB5ZWFycyBhbmQgVEMgaXMgaW1wcm92aW5nIGFuZA0K
PiA+ID4gPj4+IGV4cGFuZGluZw0KPiA+ID4gPj4gdGhlbS4NCj4gPiA+ID4+PiBTbyBhbGwgdGhl
c2UgeWVhcnMgZG8gbm90IG1hdHRlci4NCj4gPiA+ID4+IE5vdCBzdXJlIHdoYXQgYXJlIHlvdSB0
YWxraW5nIGFib3V0LCBoYXZlbid0IHdlIGluaXRpYWxpemUgdGhlDQo+ID4gPiA+PiBkZXZpY2Ug
YW5kIHZxcyBpbiBjb25maWcgc3BhY2UgZm9yIHllYXJzPz8/Pz8/IFdoYXQncyB3cm9uZyB3aXRo
IHRoaXMNCj4gbWVjaGFuaXNtPw0KPiA+ID4gPj4gQXJlIHlvdSBxdWVzdGlvbmluZyB2aXJpdG8t
cGNpIGZ1bmRhbWVudGFscz8/Pw0KPiA+ID4gPiBEb27igJl0IHBvaW50IHRvIGluLWVmZmljaWVu
dCBwYXN0IHRvIGVzdGFibGlzaCBzaW1pbGFyIGluLWVmZmljaWVudCBmdXR1cmUuDQo+ID4gPiBp
bnRlcmVzdGluZywgeW91IGtub3cgdGhpcyBpcyBhIG9uZS10aW1lIHRoaW5nLCByaWdodD8NCj4g
PiA+IGFuZCB5b3UgYXJlIGF3YXJlIG9mIHRoaXMgaGFzIGJlZW4gdGhlcmUgZm9yIHllYXJzLg0K
PiA+ID4gPg0KPiA+ID4gPj4+Pj4+IExpa2UgaG93IHRvIHNldCBhIHF1ZXVlIHNpemUgYW5kIGVu
YWJsZSBpdD8NCj4gPiA+ID4+Pj4+IFRob3NlIGFyZSBtZWFudCB0byBiZSB1c2VkIGJlZm9yZSBE
UklWRVJfT0sgc3RhZ2UgYXMgdGhleSBhcmUNCj4gPiA+ID4+Pj4+IGluaXQgdGltZQ0KPiA+ID4g
Pj4+PiByZWdpc3RlcnMuDQo+ID4gPiA+Pj4+PiBOb3QgdG8ga2VlcCBhYnVzaW5nIHRoZW0uLg0K
PiA+ID4gPj4+PiBkb24ndCB5b3UgbmVlZCB0byBzZXQgcXVldWVfc2l6ZSBhdCB0aGUgZGVzdGlu
YXRpb24gc2lkZT8NCj4gPiA+ID4+PiBOby4NCj4gPiA+ID4+PiBCdXQgdGhlIHNyYy9kc3QgZG9l
cyBub3QgbWF0dGVyLg0KPiA+ID4gPj4+IFF1ZXVlX3NpemUgdG8gYmUgc2V0IGJlZm9yZSBEUklW
RVJfT0sgbGlrZSByZXN0IG9mIHRoZQ0KPiA+ID4gPj4+IHJlZ2lzdGVycywgYXMgYWxsDQo+ID4g
PiA+PiBxdWV1ZXMgbXVzdCBiZSBjcmVhdGVkIGJlZm9yZSB0aGUgZHJpdmVyX29rIHBoYXNlLg0K
PiA+ID4gPj4+IFF1ZXVlX3Jlc2V0IHdhcyBsYXN0IG1vbWVudCBleGNlcHRpb24uDQo+ID4gPiA+
PiBjcmVhdGUgYSBxdWV1ZT8gTnZpZGlhIHNwZWNpZmljPw0KPiA+ID4gPj4NCj4gPiA+ID4gSHVo
LiBOby4NCj4gPiA+ID4gRG8gZ2l0IGxvZyBhbmQgcmVhbGl6ZSB3aGF0IGhhcHBlbmVkIHdpdGgg
cXVldWVfcmVzZXQuDQo+ID4gPiBZb3UgZGlkbid0IGFuc3dlciB0aGUgcXVlc3Rpb24sIGRvZXMg
dGhlIHNwZWMgZXZlbiBoYXMgZGVmaW5lZCAiY3JlYXRlIGENCj4gdnEiPw0KPiA+DQo+ID4gRW5h
YmxlZC9jcmVhdGVkID0gdG9tYXRvL3RvbWF0byB3aGVuIGRpc2N1c3NpbmcgdGhlIHNwZWMgaW4g
bm9uLW5vcm1hdGl2ZQ0KPiBlbWFpbCBjb252ZXJzYXRpb24uDQo+ID4gSXQncyBpcnJlbGV2YW50
Lg0KPiA+DQo+ID4gQWxsIEkgYW0gc2F5aW5nIGlzLCB3aGVuIHdlIGtub3cgdGhlIGxpbWl0YXRp
b25zIG9mIHRoZSB0cmFuc3BvcnQgYW5kDQo+ID4gd2hlbiBpbmR1c3RyeSBpcyBmb3J3YXJkaW5n
IHRvIG5vdCBpbnRyb2R1Y2VkIG1vcmUgYW5kIG1vcmUgb24tZGllIHJlZ2lzdGVyDQo+IGZvciBv
bmNlIGluIGxpZmV0aW1lIHdvcmsgb2YgZGV2aWNlIG1pZ3JhdGlvbiwgd2UganVzdCB1c2UgdGhl
IG9wdGltYWwgY29tbWFuZA0KPiBhbmQgcXVldWUgaW50ZXJmYWNlIHRoYXQgaXMgbmF0aXZlIHRv
IHZpcnRpby4NCj4gDQo+IHdlIHJlYWxseSBkbyBub3QgbmVlZCB0byBwcmVtYXR1cmVseSBvcHRp
bWl6ZSBhbGwgdGhpbmdzLg0KPiBjb250cm9sIHBhdGggaXMgY29udHJvbCBwYXRoIGl0IGlzIGdv
aW5nIHRvIGJlIHNsb3cgYmVjYXVzZSB2aXJ0aW8gZGVzaWduZWQgaXQgdG8gYmUNCj4gc2xvdyBh
bmQgZHJpdmVycyBkb24ndCBvcHRpbWl6ZSBpdC4NCj4gU2hhdmluZyBvZmYgYSBtaWNyb3NlY29u
ZCBoZXJlIG9yIHRoZXJlIGlzIGdvaW5nIHRvIGRvIG5vdGhpbmcgZXhjZXB0IGluY3JlYXNlDQo+
IG1haW50YWluYW5jZSBjb3N0cy4NCg0KQ29udHJvbCBwYXRoIHBvc3QgZGV2aWNlIGluaXRpYWxp
emF0aW9uIGZvciBsYXJnZSBwYXJ0IGlzIHRocm91Z2ggdGhlIGN2cS4NCg==

