Return-Path: <virtio-comment-return-7638-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DA0CD6112
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 028722AD4B
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB0C4986547
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 17:22:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E14E29864F0; Mon,  9 Oct 2023 17:22:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D33FD9864F3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 17:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3+g1YA10YbREZQH9Gxx4OTztdtHyLE0uBR0FBG13/ZWxHM7zyEvfCmUs7Msm0nnqOnoOfyUkETZK/c5oevRHiDeMC1D/gNmHKEJV1VnNdJtF06Cp6xe4qYWY+mO+vljxK9znYSnVcaqzoosrOGB4foMx83vEBg2zhstC9ERl3LTB1Ytedl/9I/Q9omL4nmq71Wxf6gqBjovA7zNqpSOYX1uvETO/IhNGYkePNdg2bvkMqkow7vaiU+ar+TObvpZGIPbOGPNOOkJXAC5/MeNS0DN6gps+COHRCy+SHvJNPAWsetnTyReoFnOqtrvdp3koDKRNRARMwqNUaYLYzRtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/M0Zimw6cVNDmnmJ4aHJa3n7aV8Sy30TNQwP94O37U=;
 b=HBCNfowe1lUHlwKZ23ngp45BfjRdUR/Q5VaW5b5XfNndfqKW5Zf13jwPQi9/+jr2Fcj/Yh+U5iR7Cy/aXPRxO2RzySx+m+QU9jesG3fJziA1b+HjvBYNZEc+FRggwh/M9TfhG8XzhqSHZIm4df1+M9mz5u1dspszq/6+1q98D00yd8whbfKSaiqY6aGzAUQa/dFGNrbZ6ZhCphNo9A0H0mt4Oc2WwvmLkgxnXaC5lDzcGLjgBm1zRWl/7gYGyTAMRzUE+r6FcsEXc1Ks/vKIOaE0ADv56zVr+IdSLVn3SIqieXY27ozvM7eKCZkIH/Dxnt6Op8PE1ydMyl2eG4mkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAEPRKCAAMm8AIAAETMQ
Date: Mon, 9 Oct 2023 17:22:21 +0000
Message-ID:
 <DM8PR12MB5480BC4A09AD838DCFBEC920DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810C93B29680EB7BBB41BCDCCEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231009114458-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231009114458-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|DM6PR12MB5024:EE_
x-ms-office365-filtering-correlation-id: 5a3b8d64-6f00-4521-888c-08dbc8ec4bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sYOsRNqNIBCVlqnbmIfXjmJm4rhy1zB3e2oeQQd5LxXtUuxl7G+PfEEhboxX8ax7KfXtMkUdn1bXE16R0pD7kSW4q8OiD2wMloWG5uGG+X71QgLzXZk01nXYXCOCuO8hQ8tHFvflDDfYRpM2NV0DMSi2kVitag4QSDk0D0wC688rHOfqU6WItgh+gI01UVX67hEW2wjaXOQdSX4MAYzZpNAeK4OLom/qWTFgMsjzIt12aNP5htYs4NNSlyO82GCARSyGwz9+HrmBPiJepLa4SCjpxCRQcN1bBqB09hxr9r3pI0kp9XTRO5d/bIFtxOfmACWB996slRJneWC3MKKzeoSal8z9DGb5qK7xBzqvkEVOzqnDVftFg8ydYHxjL3gh2it5fFb57XzfOYA+h8XFAlwdCSXf20WGjZtqZSZXpYSkIKL+6LfIIapKTduY5f7xkkLfcvcsfZgZi02Ce4lZMTRV55y08zvLW6ogcyIzN2rD3U+5bBV6FuqfeBsZKXu+xNbSGYAY3X2X1CagVWIedHJrUgz4NmV6zyW1TCDKzLFG5VWMhZPmdMtchSH5dFUwvz5AnecINgpc9xVWT/BkApsoWAffKrVhObFzTEpT0zpdizrids3QkFx30dhmlaI+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(7696005)(107886003)(6506007)(9686003)(55016003)(38070700005)(122000001)(86362001)(33656002)(38100700002)(2906002)(71200400001)(41300700001)(478600001)(316002)(26005)(52536014)(8676002)(4326008)(8936002)(5660300002)(66446008)(66476007)(66556008)(76116006)(66946007)(54906003)(64756008)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDlZSEY2SnY0S0ttcFZWSmN1TElVdzJmWDNvWWZzUGozMk5qV0EycEMranY0?=
 =?utf-8?B?YndYQWM0MWtVVmREK3FLb1phWjVMaDh3SzM2dkF6SDN3VnkvUmh0dlJaVDZI?=
 =?utf-8?B?RzFXalgwM2J3dWgrdXRYT3NTaC8xemRGYkNlMGdSMFM3UDg2R2ZvVmdLYlRR?=
 =?utf-8?B?VlVVZGRzZU5iRitQR3pBeVVWTFdScVJ0MGRNVlFSVEF2c2V4TFJ1ODBBeTJZ?=
 =?utf-8?B?cFVxcTduT2VyVnhZQUp3d3ZNVnNJblJZc01SK0haUnBKSVJmV2lKaHFUVUxI?=
 =?utf-8?B?RzJwdmZUWlU0dVRIdVBvR09wSjBITmVPTkQ4aU85VGVidmd1cCs0VG9tekhP?=
 =?utf-8?B?b1ZTaWxpTWtxZ0VGM0xER2l5dHUyWTdQeFFQbjNPOElNNER4OWJ0ellvNUd3?=
 =?utf-8?B?SHo1QmZQbDBCVkpRVXBtSXg2WXlVRDBxZG91d1UvcnJIK2E5Uk9iMUhaU0Mr?=
 =?utf-8?B?VWJnSVphN0M4dUtITnVFWVo5WEEzRzIwdGJ1MjVvemRLVmRsbTV5aUI4c0NN?=
 =?utf-8?B?K0FET25DaVhBd2VRM09ld1pCRTFZazQxdWVzODB2VnBKbE5ZV1V4ek5zYS9x?=
 =?utf-8?B?Vko3VXdDNzRQRm01L2lzMXRWakFmQTZOYkx3SlV6UXl0NTdTNlhEdjF4UTlN?=
 =?utf-8?B?NFFLU1BEOTVybTdyV2JMTzlDSnFvRW5vWjF6cXVqRXUrY081ZjNJU1dJRVlC?=
 =?utf-8?B?V2pUR01tL05ZeFpYL0hhbXd6N09SaHltd3FONFAzN2piNTRicWQ5VFVHNDNJ?=
 =?utf-8?B?OE5ERzQ3RUtNVFFJWElYR1hZZ09YdHVYL2NWOHRTaXpNQUJ0MU9ZRlRaN1E1?=
 =?utf-8?B?dzgwQzdYSmxJSFBURmJ0QjhaZnJvSW5IRGVqRTNsbTl1eVZWa0kxK1o5SDhV?=
 =?utf-8?B?R1kwejVSZHZzM2s2SU5CQmdqdWZqYkhiVzk0YXh3WnVXVUJ1TzllaDZxdXlq?=
 =?utf-8?B?QWxLc1FDZ0lkQUdMYWpBbmNxanVzczZKL1ZHMk42dTB0RU94VGFIK0FyQjFD?=
 =?utf-8?B?QTJnY3c1ckQvTVJMYXg1YVFneXhzYnpTN3lKbDBCZGhPN0pIUmluc09NRTYz?=
 =?utf-8?B?d3VBUXlwV01zcVgrOEZZSVhWSG1jcDRnalhHdFg4dFh0RXNlZVF0NHZBSk1U?=
 =?utf-8?B?ZU4rYWR2c01UaHdodHdrejE1Sm80dWRiZDJqVWMzRnZGWjY5dFhhOGZGUUZF?=
 =?utf-8?B?S1B6MTBudGVZbWdla3dERWsxRWN0bkxOTnorOE1Xamw4MTBmNlkwMndpTkJ4?=
 =?utf-8?B?bXJwd0xJU1NmdkZiQVphRXVvbWV5YzZUUDBXWkExSEJEbkNHblI2WkdzaW5G?=
 =?utf-8?B?Vzg2cHhNdUtDc21NclVEVGZKVTNIeWdscERMUVlhM1Jhc1Vsa3NMQmtWajBo?=
 =?utf-8?B?Rkh0K2JkdzZDUnM0dWRHa1hjNzNFUG84d20vUDEwOFRBVjlOWFpldCtZbzlz?=
 =?utf-8?B?QnRPREdVMiszWkNjTWd6R3doOVNEVWl3YThjQXh5eVY2WmxaZ2ZiY0dncTli?=
 =?utf-8?B?SWV5UjQ2MlVGaEVwVlRNODh6MlYxeWNsUGhtZmFUeFBHNlJXajFaVEUwY3Bo?=
 =?utf-8?B?d1A0MlRnT1ZJc0YxV1VFeDBQMlY0RG9tTjUycVQ5QmUvWExYUHREODZMdGRy?=
 =?utf-8?B?ODA4TWlUbzJjbjVneXRSaWN1d3MrR0xUQVdTWEZ4MW9yS3R4dEZnMlFrb1Z2?=
 =?utf-8?B?QkFVc3llaXJMZWlDVlErZkJqMEZUOCtSSDFkWmxvUFBuNUZxQW44ZCtLSXB2?=
 =?utf-8?B?YXZiOUEvZGViQllyWGNhS2p6S0ZUSFZ2cEdvOUZPN09PVEYzeFUxR25ncGYz?=
 =?utf-8?B?ZVloRWxhbGVUbHRVTjJPMU8yb2hRbW5ET3VyNzFKeXVDTC9TMzVvM2h1K0VG?=
 =?utf-8?B?U0JPWlJHeCtwazVJTjlyZ3Y4dTRCcnFGN3doUC9KQXFlVmZLRE9BOHdsRm0v?=
 =?utf-8?B?L2QyaTdRTitZSmNmV2pSb1duMGw4NWdrNnJoeElvbXE2NVpQenY4b2FVK2JY?=
 =?utf-8?B?WXlVWEV6NmptK1UxR1RSY3IrcTlJcmM5U1Vnb1NzQVV3VlF0NmxRaFI4Vlh0?=
 =?utf-8?B?d3BSbzltUmEranlxMlFOaTFrM3BqK0psdkdZM2Z2SjRBZ05HTG9ZNERmTWlJ?=
 =?utf-8?Q?jyw8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3b8d64-6f00-4521-888c-08dbc8ec4bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 17:22:21.4345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aphekNHO24mHsbmwWPfIJfJwWi4DCpb1W6XZQSKv2HGGWiJDob142TLBULU8ZBLiBkVUXGT8Fa1rWxhmHTxTkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5024
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
TW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgOToyNSBQTQ0KPiANCj4gT24gTW9uLCBPY3QgMDksIDIw
MjMgYXQgMDQ6MTU6MDFBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+IEhpIE1pY2hh
ZWwsDQo+ID4NCj4gPiA+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3Jn
DQo+ID4gPiA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYg
T2YgTWljaGFlbCBTLg0KPiA+ID4gVHNpcmtpbg0KPiA+ID4gU2VudDogU3VuZGF5LCBPY3RvYmVy
IDgsIDIwMjMgNToxMiBQTQ0KPiA+DQo+ID4gWy4uXQ0KPiA+ID4gPiArXGJlZ2lue3RhYnVsYXJ4
fXtcdGV4dHdpZHRofXsgfGx8fGx8WHwgfSBcaGxpbmUgdHlwZSAmIE5hbWUgJg0KPiA+ID4gPiAr
RGVzY3JpcHRpb24gXFwgXGhsaW5lIFxobGluZQ0KPiA+ID4gPiArMHgwICYgVklSVElPX0RFVl9D
VFhfUENJX0NPTU1PTl9SVU5USU1FX0NGRyAmIFByb3ZpZGVzDQo+IGNvbW1vbg0KPiA+ID4gPiAr
Y29uZmlndXJhdGlvbiBzcGFjZSBvZiBkZXZpY2UgZm9yIFBDSSB0cmFuc3BvcnQgXFwgXGhsaW5l
DQo+ID4gPiA+ICsweDEgJiBWSVJUSU9fREVWX0NUWF9ERVZfQ0ZHX0xBWU9VVCAmIFByb3ZpZGVz
IGRldmljZSBzcGVjaWZpYw0KPiA+ID4gPiArY29uZmlndXJhdGlvbiBsYXlvdXQgXFwgXGhsaW5l
DQo+ID4gPiA+ICsweDIgJiBWSVJUSU9fREVWX0NUWF9ERVZfRkVBVFVSRVMgJiBQcm92aWRlcyBk
ZXZpY2UgZmVhdHVyZXMgXFwNCj4gPiA+ID4gK1xobGluZQ0KPiA+ID4gPiArMHgzICYgVklSVElP
X0RFVl9DVFhfUENJX1ZRX0NGRyAmIFByb3ZpZGVzIFZpcnRxdWV1ZQ0KPiA+ID4gPiArY29uZmln
dXJhdGlvbiBmb3IgUENJIHRyYW5zcG9ydCBcXCBcaGxpbmUNCj4gPiA+ID4gKzB4NCAmIFZJUlRJ
T19ERVZfQ1RYX1ZRX1NQTElUX1JVTlRJTUVfQ0ZHICYgUHJvdmlkZXMgUXVldWUgcnVuDQo+ID4g
PiB0aW1lDQo+ID4gPiA+ICtzdGF0ZSBcXCBcaGxpbmUNCj4gPiA+ID4gKzB4NSAmIFZJUlRJT19E
RVZfQ1RYX1ZRX1NQTElUX0RFVl9PV05fREVTQyAmIFByb3ZpZGVzIGxpc3Qgb2YNCj4gPiA+ID4g
K3ZpcnRxdWV1ZSBkZXNjcmlwdG9ycyBvd25lZCBieSBkZXZpY2UgIFxcIFxobGluZQ0KPiA+ID4g
PiArMHg2IC0gMHhGRkZGRkZGRiAmIC0gJiBSZXNlcnZlZCBmb3IgZnV0dXJlIHR5cGVzIFxcIFxo
bGluZQ0KPiA+ID4gPiArXGVuZHt0YWJ1bGFyeH0NCj4gPiA+DQo+ID4gPg0KPiA+ID4gSSBkb24n
dCB0aGluayB0aGlzIGlzIGVub3VnaCwgZS5nLiB2aXJ0aW8gbmV0IGhhcyBpbnRlcm5hbCBzdGF0
ZQ0KPiA+ID4gY29udHJvbGxlZCB0aG91Z2h0IENWUSBjb21tYW5kcy4gaG93IGRvIHlvdSBpbnRl
bmQgdG8NCj4gPiA+IGFkZHJlc3MvbWlncmF0ZSB0aGVzZT8NCj4gPiA+DQo+ID4gUG9zdCB0aGlz
IHNlcmllcywgdGhlIDMyLWJpdCB0eXBlIGZpZWxkIHdpbGwgYmUgc3BsaXQgaW50byB0d28gcmFu
Z2VzLg0KPiA+IEZpcnN0IHJhbmdlIChleGlzdGluZykgdG8gY292ZXIgY29tbW9uIGNvbnRlbnQg
YWNyb3NzIGFsbCBkZXZpY2UgdHlwZS4NCj4gPiBTZWNvbmQgcmFuZ2UgdG8gY29udGFpbiBkZXZp
Y2Ugc3BlY2lmaWMgY29udGVudCwgY29udGFpbmluZyBub24gaW50ZXJuYWwgZmllbGRzDQo+IHN1
Y2ggYXMgZmllbGRzIHNldHVwIGJ5IHRoZSBndWVzdCBkaXJlY3RseSBvdmVyIENWUS4NCj4gDQo+
IEhvdyB3aWxsIGFsbCB0aGlzIGJlIGFkZGVkIHRob3VnaD8gWW91IHByb2JhYmx5IGhhdmUgYSBj
bGVhciBwaWN0dXJlIGluIHlvdXINCj4gaGVhZCBidXQgSSAoYW5kIGxpa2VseSBvdGhlciB0YyBt
ZW1iZXJzKSBkb24ndC4NCj4NCkFuIGV4YW1wbGUgaXMsDQpSYW5nZSAwIHRvIDB4ZmZmZiBhcmUg
cmVzZXJ2ZWQgZm9yIGNvbW1vbiBkZXZpY2UgdHlwZS4NCjB4MV8wMDAwIHRvIDB4MV9mZmZmIGlz
IHBlciBkZXZpY2UgdHlwZS4NClNvIHNheSBmb3IgbmV0IGRldmljZSwNCjB4MV8wMDAwIHJlcHJl
c2VudHMsIFJTUyBjb25maWd1cmF0aW9uLg0KMHgxXzAwMDEgd2lsbCByZXByZXNlbnRzLCBmbG93
IGZpbHRlciBjb25maWd1cmF0aW9uDQoweDFfMDAwMiB3aWxsIHJlcHJlc2VudHMsIHN0YXRzLg0K
DQpGb3IgY3J5cHRvIGRldmljZSwNCjB4MV8wMDAgcmVwcmVzZW50cyBzZXNzaW9uIGluZm9ybWF0
aW9uLg0KDQpFdGMuDQogDQo+ID4gPiA+ICtcc3Vic3Vic2VjdGlvbntEZXZpY2UgQ29udGV4dCBG
aWVsZHN9XGxhYmVse3NlYzpCYXNpYyBGYWNpbGl0aWVzDQo+ID4gPiA+ICtvZiBhIFZpcnRpbw0K
PiA+ID4gRGV2aWNlIC8gRGV2aWNlIENvbnRleHQgLyBEZXZpY2UgQ29udGV4dCBGaWVsZHN9DQo+
ID4gPiA+ICsNCj4gPiA+ID4gK1xwYXJhZ3JhcGh7UENJIENvbW1vbiBDb25maWd1cmF0aW9uIENv
bnRleHR9IFxsYWJlbHtwYXI6QmFzaWMNCj4gPiA+ID4gK0ZhY2lsaXRpZXMgb2YgYSBWaXJ0aW8g
RGV2aWNlIC8gRGV2aWNlIENvbnRleHQgLyBEZXZpY2UgQ29udGV4dA0KPiA+ID4gRmllbGRzLyBQ
Q0kgQ29tbW9uIENvbmZpZ3VyYXRpb24gQ29udGV4dH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArRm9y
IHRoZSBmaWVsZCBWSVJUSU9fREVWX0NUWF9QQ0lfQ09NTU9OX1JVTlRJTUVfQ0ZHLA0KPiBcZmll
bGR7dHlwZX0NCj4gPiA+IGlzIHNldCB0byAweDAuDQo+IA0KPiBOb3Qgc3VyZSB3aGF0IGRvZXMg
UlVOVElNRSBkbyBoZXJlLg0KPiANClJ1bnRpbWUgaXMganVzdCB0aGUgcHJlZml4IHRvIGRlbm90
ZSB0aGF0IHRoaW5ncyBsaWtlIHJ1bnRpbWUgYXJlIG1vcmUgcHJvYmFibGUgdG8gY2hhbmdlIGFz
IG9wcG9zZWQgdG8gY29uZmlnIHdoaWNoIGRvZXMgbm90IGhhdmUgaXQuDQoNCj4gPiA+ID4gK1Ro
ZSBcZmllbGR7dmFsdWV9IGlzIGluIGZvcm1hdCBvZiBcZmllbGR7c3RydWN0IHZpcnRpb19wY2lf
Y29tbW9uX2NmZ30uDQo+ID4gPiA+ICtUaGUgXGZpZWxke2xlbmd0aH0gaXMgdGhlIGxlbmd0aCBv
ZiBcZmllbGR7c3RydWN0IHZpcnRpb19wY2lfY29tbW9uX2NmZ30uDQo+ID4gPiA+ICsNCj4gPiA+
ID4gK1xwYXJhZ3JhcGh7RGV2aWNlIENvbmZpZ3VyYXRpb24gTGF5b3V0IENvbnRleHR9IFxsYWJl
bHtwYXI6QmFzaWMNCj4gPiA+ID4gK0ZhY2lsaXRpZXMgb2YgYSBWaXJ0aW8gRGV2aWNlIC8gRGV2
aWNlIENvbnRleHQgLyBEZXZpY2UgQ29udGV4dA0KPiA+ID4gRmllbGRzLyBEZXZpY2UgQ29uZmln
dXJhdGlvbiBMYXlvdXQgQ29udGV4dH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArRm9yIHRoZSBmaWVs
ZCBWSVJUSU9fREVWX0NUWF9ERVZfQ0ZHX0xBWU9VVCwgXGZpZWxke3R5cGV9IGlzIHNldCB0bw0K
PiAweDEuDQo+IA0KPiBUaGlzIG5hbWUgaXMgcXVpdGUgY29uZnVzaW5nLiBJIHNlZSBub3cgeW91
IGp1c3QgbWVhbiB0aGlzIGlzIGRldmljZSBjb25maWc/DQo+DQpZZXMsIHRoZSAiZGV2aWNlIGNv
bmZpZ3VyYXRpb24gbGF5b3V0IGZpZWxkcyIuDQpTbyBqdXN0IGRvIERFVl9DRkc/DQogDQo+ID4g
PiA+ICtUaGUgXGZpZWxke3ZhbHVlfSBpcyBpbiBmb3JtYXQgb2YgZGV2aWNlIHNwZWNpZmljIGNv
bmZpZ3VyYXRpb24NCj4gPiA+ID4gK2xheW91dCBsaXN0ZWQgaW4gZWFjaCBvZiB0aGUgZGV2aWNl
J3MgZGV2aWNlIGNvbmZpZ3VyYXRpb24gbGF5b3V0IHNlY3Rpb24uDQo+ID4gPiA+ICtUaGUgXGZp
ZWxke2xlbmd0aH0gaXMgdGhlIGxlbmd0aCBvZiB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb24gbGF5
b3V0IGRhdGEuDQo+ID4gPg0KPiA+ID4gVW5jbGVhci4gSSBhbSBndWVzc2luZyBpdCdzIGRvaW5n
IHRoaW5ncyBsaWtlIHNldHRpbmcgdXAgUk8gZmllbGRzPw0KPiA+ID4gVGhpcyBuZWVkcyB0byBi
ZSBzcGVjaWZpZWQgcGVyIGRldmljZSByZWFsbHkuDQo+ID4gPiBBbHNvIGhvdyBzb21lIGZpZWxk
cyBiZWhhdmUgbWlnaHQgZGVwZW5kIG9uIGZlYXR1cmVzLg0KPiA+IEluIHByYWN0aWNlIGZpZWxk
cyBpbiB0aGlzIGFyZWEgZG8gbm90IGNoYW5nZSBhIGxvdCwgYnV0IGl0IGNhbiBmb3IgZXhhbXBs
ZSB0aGUNCj4gbGluayBzdGF0dXMvc3BlZWQgb2YgbmV0IGRldmljZS4NCj4gPiBTbyBpdCBpcyBu
b3QgUk8gcGVyIHNheS4NCj4gPg0KPiA+IFJlZ2FyZGluZyBpdCBiZSBkZXZpY2Ugc3BlY2lmaWMg
b3IganVzdCBhIGNvbmZpZ19sZW5ndGggYmxvYiwgSSB0aGluaw0KPiBjb25maWdfbGVuZ3RoIGJs
b2IgaXMganVzdCBmaW5lIGZvciBkZXZpY2VfY29udGV4dCB1c2UuDQo+ID4gVGhpcyBpcyBiZWNh
dXNlIHRoZXJlIGlzbuKAmXQgYSBuZWVkIGZvciBtaWdyYXRpb24gZHJpdmVyIHRvIHBhcnNlIGFu
eSBvZiB0aGVzZQ0KPiBmaWVsZHMuDQo+IA0KPiBXaGljaCBkcml2ZXIgcGFyc2VzIHdoYXQgaW4g
eW91ciBjdXJyZW50IHN0YWNrIGlzIGltbWF0ZXJpYWwuICBXZSBuZWVkIHRvDQo+IGRvY3VtZW50
IGFsbCBjb250ZW50LCBqdXN0IGEgbGVuZ3RoIGlzIG5vdCBnb2luZyB0byB3b3JrLg0KDQpTdXJl
IGl0IGlzIGltbWF0ZXJpYWwuDQpUaGUgbGVuZ3RoIGNvdmVycyB0aGUgbGVuZ3RoIG9mIHRoZSBk
ZXYgY29uZmlnIHNwYWNlIGRhdGEuDQpJIHdpbGwgYWRkIHRoZSBleGFtcGxlIGNvbnRhaW5pbmcg
dGhlIGxpbmsuDQpTaW5jZSB3ZSB3YW50IHRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSBjb250ZW50
IG9mIGRldmljZSBjb25maWcgbGF5b3V0LCB0aGUgZXhhbXBsZSB3aWxsIGhlbHAgdG8gbWFrZSB0
aGlzIHZlcnkgY2xlYXIuDQoNCg0K

