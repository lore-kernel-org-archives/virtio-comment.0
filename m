Return-Path: <virtio-comment-return-8297-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64DAC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EE39026A34
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6546986CD6
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0663986CCD; Thu,  9 Nov 2023 10:15:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FC7E986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 10:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaiaLukuUxdII2s4tgO3bVq2pGl6M21mkz+X4r8TIFsGCqh4SobQjMSW/JUmcJMDd29iBLCA32+x/uIO3/Ud1/rRkTQ3UTgjEuk0WO5p9N44ErApQwiCviR3omINmyd1HbCTWfBl7U5WcOMRR3ciySOeKHs4ho+TBlz1bN0MFc4hIjtlnle3F2a3gbmED8gukFTIQvxAL//1wb+NQJauldeUK2KgV/ut+cRULXX9W2u7grJqglylz96VcDGa+LOhYr/CvXZxN7z4FHG2+3Ww8WYRhZzURZbVJSPauszgiz/h/vBHEZC2uDDIPR5cLnIIeLhMK1bnBfhpO+qg6kIzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVZRR6SDcWb+1g5LiD7/HTTuwOxZ+FQf03TZDZVURN4=;
 b=CCYdupG62X3HnKfC5M6T12waCfLdKXDA4U7Ph+L73HLyswrYGt0uL4NwkMX1XFx0Nwz+X7hh5npwi7uRl+vMu7paQa5Iq9xuM7uNAepPC+xzf8AVOQ3ZuRIf5wXYdTzW8LMQPkLwmWXt4rVkD1+WLKRIKwr2uNc2jirGc1A2xhZ7ogxKckCYffJg7DO3qeurovKup5QdQxGFKR2B79yeQyDW9xpkIMc842duznybPaY3blsTfU/lVI9J4uSTCH35rvMPEcx/LULbuKqjcfo+arsoZKDZqMWrhawgVa1/CRF/sicjGmFXFDTFqymioxemnScK7/dPl/2DSA/bKcEhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND
Thread-Index: AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiA=
Date: Thu, 9 Nov 2023 10:15:52 +0000
Message-ID:
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
In-Reply-To: <b125da70-a769-4662-876b-43664e39c976@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4485:EE_
x-ms-office365-filtering-correlation-id: abfa428c-7a06-4902-0518-08dbe10cda4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aX597euM7k+KNFjGDk2mDuL9nwMfdVnvpGPFuv/uq6KlOBczXDCek9POPtD1GdFr9OxHdmxCFtId6iwegRFKWoBpv1nPzpYWl0esftAStL/V4AalyJVml0toBHWe8CHj1N9y8WtyUyQO1Av6wYBqeo/6BkRl+eeWWmX4gJ9uu7xLa5FieEZsEG9VMN9acEP6VFhTy90oaYxudyPuwlpcxdos+K7NVzFDdb2V0N2XO6fYHL27FrQc8VL7Nb4j5gZeoZnOpauYMGAoXWoHZ6dHJBd1ItwP7f0NRPfjxakFUQwawfh58ws79ko87szfx74bXe9K71+3hfxBnkLsERSQ0UEpIJPKiP/ww29XuImJ4kmRdYCqlI9aPTKw+uynbQk8NkE+jzgdLkYECUenbYM0fXGP4Qzl9CmdncQ1ooFxRSJEFJeSxdxm+GJOGPJGwNcrYUeQ+1u91Pqb9xrIW4QZ98LinHXG9O9gXUxv7bn8+5VyVRfnD47mCD5TUzy9sLTU81cHGMKZc5BQIKWPlLLfkbl4ObsJoH2jjqziNxHa6a3MVLAqg0Pd81PmQeyCpjLiYhazGDaCRSGDuNYI2XlAF3nxnU70NFMsWTA/R1KprEwSjtlZGzQRc553pf70cYpQTWiKid+MU1fUAD36SfPxFQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(15650500001)(2906002)(86362001)(38070700009)(33656002)(5660300002)(122000001)(41300700001)(478600001)(8936002)(53546011)(83380400001)(4326008)(8676002)(9686003)(55016003)(64756008)(66446008)(54906003)(76116006)(66946007)(66476007)(66556008)(110136005)(71200400001)(7696005)(316002)(6506007)(52536014)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFR4Tk4vL0xNcE9URTdSWldjM1U4MGFoVkkySFBqNDlRRGtLb1FWcmJvRkt4?=
 =?utf-8?B?S3BNajlJQU84ZktmaEJRcFJYaFoyZXJFSW9hQWZaY3Q0SE1RZ1lFR1lLWGR3?=
 =?utf-8?B?K05YOEhnVk5JYmhRM3ZmeVM5NVpuK0swelMyaklOK0FkQ21WeTl5MldPZVBZ?=
 =?utf-8?B?cUZyUTN0YkUwWEVJYlFiYXo1ak5hRkN1UlNrdmFGMjJGckxRWFFON2NRdzBT?=
 =?utf-8?B?emh4RmFWU1ZTbDV1VGp2VmJoc2tmMm9uNEV3b1kwSTREKzdZZ0ZXcWVQS0Jw?=
 =?utf-8?B?aEtkTWFkRlQ1WjJzSEczbDI3UGVnWkp1SW1ubUJYNjFVdTRORWFyeTZSZkF1?=
 =?utf-8?B?am4xN25ZT2o4SEdJN1ZXc3ZRNXRkVWVXeXhXQ3dRWUJxMVhMQVdsRVVkNFhP?=
 =?utf-8?B?WGJ5S3VwYlFEd0ZTSlhUSHkxa1VDN2s4c3lKcDJzeXU1SnBsU1FiTm8rVFVW?=
 =?utf-8?B?VWxKeW03OElDb3NBRS9pbTJaMEdBMmtMZmtxc3FWYXM0bnpoUENrb3hySy9F?=
 =?utf-8?B?TlVUdXNpQ1BtUWE4cGNOQVVWcmJ6eG9qRTNvY0FhT1pSNVlNTVFBc0ZzdElI?=
 =?utf-8?B?NHBrdVRUQU5ISXY4bTFycVdtWGlLa1dETGw3dTFzM0IvbzdEa251TlpYcnNQ?=
 =?utf-8?B?dXpNczNSbDBNbjMvL3lBVmpUN054a3p4dHhDeHB4M3picmhqd2o3eHFUdEMz?=
 =?utf-8?B?c3VGOHZKc3M0MFVSMmNDNFJqd0w5RHZUYlpYWjBzZ1JKNU1Md1FSR0hJL1hG?=
 =?utf-8?B?ZHFONytWTHk0eTZnVzk4TkMwQjlXc2pvVmJLZUtFd2lOMVdoNXZtWWFjMUtr?=
 =?utf-8?B?dVQxLzNLbWtubDNYTmMvemRDYkhUM0V4QURCQWpIS1NxbnRNWWxzd1hTSE9y?=
 =?utf-8?B?SFdDTG95a28xdVluVE9EL25ucEJQRUk0S0sxUHROWGRaMngxenBvZEVDVUFQ?=
 =?utf-8?B?OHRLeVVsQlFzbXRYTGJ6TEx2L043N1FnaC9XbkM1L2hzSmxmSXFXQ3A2LzAx?=
 =?utf-8?B?L3NmWUUxbFZwRVp0c1hSRnBoaEk0Z0tXcWhDRU9raWdZcEp2bDBoYUtleVA5?=
 =?utf-8?B?dGJQUlQySUxraEwrVlZiTW05Z3ZxNFVZZnRoOHVNM013VVAxN01RWTVCdUkz?=
 =?utf-8?B?ZHQxN0xmcFVvRzZJbkVRRVZ6Y09IWEgzOXQyOEpVTUF3QzE0ajY2WVd5Z0dK?=
 =?utf-8?B?TDdiYk1KRG40bjdObGVNZDBmSjUxcC9SdEo0NjB2aVFiSjNPZUg0akpueDN0?=
 =?utf-8?B?eG5ZbDZDWDVNV3ozN3ZVbTVPOVA0ZU9neUwydU9uemlCbVVjYTErWFZsWEJL?=
 =?utf-8?B?Q0tFVE04WjBEUDlaMk5MdWlVMHV3a2tDK09RRzlodlBXT1JER2NUQmNOaTBn?=
 =?utf-8?B?T0JRajlPUG8zVWhHMWxIZVhzUFZBTWE1VVJPRnRkQVZtam9renhtUjNpTndH?=
 =?utf-8?B?U1F1N0krcDR2WktIbENhME9wU0k0TGVhN2YweFoweWEvZ3pLU3EyQ3dwUnVu?=
 =?utf-8?B?c0V0K2lHN2JhS2xIZzJVbm5odTRkYTdRZk56UE9hRHFVdDV1bEpYek9wOWRu?=
 =?utf-8?B?NzEvaWFhSnVwUFhOVkZ5V0pNMXRhSGNSY2lPbVV0Rit3UjRUbEhNcjFMdmVQ?=
 =?utf-8?B?aTlSSjR5aFFxWDEzblFjYUkrcU5scG5xUk5tbG1uMk42ZzVPNjE0WlBGOHRK?=
 =?utf-8?B?VU81dXFGQThOeVlSb1VlbkJoVDZ4UnBkTFpxOU5KUFI3ZlpmeE1QSlE2Ykpw?=
 =?utf-8?B?SFlTZzBnbFphTlBtR0VZYlN4Sll3dmFjb3A2d2lwenhZZXVXMER0UkpTY3hl?=
 =?utf-8?B?UkhZYnhZL0RLbnB0NXozUnBRVmI5TWtnQTQ5SHZHSTZsOFBJbkgzOXJFdlhk?=
 =?utf-8?B?bWw5TlZSaER2NEdFYTl0T0NsT3RSckFJclZuZUV1UnJRcG11ZGhpaWtsT1Za?=
 =?utf-8?B?ZmN3RVcyZnZKak1HOTYxSlkvVEhmdUpIR0VVcUhTb01vdk53THU4WmptMU5F?=
 =?utf-8?B?WldDOS9TODA3UlBiS0w4Z0lpdE5qOC82ZVN1ZUtBQWhQcTBEb1ZMWDB4T0FR?=
 =?utf-8?B?U0pDd3Y4aTdrVnVNaE5ZSDJGSkp5SlhDRHZRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfa428c-7a06-4902-0518-08dbe10cda4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 10:15:52.1454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyydFZgf6j/gRFlVO1W6rBqkXVLE574dPZUYvmpvKrLKIiBDvvwxZNGoO/Y35IeQwECq5/gyQQ76HWDDW29/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
Subject: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIzIDM6MjggUE0NCj4gDQo+IE9uIDExLzkvMjAyMyAx
OjQ2IEFNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gT24gVHVlLCBOb3YgMDcsIDIw
MjMgYXQgMDU6Mjc6MjNQTSArMDgwMCwgWmh1LCBMaW5nc2hhbiB3cm90ZToNCj4gPj4NCj4gPj4g
T24gMTEvNi8yMDIzIDU6NDkgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+IE9u
IEZyaSwgTm92IDAzLCAyMDIzIGF0IDA2OjM0OjM0UE0gKzA4MDAsIFpodSBMaW5nc2hhbiB3cm90
ZToNCj4gPj4+PiBXaGVuIFNVU1BFTkQgaXMgc2V0LCBkZXZpY2Ugc3RhdGVzIGFuZCB2aXJ0cXVl
dWUgc3RhdGVzIHNob3VsZCBiZQ0KPiA+Pj4+IHN0YWJsaXplZCwgdGhlcmVmb3JlIHRoZSBkcml2
ZXIgc2hvdWxkIG5vdCByZXNldCB2cXMgd2hlbiBTVVNQRU5EDQo+ID4+Pj4gaXMgc2V0IGluIGRl
dmljZSBzdGF0dXMuDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4g
PGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gICAgY29udGVudC50
ZXggfCAzICsrKw0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4g
Pj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9jb250ZW50LnRleCBiL2NvbnRlbnQudGV4IGluZGV4
IGJjYzlkNGIuLjA2MGI1YzINCj4gPj4+PiAxMDA2NDQNCj4gPj4+PiAtLS0gYS9jb250ZW50LnRl
eA0KPiA+Pj4+ICsrKyBiL2NvbnRlbnQudGV4DQo+ID4+Pj4gQEAgLTQ0NCw2ICs0NDQsOSBAQCBc
c3Vic3Vic2VjdGlvbntWaXJ0cXVldWUgUmVzZXR9XGxhYmVse3NlYzpCYXNpYw0KPiBGYWNpbGl0
aWVzIG9mIGEgVmlydGlvIERldmljZSAvDQo+ID4+Pj4gICAgVGhlIGRldmljZSBNVVNUIHJlc2V0
IGFueSBzdGF0ZSBvZiBhIHZpcnRxdWV1ZSB0byB0aGUgZGVmYXVsdCBzdGF0ZSwNCj4gPj4+PiAg
ICBpbmNsdWRpbmcgdGhlIGF2YWlsYWJsZSBzdGF0ZSBhbmQgdGhlIHVzZWQgc3RhdGUuDQo+ID4+
Pj4gK0lmIFZJUlRJT19GX1NVU1BFTkQgaXMgbmVnb3RpYXRlZCBhbmQgU1VTUEVORCBpcyBzZXQg
aW4NCj4gPj4+PiArXGZpZWxke2RldmljZSBzdGF0dXN9LCB0aGUgZHJpdmVyIFNIT1VMRCBOT1Qg
cmVzZXQgYW55IHZpcnRxdWV1ZXMuDQo+ID4+Pj4gKw0KPiA+Pj4+ICAgIFxkcml2ZXJub3JtYXRp
dmV7XHBhcmFncmFwaH17VmlydHF1ZXVlIFJlc2V0fXtCYXNpYyBGYWNpbGl0aWVzIG9mIGENCj4g
VmlydGlvIERldmljZSAvIFZpcnRxdWV1ZXMgLyBWaXJ0cXVldWUgUmVzZXQgLyBWaXJ0cXVldWUg
UmVzZXR9DQo+ID4+Pj4gICAgQWZ0ZXIgdGhlIGRyaXZlciB0ZWxscyB0aGUgZGV2aWNlIHRvIHJl
c2V0IGEgcXVldWUsIHRoZSBkcml2ZXINCj4gPj4+PiBNVVNUIHZlcmlmeSB0aGF0DQo+ID4+PiBT
ZWVtcyBzb21ld2hhdCBhcmJpdHJhcnkgYW5kIGJyZWFrcyB0aGUgY2xhaW0gdGhhdCB0aGUgZmVh
dHVyZSBpcw0KPiA+Pj4gb3J0aG9nb25hbCBhbmQgY2FuIGhhdmUgdXNlcyBiZXNpZGVzIG1pZ3Jh
dGlvbi4NCj4gPj4gd2hlbiBzdXNwZW5kZWQsIHRoZSBkZXZpY2UgaXMgZnJvemVuLg0KPiA+PiBU
aGUgZHJpdmVyIGlzIGF3YXJlIG9mIHRoaXMgcHJvY2VzcyBhbmQgc28gc2hvdWxkIG5vdCByZXNl
dCB0aGUgdnFzIEkgdGhpbmsuDQo+ID4gQWdhaW4gdGhhdCBpcyBvbmx5IHRydWUgYmVjYXVzZSB5
b3Ugd2FudCB0byB1c2UgaXQgZm9yIG1pZ3JhdGlvbi4NCj4gPiBCdXQgdGhlbiB5b3UgY2FuJ3Qg
Y2xhaW0gaXQncyBhIGdlbmVyaWMgZmFjaWxpdHkuDQo+IEkgZG9uJ3QgZ2V0IGl0LiBUaGUgZGV2
aWNlIHN0YXR1cyBpcyBhIGJhc2ljIGZhY2lsaXR5Lg0KPiANCj4gV2UgbmVlZCB0byBTVVNQRU5E
IHRoZSBkZXZpY2UgYnkgc2V0dGluZyBTVVNQRU5EIGJpdCwgdG8gc3RhYmlsaXplIHRoZSBkZXZp
Y2UNCj4gc3RhdGVzIGZvciBtaWdyYXRpb24uDQpJcyB0aGUgUENJJ3MgUE0gdGltZSBub3QgZW5v
dWdoIHRvIHN1c3BlbmQgdGhlIGRldmljZT8NCkZvciBsYXJnZSBkZXZpY2UgSSBjb3VsZCBpbWFn
aW5lIGl0IGNvdWxkIGJlIHNob3J0Lg0KDQpJbiB0aGF0IGNhc2UgaWYgdGhlcmUgaXMgc3VzcGVu
ZCB0aGUgZGV2aWNlIGF2YWlsYWJsZSwgaXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSBndWVzdCBkcml2
ZXIgaXRzZWxmLCBoeXBlcnZpc29yIHdvdWxkbuKAmXQga25vdyBhYm91dCBpdCB3aGVuIHRob3Nl
IHJlZ2lzdGVycyBhcmUgbm90IHRyYXBwZWQuDQpTbyB3ZSBuZWVkIHR3byB3YXlzIHRvIHN1c3Bl
bmQuDQpPbmUgaXMgZ3Vlc3QgdmlzaWJsZSwgYW5kIGd1ZXN0IGNvbnRyb2xsZWQuDQpTZWNvbmQg
aXMgaHlwZXJ2aXNvciBjb250cm9sIHRvIGZ1bGZpbGwgdGhlIGRldmljZSBtaWdyYXRpb24gbmVl
ZHMuDQoNClNvIGlmIHlvdSBjYW4gcGxlYXNlIHRha2UgYSBsb29rIGlmIHRoZSBwcm9wb3NlZCBh
ZG1pbiBjb21tYW5kIHRvIGZyZWV6ZS9zdG9wIG1vZGUgY2FuIGJlIHVzZWQgaW4gdGhlIGVtdWxh
dGVkIHJlZ2lzdGVyIGNhc2Ugb3Igbm90Lg0KSXQgaGVscHMgdG8gaGF2ZSB0aGUgc3VzcGVuZCBi
aXQgaW4gZ3Vlc3QgY29udHJvbCBhcyB3ZWxsIHdpdGgvd2l0aG91dCBlbXVsYXRpb24gbW9kZS4N
Cg0KPiBUaGlzIGNhbiBhbHNvIGJlIHVzZWQgZm9yIGRlYnVnZ2luZyBJIHRoaW5rLg0KDQpBcyBN
aWNoYWVsIGxpc3RlZCwgYSBkZWRpY2F0ZWQgZGVidWcgaW50ZXJmYWNlIGlzIHVzdWFsbHkgbW9y
ZSB1c2VmdWwgaW5zdGVhZCBvZiBpbi1iYW5kLg0K

