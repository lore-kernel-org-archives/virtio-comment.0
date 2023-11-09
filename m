Return-Path: <virtio-comment-return-8296-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D3C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:11:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D4EB26A47
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:11:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5FA0E986CDF
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:11:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 47E28986CCD; Thu,  9 Nov 2023 10:11:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39363986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 10:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpdT4+cgeBS2K4wWf3JQmZOz9KCGaryNX2n01w6eLJQLqDevIT22EGOvKUb1HK7w810YjdJR6B2PgqSdrWIRsQeyvCpIHEZeHtGTRfXdWk85yLuhqLLcUI7fUeZaVaBgBKeJ8bLNxUluDb0CCbjtV7bcCFFZKY3d/h7n0w1fNcaG8v6Mt8By2pOxjSCt8CgyAWmRRtCYnpjSopqrJcJ3KSeDH+5QNCG9zvr+w7M+NoUNC1dB9MGx5wa9Jdt4/hGDCO5itCT02VH4FHVy/vnHoXXY5mSB7755ZBr7+F+BrOaP/AxQX+Ddm5zhzH6FnSgCJ80aSkzOapmJS8SC8GnLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsdHiG5AX+yPiRLaviEEc8NaJstFerPYYMTkAJloZP0=;
 b=BL5KZIMdHXeXDthV6Sa/ryFEvQXW8faKC+nHIE0JxsgRA5pjhU2XUYQ0ZRdYRCB+RRD9DXfs5/bZrQSX3jsU3ITOtBCYvFvz3G7w4Dwdi1J2rs91iEMuJCoY2W/QJ/u5qqbpsBq/hrocbZEJL4sjik8ZZV0wVkfXYo2XbgrdqNLtOrRlrw96LTwh0zuf1dFz9ejqLbTJu3dpUUjj0YN+Fgoop1Pg5cXp5Drm07G5c6Rk2o7A9GJ4tPnrKM5oeomNcJRTx+QZnv9453Fly2pkIrp1uEFAfMqs1srsxj3k7C9rJg5EhtNNW6Gra9fGSV9pq2FdumR1GWpAFyjt0x7nCg==
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
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAOMuAgAAHrCCAAAxUAIAAAwAQ
Date: Thu, 9 Nov 2023 10:11:23 +0000
Message-ID:
 <PH0PR12MB5481BC48C49660416BA65283DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
 <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231109033838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811CEC8B65FFA26FCA30A6DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231109044925-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231109044925-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH8PR12MB6673:EE_
x-ms-office365-filtering-correlation-id: 90d6f677-4ab1-435b-f291-08dbe10c39ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WJ7oy2xyDBcNwL4kx0kNbHwzu58csE4N9UqIMQjPx+Wgshw4KDvU9gmEPe6bzovd8sfeqzI4hF82gKcniEGZN+aM4X4UfvtmMCGtGDaxCho6eap4u/4NCygsxAS4YBYW6/H6GcGk8SBWYEw0lp67KR6O82tMdS9OeylWAa1rv4JHr1m4qNXGW1oedo67xpf5FdoeV8vw6gHi8Y3JWI4jtuH3/wuipNB85/4Q3UqrDO9UpqoAdNQ+UKPuF8UQ3Ualg413UKdQ5JnP220OVih35l6epXQYdAYlOT4W3P1+9mLgtMKb71jO2EWKJO+5f4TutjhpS2juvdfDiLqrjvck5bAOL6M54SC7MKH3DAb/O8WKpqjgwU2eCTfk5L0Io0lpOVTCElDRGWL9Dlm4F29Ta9Qb846HODjlSh7JwcbmwYJMq0SH7NbbqBTx8QXuKvecrUsR4Dl+GYmr795elLzng8iYaWgihVPzWc6BV0T7IXbo2f+GwpL0O3sBABFCgjpZ44yWZhQ2LQs0OfCrdNViqxRPLz45tUK4Oi1aIkNjn+M2JTchPY7dbISCj2Ov0xX01ke/uV4Hq1aNZXS9q7swnlu9b5utrNUyJYWTmssTprdu1BR3VBhHgpa9ScJe+x4f
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(9686003)(122000001)(52536014)(478600001)(64756008)(66446008)(66476007)(54906003)(76116006)(66556008)(316002)(38070700009)(6916009)(53546011)(7696005)(6506007)(71200400001)(66946007)(8676002)(5660300002)(4326008)(55016003)(2906002)(8936002)(41300700001)(33656002)(83380400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODRLRExrZHRHeFVTemhINTMwK1QyZkloTnBHNStHZXM4QVZ5MzZhZklGbkJu?=
 =?utf-8?B?eWoxNHF2ZHlCUlJ6MTVqVWZ6YWpGZTArelNPeVBwZ2lsVkRQaGhKSVg0Z2hH?=
 =?utf-8?B?KzE1NUtTbXI5MFZYN1NUOFJQYm5XVXAvRUVtQWFxdDdnUU12Ung5LzhqN0dz?=
 =?utf-8?B?ekZxRVZLQ2ZNQWtjMW1EY0ZzVmZFTjFGNVdZN2VGY2IzaFR5enZKZFJzaEhL?=
 =?utf-8?B?R0pJdmVvbFg4c1g2RDJ3YWNvQkRiYmswdVdaaTYxeHNFeHh5NWFlR3J1dlF3?=
 =?utf-8?B?Rkh3VVRNQk1jWk5kdzJ5dCtqZk5BZEUxWXlvOXJSWDVjTDB0eEM1b0VSZzRR?=
 =?utf-8?B?eGp3Q0JRWFBqL0xmQ1JTNWdjNmc0NnQ5aDlqaG5FV0F4UTBEMXNUSVdpUnJZ?=
 =?utf-8?B?a2l0QXVxd3hjUnRFTFpGYWhPanhocFV5M3hNNjhTaGRGRG5NVWMvQmZ6V0s0?=
 =?utf-8?B?UElRUllCbjRJSkMzQlVOUXpXdWxtNVZFb2FtYXVXTS8yM1NFcUtNR0drMTB5?=
 =?utf-8?B?K0szUGE1bXhsL2NaR1pXRkhTY2FLMmJtak9XUnBSd2VaSTgxc1hVUktXZ3o1?=
 =?utf-8?B?YU1vRjhzSkZZZ1VQeCs4bUJDSGg0S2NhNmt0L0M5NVU2eC9EVDM2YVFOMFFy?=
 =?utf-8?B?b2d3NFhraDE0U095UlJWekErU0NLMXloMlRNZ1d3dG1NSXh1Q1VnaWtuRUpk?=
 =?utf-8?B?bTh5RjlOcCtBaHBZa2xTVGVyVDZ4bXZvNnhlSHRsc3hkRTVpeUVIVmpLWWxS?=
 =?utf-8?B?R0pUYldlT2taWWRETFVZd1poWTRlUVBqR3ZUWnRDb2JoSEQxK1FGV3ZrRDUr?=
 =?utf-8?B?TDdHSHlEL3k5MUFFVVBqVmN4dkZxUFhISjVNaGxORlNOU1BoL0FwQXlLUWFo?=
 =?utf-8?B?NG5NZGdYVVBVamZtYm1iVXdmUGtqeUxjdVlZUWd1UTBJdEF4VWJzdUhkL1FL?=
 =?utf-8?B?R2xBNks2YnlZcWNrUTYxQWdlMFhDZGhhcmhPRHFDM2c4MlA4cndMajZTZzJp?=
 =?utf-8?B?akhjMVJMTUMxSzJXenBxb2xReWo0YkVSNlN4MGQvd0tYUjdVVXRkc0VTL2xO?=
 =?utf-8?B?cmJkblRhMkN0L3pQOXBlaVdsU0ZNeHdoWVRNTnRJdjlOSzNzWUd3bWU5eVkv?=
 =?utf-8?B?Qm9PZncyR3ZOZThkc0w5Wm9BTHZGTFFoNDg5ZkpDcFpDY1hhcGVoNCtNNVdz?=
 =?utf-8?B?clJOWTBudW92bFRIY3EvREFTZkZ4UGZ0d24zdlpCRXFqNWRCaUNsaFd0YUUr?=
 =?utf-8?B?azMybHhubU12WDRTbzJIZlhDR1pIakZjOW1mbGNxODJVeFkzbitqM1UvL0dE?=
 =?utf-8?B?OXlYWkJnand4eHcyb3NOQzhMUWIrby96NWlkSXFuWUQ0QkRNZW1xdG5FUnlW?=
 =?utf-8?B?MklYUmFSSk5UcERPY0xwQVFoQ2J0aG8vTTBySElnTEVIQ2EydmFrakp3YXl6?=
 =?utf-8?B?akFyd2NETS9hajBkMU9jVndzOXJ6QXVPUlV1VzI5SjMrbjN5VEdyNWtQRmJm?=
 =?utf-8?B?UEZTallHdlF1V0ZpUmIxTU9xRzRmcitRWWVTV00rZndNK2hMdkovSFBGUklr?=
 =?utf-8?B?eVM4WDdvYTBXbzZ5Q2FZbC9tQ29XUUg1TUFyNFZjUGxTR0pMU3RkNHhCd3Fw?=
 =?utf-8?B?N05aR1N4TnlpL2tHL1JCUm9DV0ptazlhbFhsdHVUbklHN3lMYWJCaFlTWkI4?=
 =?utf-8?B?QiszejNnM0V1WWVlRWVuUWlpd3hxQWFoUEpxYmRBSEQ5WUpkTjdIWExuMUc2?=
 =?utf-8?B?OW1NZURLa0t0ZmtQT2lUNXdXbFhCY2VxUVNkOGIrRnpJcTJCYmdMN2RSeHY2?=
 =?utf-8?B?VDk5VGpmRStPdExFbklJTjREWXNmdkg2UnpxNjVVOVVrYUdLcFNRVnRWQWVa?=
 =?utf-8?B?RUxnZGk4dkhvcDQrVUV4UWpFUDBpaE5reWRxdGRoZElnUXIvUStldXF2Um13?=
 =?utf-8?B?VEU5a2FqYXZPZHVzUTk2TzBmeEUrNElXODFXUWk2RTJxa1lWWEVYY2RkL01j?=
 =?utf-8?B?dEQ2V0dUc0lnRVpQVEJlS01vN2ViTzkvLzRuMkVTU1Q5aGtCWDQxcDVYK2tP?=
 =?utf-8?B?Y3FkQkpZdUxjTWxTMk9xYTJvQ1l0Y045UCt2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d6f677-4ab1-435b-f291-08dbe10c39ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 10:11:23.0814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Bzlu9pujrIcI28dDNmb1DIAKVvkzbrUUcJd1vVSgRCB212U18WCLEmRb/faKeRMxJoQVxyutYcoByaPqZtHmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIzIDM6MjMgUE0NCj4gVG86IFBhcmF2IFBhbmRpdCA8cGFy
YXZAbnZpZGlhLmNvbT4NCj4gQ2M6IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5j
b20+OyBqYXNvd2FuZ0ByZWRoYXQuY29tOw0KPiBlcGVyZXptYUByZWRoYXQuY29tOyBjb2h1Y2tA
cmVkaGF0LmNvbTsgc3RlZmFuaGFAcmVkaGF0LmNvbTsgdmlydGlvLQ0KPiBjb21tZW50QGxpc3Rz
Lm9hc2lzLW9wZW4ub3JnDQo+IFN1YmplY3Q6IFJlOiBbdmlydGlvLWNvbW1lbnRdIFJlOiBbUEFU
Q0ggVjIgNC82XSB2aXJ0aW8tcGNpOiBpbXBsZW1lbnQNCj4gVklSVElPX0ZfUVVFVUVfU1RBVEUN
Cj4gDQo+IE9uIFRodSwgTm92IDA5LCAyMDIzIGF0IDA5OjEwOjU1QU0gKzAwMDAsIFBhcmF2IFBh
bmRpdCB3cm90ZToNCj4gPg0KPiA+ID4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIzIDI6MTIgUE0N
Cj4gPiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAwOSwgMjAyMyBhdCAwNjoyODoxN0FNICswMDAwLCBQ
YXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+ID4gPj4gVGhlIHJlZ2lzdGVycyBhcmUgY29udHJv
bCBwYXRoIGluIGNvbmZpZyBzcGFjZSwgaG93IDQwMEcgb3IgODAwRw0KPiBhZmZlY3Q/Pw0KPiA+
ID4gPiA+ID4gQmVjYXVzZSB0aG9zZSBhcmUgdGhlIG9uZSBpbiBwcmFjdGljZSByZXF1aXJlcyBs
YXJnZSBudW1iZXIgb2YgVlFzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFlvdSBhcmUgYXNr
aW5nIHBlciBWUSByZWdpc3RlciBjb21tYW5kcyB0byBtb2RpZnkgdGhpbmdzDQo+ID4gPiA+ID4g
PiBkeW5hbWljYWxseSB2aWENCj4gPiA+ID4gPiB0aGlzIG9uZSB2cSBhdCBhIHRpbWUsIHNlcmlh
bGl6aW5nIGFsbCB0aGUgb3BlcmF0aW9ucy4NCj4gPiA+ID4gPiA+IEl0IGRvZXMgbm90IHNjYWxl
IHdlbGwgd2l0aCBoaWdoIHEgY291bnQuDQo+ID4gPiA+ID4gVGhpcyBpcyBub3QgZHluYW1pY2Fs
bHksIGl0IG9ubHkgaGFwcGVucyB3aGVuIFNVU1BFTkQgYW5kIFJFU1VNRS4NCj4gPiA+ID4gPiBU
aGlzIGlzIHRoZSBzYW1lIG1lY2hhbmlzbSBob3cgdmlydGlvIGluaXRpYWxpemUgYSB2aXJ0cXVl
dWUsDQo+ID4gPiA+ID4gd29ya2luZyBmb3IgbWFueSB5ZWFycy4NCj4gPiA+ID4gTm8uIHdoZW4g
dmlydGlvIGRyaXZlciBpbml0aWFsaXplcyBpdCBmb3IgdGhlIGZpcnN0IHRpbWUsIHRoZXJlIGlz
DQo+ID4gPiA+IG5vIGFjdGl2ZSB0cmFmZmljDQo+ID4gPiB0aGF0IGdldHMgbG9zdC4NCj4gPiA+
ID4gVGhpcyBpcyBiZWNhdXNlIHRoZSBpbnRlcmZhY2UgaXMgbm90IHlldCB1cCBhbmQgbm90IHBh
cnQgb2YgdGhlIG5ldHdvcmsgeWV0Lg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgcmVzdW1lIG11c3Qg
YmUgZmFzdCBlbm91Z2gsIGJlY2F1c2UgdGhlIHJlbW90ZSBub2RlIGlzIHNlbmRpbmcNCj4gPiA+
IHBhY2tldHMuDQo+ID4gPiA+IEhlbmNlIGl0IGlzIGRpZmZlcmVudCBmcm9tIGRyaXZlciBpbml0
IHRpbWUgcXVldWUgZW5hYmxlLg0KPiA+ID4NCj4gPiA+IE1heWJlIGJ1dCBJIHRoaW5rIG5vdCBx
dWFsaXRhdGl2ZWx5IGRpZmZlcmVudC4NCj4gPiA+IElmIHlvdSBjYXJlIGFib3V0IHRoZXNlIHRo
aW5ncyBwbGVhc2UgcHJvdmlkZSBzb21lIGVzdGltYXRlcy4NCj4gPiA+IEkganVzdCBkb24ndCBz
ZWUgaG93IHF1ZXVlIHJlc3VtZSB3cml0ZXMgZXZlbiB3aXRoIDY0ayBxdWV1ZXMgd2lsbA0KPiA+
ID4gc2F0dXJhdGUgYW4gZXhwcmVzcyBsaW5rLg0KPiA+ID4NCj4gPiBJdCBpcyBub3QgdGhlIGJ3
IG9mIHRoZSBsaW5rLg0KPiA+IEl0IGlzIGhvdyB0aGUgbmVlZCBmb3IgdGhlIGRldmljZSB0byBi
ZSBhbHdheXMgcmVhZCB0byBzdXNwZW5kIHRob3NlIG1hbnkNCj4gcXVldWVzIHRocm91Z2ggcmVn
aXN0ZXIgaW50ZXJmYWNlLg0KPiANCj4gcmVhZC0+cmVhZHk/DQo+IA0KPiBJZiB3ZSB3YW50IHRv
IHdlIGNhbiBzb2x2ZSBpdCBidHcuIFByb2hpYml0IGNoYW5naW5nIHF1ZXVlIHNlbGVjdCB3aGls
ZSBzdXNwZW5kDQo+IGlzIGluIHByb2dyZXNzLg0KPiANCj4gQnV0IG1vcmUgaW1wb3J0YW50bHkg
b25jZSBaaHUgTGluZ3NoYW4gc3RvcHMgYXJndWluZyBhYm91dCBzdXNwZW5kIGJpdCBoZSdsbA0K
PiBob3BlZnVsbHkgd29yayBvbiB0cmFuc3BvcnQgdnEuIFRoZW4gd2UgY2FuIGhhdmUgaXQgaW4g
Y29uZmlnIHNwYWNlIGFuZCBhdCB0aGUNCj4gc2FtZSB0aW1lIG5vdCB1c2UgdXAgYSByZWdpc3Rl
ci4NClRyYW5zcG9ydCB2cSBvbiB0aGUgb3duZXIgZGV2aWNlIGZvciBsb25nIHRlcm0gZG9lcyBu
b3QgbWFrZSBzZW5zZSBhcyBoeXBlcnZpc29yIHNob3VsZCBub3QgYmUgaW52b2x2ZWQgaW4gdmll
d2luZyB0aGlzIGNvbnRlbnQgZnJvbSBURElTUCB0aW1lLg0KU28gY3ZxIG9mIHdoYXRldmVyIHZx
IHdlIHdhbnQgdG8gY2FsbCBmcm9tIHRoZSBtZW1iZXIgZGV2aWNlIHdpbGwgYmUganVzdCBwZXJm
ZWN0Lg0KQW5kIGl0IHdpbGwgYmVoYXZlIGxpa2UgYW55IG90aGVyIHF1ZXVlcy4NClRoaXMgd2ls
bCBiZSB1bmlmb3JtbHkgYXZhaWxhYmxlIGZvciBWRiwgU0lPViwgUEYgZGV2aWNlcyByZWdhcmRs
ZXNzIG9mIFRESVNQIGFuZCB3aXRoIFRESVNQLg0KVGhpcyBzb2x2ZXMgYm90aCB0aGUgc2NhbGUg
aXNzdWUgYW5kIHNlY3VyaXR5IGlzc3VlLg0KDQpIZW5jZSAzIHNvbHV0aW9ucywNCjEuIHRyYW5z
cG9ydCB2cSBmb3IgVkYgdXNpbmcgb3duZXIgZGV2aWNlIGZvciBwdXJwb3NlIG9mIGRldmljZSBt
aWdyYXRpb24NCjIuIG5vdCB1c2luZyBpdCBhbmQgaW52ZW50aW5nIGFub3RoZXIgVlEgZm9yIFRE
SVNQIGluIGZ1dHVyZSBhbmQgZm9yIFBGLCBWRiwgU0lPViBhbmQgVERJU1AgaXMgb3ZlcmtpbGwu
DQoNCkFsbCB0aGUgb3BlcmF0aW9ucyBvZiB0aGUgbGl2ZSBtaWdyYXRpb24gZHJpdmVyIGxpa2Ug
c3VzcGVuZCBkZXZpY2Ugb3Igb3RoZXJzLCBzZWVtcyBkb2FibGUganVzdCBmaW5lIHVzaW5nIG93
bmVyIGRldmljZS4NCldoYXQgaXMgbWlzc2luZz8NCg0KPiANCj4gDQo+ID4gPg0KPiA+ID4gPiA+
ID4+IFNlZSB0aGUgdmlydGlvIGNvbW1vbiBjZmcsIHlvdSB3aWxsIGZpbmQgdGhlIG1heCBudW1i
ZXIgb2YNCj4gPiA+ID4gPiA+PiB2cXMgaXMgdGhlcmUsIG51bV9xdWV1ZXMuDQo+ID4gPiA+ID4g
PiA6KQ0KPiA+ID4gPiA+ID4gU3VyZS4gdGhvc2UgdmFsdWVzIGF0IGhpZ2ggcSBjb3VudCBhZmZl
Y3RzLg0KPiA+ID4gPiA+IHRoZSBkcml2ZXIgbmVlZCB0byBpbml0aWFsaXplIHRoZW0gYW55d2F5
Lg0KPiA+ID4gPiBUaGF0IGlzIGJlZm9yZSB0aGUgdHJhZmZpYyBzdGFydHMgZnJvbSByZW1vdGUg
ZW5kLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+Pj4gRGV2aWNlIGRpZG7igJl0
IHN1cHBvcnQgTE0uDQo+ID4gPiA+ID4gPj4+IE1hbnkgbGltaXRhdGlvbnMgZXhpc3RlZCBhbGwg
dGhlc2UgeWVhcnMgYW5kIFRDIGlzIGltcHJvdmluZw0KPiA+ID4gPiA+ID4+PiBhbmQgZXhwYW5k
aW5nDQo+ID4gPiA+ID4gPj4gdGhlbS4NCj4gPiA+ID4gPiA+Pj4gU28gYWxsIHRoZXNlIHllYXJz
IGRvIG5vdCBtYXR0ZXIuDQo+ID4gPiA+ID4gPj4gTm90IHN1cmUgd2hhdCBhcmUgeW91IHRhbGtp
bmcgYWJvdXQsIGhhdmVuJ3Qgd2UgaW5pdGlhbGl6ZQ0KPiA+ID4gPiA+ID4+IHRoZSBkZXZpY2Ug
YW5kIHZxcyBpbiBjb25maWcgc3BhY2UgZm9yIHllYXJzPz8/Pz8/IFdoYXQncw0KPiA+ID4gPiA+
ID4+IHdyb25nIHdpdGggdGhpcw0KPiA+ID4gbWVjaGFuaXNtPw0KPiA+ID4gPiA+ID4+IEFyZSB5
b3UgcXVlc3Rpb25pbmcgdmlyaXRvLXBjaSBmdW5kYW1lbnRhbHM/Pz8NCj4gPiA+ID4gPiA+IERv
buKAmXQgcG9pbnQgdG8gaW4tZWZmaWNpZW50IHBhc3QgdG8gZXN0YWJsaXNoIHNpbWlsYXIgaW4t
ZWZmaWNpZW50IGZ1dHVyZS4NCj4gPiA+ID4gPiBpbnRlcmVzdGluZywgeW91IGtub3cgdGhpcyBp
cyBhIG9uZS10aW1lIHRoaW5nLCByaWdodD8NCj4gPiA+ID4gPiBhbmQgeW91IGFyZSBhd2FyZSBv
ZiB0aGlzIGhhcyBiZWVuIHRoZXJlIGZvciB5ZWFycy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
Pj4+Pj4+IExpa2UgaG93IHRvIHNldCBhIHF1ZXVlIHNpemUgYW5kIGVuYWJsZSBpdD8NCj4gPiA+
ID4gPiA+Pj4+PiBUaG9zZSBhcmUgbWVhbnQgdG8gYmUgdXNlZCBiZWZvcmUgRFJJVkVSX09LIHN0
YWdlIGFzIHRoZXkNCj4gPiA+ID4gPiA+Pj4+PiBhcmUgaW5pdCB0aW1lDQo+ID4gPiA+ID4gPj4+
PiByZWdpc3RlcnMuDQo+ID4gPiA+ID4gPj4+Pj4gTm90IHRvIGtlZXAgYWJ1c2luZyB0aGVtLi4N
Cj4gPiA+ID4gPiA+Pj4+IGRvbid0IHlvdSBuZWVkIHRvIHNldCBxdWV1ZV9zaXplIGF0IHRoZSBk
ZXN0aW5hdGlvbiBzaWRlPw0KPiA+ID4gPiA+ID4+PiBOby4NCj4gPiA+ID4gPiA+Pj4gQnV0IHRo
ZSBzcmMvZHN0IGRvZXMgbm90IG1hdHRlci4NCj4gPiA+ID4gPiA+Pj4gUXVldWVfc2l6ZSB0byBi
ZSBzZXQgYmVmb3JlIERSSVZFUl9PSyBsaWtlIHJlc3Qgb2YgdGhlDQo+ID4gPiA+ID4gPj4+IHJl
Z2lzdGVycywgYXMgYWxsDQo+ID4gPiA+ID4gPj4gcXVldWVzIG11c3QgYmUgY3JlYXRlZCBiZWZv
cmUgdGhlIGRyaXZlcl9vayBwaGFzZS4NCj4gPiA+ID4gPiA+Pj4gUXVldWVfcmVzZXQgd2FzIGxh
c3QgbW9tZW50IGV4Y2VwdGlvbi4NCj4gPiA+ID4gPiA+PiBjcmVhdGUgYSBxdWV1ZT8gTnZpZGlh
IHNwZWNpZmljPw0KPiA+ID4gPiA+ID4+DQo+ID4gPiA+ID4gPiBIdWguIE5vLg0KPiA+ID4gPiA+
ID4gRG8gZ2l0IGxvZyBhbmQgcmVhbGl6ZSB3aGF0IGhhcHBlbmVkIHdpdGggcXVldWVfcmVzZXQu
DQo+ID4gPiA+ID4gWW91IGRpZG4ndCBhbnN3ZXIgdGhlIHF1ZXN0aW9uLCBkb2VzIHRoZSBzcGVj
IGV2ZW4gaGFzIGRlZmluZWQNCj4gPiA+ID4gPiAiY3JlYXRlIGENCj4gPiA+IHZxIj8NCj4gPiA+
ID4NCj4gPiA+ID4gRW5hYmxlZC9jcmVhdGVkID0gdG9tYXRvL3RvbWF0byB3aGVuIGRpc2N1c3Np
bmcgdGhlIHNwZWMgaW4NCj4gPiA+ID4gbm9uLW5vcm1hdGl2ZQ0KPiA+ID4gZW1haWwgY29udmVy
c2F0aW9uLg0KPiA+ID4gPiBJdCdzIGlycmVsZXZhbnQuDQo+ID4gPiA+DQo+ID4gPiA+IEFsbCBJ
IGFtIHNheWluZyBpcywgd2hlbiB3ZSBrbm93IHRoZSBsaW1pdGF0aW9ucyBvZiB0aGUgdHJhbnNw
b3J0DQo+ID4gPiA+IGFuZCB3aGVuIGluZHVzdHJ5IGlzIGZvcndhcmRpbmcgdG8gbm90IGludHJv
ZHVjZWQgbW9yZSBhbmQgbW9yZQ0KPiA+ID4gPiBvbi1kaWUgcmVnaXN0ZXINCj4gPiA+IGZvciBv
bmNlIGluIGxpZmV0aW1lIHdvcmsgb2YgZGV2aWNlIG1pZ3JhdGlvbiwgd2UganVzdCB1c2UgdGhl
DQo+ID4gPiBvcHRpbWFsIGNvbW1hbmQgYW5kIHF1ZXVlIGludGVyZmFjZSB0aGF0IGlzIG5hdGl2
ZSB0byB2aXJ0aW8uDQo+ID4gPg0KPiA+ID4gd2UgcmVhbGx5IGRvIG5vdCBuZWVkIHRvIHByZW1h
dHVyZWx5IG9wdGltaXplIGFsbCB0aGluZ3MuDQo+ID4gPiBjb250cm9sIHBhdGggaXMgY29udHJv
bCBwYXRoIGl0IGlzIGdvaW5nIHRvIGJlIHNsb3cgYmVjYXVzZSB2aXJ0aW8NCj4gPiA+IGRlc2ln
bmVkIGl0IHRvIGJlIHNsb3cgYW5kIGRyaXZlcnMgZG9uJ3Qgb3B0aW1pemUgaXQuDQo+ID4gPiBT
aGF2aW5nIG9mZiBhIG1pY3Jvc2Vjb25kIGhlcmUgb3IgdGhlcmUgaXMgZ29pbmcgdG8gZG8gbm90
aGluZw0KPiA+ID4gZXhjZXB0IGluY3JlYXNlIG1haW50YWluYW5jZSBjb3N0cy4NCj4gPg0KPiA+
IENvbnRyb2wgcGF0aCBwb3N0IGRldmljZSBpbml0aWFsaXphdGlvbiBmb3IgbGFyZ2UgcGFydCBp
cyB0aHJvdWdoIHRoZSBjdnEuDQo+IA0KPiBSZWFsbHkgZGVwZW5kcyBvbiB0aGUgZGV2aWNlLiBG
b3IgdmlydGlvIG5ldCBtb3N0IG9mIHRoZSB0aW1lIGlzIHNwZW50IG9uIGZpbGxpbmcNCj4gdXAg
cmVjZWl2ZSBxdWV1ZXMgYW5kIHNlbmRpbmcgbmV0d29yayBhbm5vdW5jZW1lbnRzIGFuZCBzdWNo
Lg0KDQpSaWdodCBmb3IgdGhlIHRpbWUuIEJ1dCB0aGUgaXNzdWUgaXMgbm90IGFib3V0IHRoZSB0
aW1lIHNwZW50Lg0KSXNzdWUgaXMgZm9yIHRoZSBkZW1hbmQgb2YgdGhvc2UgcmVnaXN0ZXJzIHdo
aWNoIGFyZSBvZiBubyB1c2Ugd2hlbiBmaWxsaW5nIGxhcmdlIHBhcnQgb2YgZmlsbGluZyByZWNl
aXZlIHF1ZXVlcy4NCg==

