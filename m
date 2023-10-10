Return-Path: <virtio-comment-return-7648-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C29CD691F
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:58:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 836F81922EC
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:58:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 627FC986589
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 09:58:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3F6F198654B; Tue, 10 Oct 2023 09:58:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F8A498655C
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 09:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdKhsMsvw8crM6uPepAOkPLqHEUpiaU4NOwPqn+xAfzsapnr2jmE/dQppiqHS1dY7ke/VFQf6tBCiwaq8jnBGX0V9/Dtyo10SsdGihL2FoHzIeoRIa5eFbL50+kFgiSCZljhYUDw7HAx+4AG0gX84+1RMGrmOO+xEUsQPlFXGKht/DwwxK8Fuf3/VKL34H8dkTfwHsRE8ByfNpFkZhSEqkE3KE/R+MMRkzRRA7/lSPdCRsrXbsvvhki+74BPIj8q5WZsIBty0Vjc0xYv+AhDeBhAyY9QKZbjoMEMfEOldPEQS1dTxDyEntLqLl/UxmCB9IUkUByH1XTdZ17r4HCi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5pSimbVg7uO2RsmjvvXSci91NelMGcVIj7o06IaNsg=;
 b=gLCAmS7L63tMxxTUug7ujByokAvdmUNMx9zPYuuIxQQvhiAmaxfuKtqop1eyyYMJ2r5bBcp0/eWISsXnKUo/ifl/8zS2rGgnt4sYPeuS7NJBV7mjAknRp8c/dN67jMpIGLBrAl9uHL9tRSRGpFIua77F+Tgrq/Sqgc7Buu3//fMqo699U5wMcIcPod5cU1H0PLECbWMK2Wf/5TFqonygVrnsqrMalVfkazoaCCss2hXTHHennI2F3xoA2/kiAgWXu90jLo7zViuV8rTAFOVo7O110WN9qB3o8j2nAwc6E+RcESKiFYGEJrLRrxIZ+ZDu0sQtc4ctlpQdEEiDUtYqSA==
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
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrA=
Date: Tue, 10 Oct 2023 09:58:44 +0000
Message-ID:
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
In-Reply-To: <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_
x-ms-office365-filtering-correlation-id: a6054b75-8a48-468d-93dd-08dbc9777d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PPrK5jGUBh7kPX5ArSrR2FICX02F5dUCOB2/5KMrG5KZT0408bt+HAgJfOnbi7sxkQcS//PF0znvznCebxygrXmWx3lWpzZ6q4eHGVujUNln4YM+p5v17xvDnHwZwmGllPnBC6y/GlODvD+XM5h0oPl2qotV3w6U+w4Jlsfzt4lXiTRrMqnIGXVOvZtJOeZ/sZItIqpKQBP1sHHUP2iu57OX4tZAMa8I5e4C7i5KymXKW6rGAvgWKkiyVDhjK1MrpU/KeZiBQ3TnOyaniyU4uR5cDj5KzmAxGo/Gk1KkYD4Rtt4smeYFrqkPIz+kS9BHYb0gyb6SM2s6hySiXAnhEV87w/EXGv3E8pNtTjpjTt36RqeN+pd3rmIExZ5mWmXWV1cCBTHpxV5mCkn7Yrjryzo29pWXGNrtxIFf45RHVldAtEiTIOEQ2DgL5TtmIZ6mbXUy5Aj2bb6lNil2gK3sTs8Ig0OLVJ6xLZqb/Eb0X6zhDdYSPmPdfC1HIdS0BXNDotfpCz2zYZEYzXzgnJzdhWbe85TjI3ta2GMmbwgJ/NXSM1SCIiiSUextxmJ4m+Fv913cN6uYw1YV3S3qcg0CckLWyl4yuSOUtisyj+bPzNnbjZQRf3zUI+SdJ2ujeIV2RAzk8e1h2a0S30H3RMH7SJ75u0zdXJ36q+4iwX4lkKU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(33656002)(86362001)(38070700005)(55016003)(9686003)(5660300002)(107886003)(53546011)(2906002)(41300700001)(478600001)(64756008)(66476007)(66946007)(110136005)(66446008)(66556008)(76116006)(52536014)(54906003)(7696005)(6506007)(71200400001)(316002)(26005)(966005)(4326008)(8936002)(8676002)(83380400001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDBmRkhTekw4WU45K3pQNy9WN1E4RmEvZ2dFKzhyaytmTmFiT0lLYkRoTFdz?=
 =?utf-8?B?SWhjSWRCN3BGQXM5MXdFaVZhTFBmS3BCZGtCWm82UGROa2svMGpmajNtV2JQ?=
 =?utf-8?B?dTE2K0l0V21FQXIrZ3YySmhxeTIwZ3ZueDQrK0JmMHQrakEzTzBkVTNxeU5I?=
 =?utf-8?B?ZFhFWks2NlYzcXE3aVhpcGZFbXl4OVd6SVQwNVp0ZUo5ejl5Z2RJN3R6UnQ0?=
 =?utf-8?B?cFBTSUFhYS8zOFdpVWk3dEhNb2c5bHMvQlFCQTBPanpPVitLL0RVQ3M0Z21x?=
 =?utf-8?B?TGJ0emN6NFFYeGp0aDVoeDVqdEZDZ2p4dkhhbmtoRzdwQy92UlNMTmVNLzdS?=
 =?utf-8?B?bEI3NmpveE50UWdoZW5EVUx5SWZGby9QRTdqSGFWcFRuclJGR0VTeW5uVFFr?=
 =?utf-8?B?dG95a0RYMGhJcXluTW9YdkVhVUNqcG5GdTJac0xvakNTUmkwTFFxdEtnU3RL?=
 =?utf-8?B?bkREbUtQQTQvUTgvcmFTa1VWaXp2dGRkN0doNUsvZ29GTVFocSs3ZFZjU3pY?=
 =?utf-8?B?SmlydGhBeWJFZ0o4czV5YVNPRWQ0eG5LL0VIU28vMWN0YURLVWRQaTF6Tnky?=
 =?utf-8?B?QUUvd3Ntd25ZWWVRejE5V3haVC9aR1dEMlo3c3MrNk5obWk1ZDUwVUMyREhV?=
 =?utf-8?B?MUhYSWpJU0N0VWhYKzlRdysyOXNhb3VaY2tleUwxN2kxTWs4cEZqbkxWOHFs?=
 =?utf-8?B?ZWVmQzljWTVRdHV4aG9EZWxYclkvbjRuUjhOSzU2MjE0RWhSaElMT1RJU3N6?=
 =?utf-8?B?cXVXL1hoanp0NHlDRHJzR0FQNEJxV1VyMDUrcWNrR3owTFlIT1Q2RTJ5d0Fn?=
 =?utf-8?B?em1lb21iUFZqa1RjZWo3MTJLOWJlRmhGTHc3Y3JDQTFrOERjRk9ibCsvdDFh?=
 =?utf-8?B?eFc1WHpEaGZTU0Ewdys3dmN4T0U4RGNqMXVpNkdWSnQybTJvRzJjMGlPUi91?=
 =?utf-8?B?Z0dPaHhiRnU2N1NodDFFQkRKTCtCRFZORWNTL1dCYjl6OXVINzlhdFFNSmha?=
 =?utf-8?B?T0pwZno3ZC9qdVZOckJHK25XeDNqbndmU1ZvaitpZ3IzT3hXZkUrUG5Qa2VP?=
 =?utf-8?B?WmpacjZBbC9EU0NnQmRua2JRenpKckR6SWloOFg5OEdWUTdVeldNS1pRbG5u?=
 =?utf-8?B?TUJWM3lVQzlyeElvbkNlZWJ3MEJSTHY3dUdwVnQxVFh0dWRTK2V5NktJODR2?=
 =?utf-8?B?ZzVuVUNJTjA4Wm9yaFZ2Y3R6OERmYVB4cmYwYlhRc2oweTEwTXc2dTlVS1R1?=
 =?utf-8?B?cFR4TE4rbXNITWRiZG1zalp1MzJ2T2x1TUh1d2hDNThYQnFTOTc2MTlTaHIy?=
 =?utf-8?B?WkdLVE94a3BlblhoMStVMEJZK3FScUplQVJkQzA3aU92UzNDTTNKUU1PV1VN?=
 =?utf-8?B?N2dsVjB5czJyTThXbVJrUXZaTUVoVnVNazkzQUdPK1VnRGV5eWp3WG5jcG13?=
 =?utf-8?B?bWY4Yzg0SDNENkJGbWpTNGx5Rm8yWWdOZjdscG9wdkE0QjVzSmhmYkpIME5h?=
 =?utf-8?B?ZTJFb0lGM2xDRUZ0Q0E2NXNDR3VyY3hRMmFGTzNmOXlJUEpVMmxNYjB5TkJj?=
 =?utf-8?B?MElkVUdYd0Vjd1VDbGx2VGNYc0VHdmh4OTNEbWFvbGcvNzZCKzFQcnJPcTVN?=
 =?utf-8?B?SXkxcDRvaVN6YVRFZmJhNGx6YlA1UXNEaUdObVY1N2p4NGRIT0N5WkZXeVhx?=
 =?utf-8?B?SW5XK3ZucVRKSU45dDhaL2x0aWVNVUh3UG1PYkNhamtNcmp3bTUycFdpdldN?=
 =?utf-8?B?ZDFlSFovMlFYd0p1cWQzRDNUYUZHUDg1VjgzQ2VoUW41ckQ0dHBqdUd2MEoz?=
 =?utf-8?B?dythZThWTDc0ZW1uV20rd3VUcmZ6YUJidkR0Y1p0UVFCVVNKUzZUUWtoU0px?=
 =?utf-8?B?UzNHNGJiQ3NHU1d2NkZzRXNCSnlFOUVzWlRLRk1Eck4vaGtBQXYzUzJ0V0Ew?=
 =?utf-8?B?WWNQdFZBVWh5NVZOcGd3SjA3UDR4aS8yVU5BUFQ3YkQ4YXBqNWtJNEZzVmxO?=
 =?utf-8?B?bmwwRW0ray8xcEJNY3ZIdzhSQVUrZ1RKM05vL0JEZDN5TVVTcU9LWlJ0RnRH?=
 =?utf-8?B?cnk4VmMzTlJOVGtyRmE3MFJpdjB2MlpHNDdEVVhpWVpZQitxQndCT0FuenhY?=
 =?utf-8?Q?9YLc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6054b75-8a48-468d-93dd-08dbc9777d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 09:58:44.6642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJgWOpqQMTSwbShxpLtOZHJo5qghxYJEfHPWBjalDngpt3+fgFZLZ1B4Jh9C0gbxzIqhr6RCQM0VyJ0DBbzN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5481
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMTAsIDIwMjMgMjoyMiBQTQ0KPiANCj4gT24gMTAvOS8yMDIzIDEw
OjMwIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4NCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hh
biA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDks
IDIwMjMgNDowNCBQTQ0KPiA+Pg0KPiA+PiBPbiAxMC84LzIwMjMgNzo0MSBQTSwgTWljaGFlbCBT
LiBUc2lya2luIHdyb3RlOg0KPiA+Pj4gT24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMDI6MjU6NTBQ
TSArMDMwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+IERlZmluZSB0aGUgZGV2aWNlIGNv
bnRleHQgYW5kIGl0cyBmaWVsZHMgZm9yIHB1cnBvc2Ugb2YgZGV2aWNlDQo+ID4+Pj4gbWlncmF0
aW9uLiBUaGUgZGV2aWNlIGNvbnRleHQgaXMgcmVhZCBhbmQgd3JpdHRlbiBieSB0aGUgb3duZXIN
Cj4gPj4+PiBkcml2ZXIgb24gc291cmNlIGFuZCBkZXN0aW5hdGlvbiBoeXBlcnZpc29yIHJlc3Bl
Y3RpdmVseS4NCj4gPj4+Pg0KPiA+Pj4+IERldmljZSBjb250ZXh0IGZpZWxkcyB3aWxsIGV4cGVy
aWVuY2UgYSByYXBpZCBncm93dGggcG9zdCB0aGlzDQo+ID4+Pj4gaW5pdGlhbCB2ZXJzaW9uIHRv
IGNvdmVyIG1hbnkgZGV0YWlscyBvZiB0aGUgZGV2aWNlLg0KPiA+Pj4+DQo+ID4+Pj4gRml4ZXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9vYXNpcy10Y3MvdmlydGlvLXNwZWMvaXNzdWVzLzE3Ng0KPiA+
Pj4+IFNpZ25lZC1vZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gPj4+
PiBTaWduZWQtb2ZmLWJ5OiBTYXRhbmFuZGEgQnVybGEgPHNidXJsYUBtYXJ2ZWxsLmNvbT4NCj4g
Pj4+PiAtLS0NCj4gPj4+PiBjaGFuZ2Vsb2c6DQo+ID4+Pj4gdjAtPnYxOg0KPiA+Pj4+IC0gZW5y
aWNoIGRldmljZSBjb250ZXh0IHRvIGNvdmVyIGZlYXR1cmUgYml0cywgZGV2aWNlIGNvbmZpZ3Vy
YXRpb24NCj4gPj4+PiAgICAgZmllbGRzDQo+ID4+Pj4gLSBjb3JyZWN0ZWQgYWxpZ25tZW50IG9m
IGRldmljZSBjb250ZXh0IGZpZWxkcw0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgIGNvbnRlbnQudGV4
ICAgICAgICB8ICAgMSArDQo+ID4+Pj4gICAgZGV2aWNlLWNvbnRleHQudGV4IHwgMTQyDQo+ID4+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4+ICAg
IDIgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKykNCj4gPj4+PiAgICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZGV2aWNlLWNvbnRleHQudGV4DQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEv
Y29udGVudC50ZXggYi9jb250ZW50LnRleCBpbmRleCAwYTYyZGNlLi4yNjk4OTMxDQo+ID4+Pj4g
MTAwNjQ0DQo+ID4+Pj4gLS0tIGEvY29udGVudC50ZXgNCj4gPj4+PiArKysgYi9jb250ZW50LnRl
eA0KPiA+Pj4+IEBAIC01MDMsNiArNTAzLDcgQEAgXHNlY3Rpb257RXhwb3J0aW5nIE9iamVjdHN9
XGxhYmVse3NlYzpCYXNpYw0KPiA+Pj4+IEZhY2lsaXRpZXMNCj4gPj4gb2YgYSBWaXJ0aW8gRGV2
aWNlIC8gRXhwbw0KPiA+Pj4+ICAgIFVVSURzIGFzIHNwZWNpZmllZCBieSBcaHlwZXJyZWZbaW50
cm86cmZjNDEyMl17W1JGQzQxMjJdfS4NCj4gPj4+Pg0KPiA+Pj4+ICAgIFxpbnB1dHthZG1pbi50
ZXh9DQo+ID4+Pj4gK1xpbnB1dHtkZXZpY2UtY29udGV4dC50ZXh9DQo+ID4+Pj4NCj4gPj4+PiAg
ICBcY2hhcHRlcntHZW5lcmFsIEluaXRpYWxpemF0aW9uIEFuZCBEZXZpY2UNCj4gPj4+PiBPcGVy
YXRpb259XGxhYmVse3NlYzpHZW5lcmFsIEluaXRpYWxpemF0aW9uIEFuZCBEZXZpY2UgT3BlcmF0
aW9ufQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RldmljZS1jb250ZXh0LnRleCBiL2Rl
dmljZS1jb250ZXh0LnRleCBuZXcgZmlsZSBtb2RlDQo+ID4+Pj4gMTAwNjQ0IGluZGV4IDAwMDAw
MDAuLjU2MTEzODINCj4gPj4+PiAtLS0gL2Rldi9udWxsDQo+ID4+Pj4gKysrIGIvZGV2aWNlLWNv
bnRleHQudGV4DQo+ID4+Pj4gQEAgLTAsMCArMSwxNDIgQEANCj4gPj4+PiArXHNlY3Rpb257RGV2
aWNlIENvbnRleHR9XGxhYmVse3NlYzpCYXNpYyBGYWNpbGl0aWVzIG9mIGEgVmlydGlvDQo+ID4+
Pj4gK0RldmljZSAvIERldmljZSBDb250ZXh0fQ0KPiA+Pj4+ICsNCj4gPj4+PiArVGhlIGRldmlj
ZSBjb250ZXh0IGhvbGRzIHRoZSBpbmZvcm1hdGlvbiB0aGF0IGEgb3duZXIgZHJpdmVyIGNhbg0K
PiA+Pj4+ICt1c2UgdG8gc2V0dXAgYSBtZW1iZXIgZGV2aWNlIGFuZCByZXN1bWUgaXRzIG9wZXJh
dGlvbi4gVGhlIGRldmljZQ0KPiA+Pj4+ICtjb250ZXh0IG9mIGEgbWVtYmVyIGRldmljZSBpcyBy
ZWFkIG9yIHdyaXR0ZW4gYnkgdGhlIG93bmVyIGRyaXZlcg0KPiA+Pj4+ICt1c2luZyBhZG1pbmlz
dHJhdGlvbiBjb21tYW5kcy4NCj4gPj4+PiArDQo+ID4+Pj4gK1xiZWdpbntsc3RsaXN0aW5nfQ0K
PiA+Pj4+ICtzdHJ1Y3QgdmlydGlvX2Rldl9jdHhfZmllbGRfdGx2IHsNCj4gPj4+PiArICAgICAg
ICBsZTMyIHR5cGU7DQo+ID4+Pj4gKyAgICAgICAgbGUzMiByZXNlcnZlZDsNCj4gPj4+PiArICAg
ICAgICBsZTY0IGxlbmd0aDsNCj4gPj4+PiArICAgICAgICB1OCB2YWx1ZVtdOw0KPiA+Pj4+ICt9
Ow0KPiA+Pj4+ICsNCj4gPj4+PiArc3RydWN0IHZpcnRpb19kZXZfY3R4IHsNCj4gPj4+PiArICAg
ICAgICBsZTMyIGZpZWxkX2NvdW50Ow0KPiA+Pj4+ICsgICAgICAgIHN0cnVjdCB2aXJ0aW9fZGV2
X2N0eF9maWVsZF90bHYgZmllbGRzW107IH07DQo+ID4+Pj4gKw0KPiA+Pj4+ICtcZW5ke2xzdGxp
c3Rpbmd9DQo+ID4+IHNvIHRoaXMgc3RpbGwgZG9lc24ndCB3b3JrIGZvciBuZXN0ZWQNCj4gPiBJ
biBvbmUgdXNlIGNhc2Ugb2YgbmVzdGluZywgdGhhdCB3ZSBjYW1lIGFjcm9zcyBpczoNCj4gPiB0
aGVyZSBpcyBsYXJnZSBob3N0X1ZNIHdoaWNoIGlzIGhvc3RpbmcgYW5vdGhlciBndWVzdF9WTXMu
DQo+ID4gSW4gc3VjaCBjYXNlLCB0aGUgb3duZXIgUEYgaXMgcGFzc3Rocm91Z2ggdG8gdGhpcyBo
b3N0X1ZNIGFuZCBjdXJyZW50DQo+IHByb3Bvc2VkIHNjaGVtZSBjb250aW51ZSB0byBmdW5jdGlv
biBmb3IgbmVzdGluZyBhcyB3ZWxsIGZvciBuZXN0ZWQNCj4gZ3Vlc3RfVk1zLg0KPiBUaGUgc3lz
dGVtIGFkbWluIGNhbiBjaG9vc2Ugb25seSBwYXNzdGhyb3VnaCBzb21lIG9mIHRoZSBkZXZpY2Vz
IGZvciBuZXN0ZWQNCj4gZ3Vlc3RzLCBzbyBwYXNzdGhyb3VnaCB0aGUgUEYgdG8gTDEgZ3Vlc3Qg
aXMgbm90IGEgZ29vZCBpZGVhLCBiZWNhdXNlIHRoZXJlIGNhbg0KPiBiZSBtYW55IGRldmljZXMg
c3RpbGwgd29yayBmb3IgdGhlIGhvc3Qgb3IgTDEuDQpQb3NzaWJsZS4gT25lIHNpemUgZG9lcyBu
b3QgZml0IGFsbC4NCldoYXQgSSBleHByZXNzZWQgaXMgbW9zdCBjb21tb24gc2NlbmFyaW9zIHRo
YXQgdXNlciBjYXJlIGFib3V0Lg0KDQo+ID4NCj4gPiBJbiBzZWNvbmQgdXNlIGNhc2UsIHdoZXJl
IG9uZSB3YW50IHRvIGJpbmQgb25seSBvbmUgbWVtYmVyIGRldmljZSB0bw0KPiA+IG9uZSBWTSwg
SSB0aGluayBzYW1lIHBsdW1iaW5nIGNhbiBiZSBleHRlbmRlZCB0byBoYXZlIGFub3RoZXIgVkYs
IHRvIHRha2UNCj4gdGhlIHJvbGUgb2YgbWlncmF0aW9uIGRldmljZSBpbnN0ZWFkIG9mIG93bmVy
IGRldmljZS4NCj4gPg0KPiA+IEkgZG9u4oCZdCBzZWUgYSBnb29kIHdheSB0byBwYXNzdGhyb3Vn
aCBhbmQgYWxzbyBkbyBpbi1iYW5kIG1pZ3JhdGlvbiB3aXRob3V0DQo+IGxvdCBvZiBkZXZpY2Ug
c3BlY2lmaWMgdHJhcCBhbmQgZW11bGF0aW9uLg0KPiA+IEkgYWxzbyBkb27igJl0IGtub3cgdGhl
IGNwdSBwZXJmb3JtYW5jZSBudW1iZXJzIHdpdGggMyBsZXZlbHMgb2YgbmVzdGVkIHBhZ2UNCj4g
dGFibGUgdHJhbnNsYXRpb24gd2hpY2ggdG8gbXkgdW5kZXJzdGFuZGluZyBjYW5ub3QgYmUgYWNj
ZWxlcmF0ZWQgYnkgdGhlDQo+IGN1cnJlbnQgY3B1Lg0KPiBob3N0X1BBLT5MMV9RRU1VX1ZBLT5M
MV9HdWVzdF9QQS0+TDFfUUVNVV9WQS0+TDJfR3Vlc3RfUEEgYW5kIHNvDQo+IG9uLCB0aGVyZSBj
YW4gYmUgcGVyZm9ybWFuY2Ugb3ZlcmhlYWQsIGJ1dCBjYW4gYmUgZG9uZS4NCj4gDQo+IFNvIGFk
bWluIHZxIG1pZ3JhdGlvbiBzdGlsbCBkb24ndCB3b3JrIGZvciBuZXN0ZWQsIHRoaXMgaXMgc3Vy
ZWx5IGEgYmxvY2tlci4NCkluIHNwZWNpZmljIGNhc2Ugb2YgbWVtYmVyIGRldmljZXMgYXJlIGxv
Y2F0ZWQgYXQgZGlmZmVyZW50IG5lc3QgbGV2ZWwsIGl0IGRvZXMgbm90Lg0KDQpXaHkgcHJldmVu
dHMgeW91IGhhdmUgYSBwZWVyIFZGIGRvIHRoZSByb2xlIG9mIG1pZ3JhdGlvbiBkcml2ZXI/DQpC
YXNpY2FsbHksIHdoYXQgSSBhbSBwcm9wb3NpbmcgaXMsIGNvbm5lY3QgdHdvIFZGcyB0byB0aGUg
TDEgZ3Vlc3QuIE9uZSBWRiBpcyBtaWdyYXRpb24gZHJpdmVyLCBvbmUgVkYgaXMgcGFzc3Rocm91
Z2ggdG8gTDIgZ3Vlc3QuDQpBbmQgc2FtZSBzY2hlbWUgd29ya3MuDQoNCk9uIHRoZSBvdGhlciBo
YW5kLA0KTWFueSBwYXJ0cyBvZiB0aGUgY3B1IHN1YnN5c3RlbSBzdWNoIGFzIFBNTCwgcGFnZSB0
YWJsZXMgZG8gbm90IGhhdmUgTiBsZXZlbCBuZXN0aW5nIHN1cHBvcnQgZWl0aGVyLg0KVGhleSBh
bGwgd29yayBvbiB0b3Agb2YgZW11bGF0aW9uIGFuZCBwYXkgdGhlIHByaWNlIGZvciBlbXVsYXRp
b24gd2hlbiBuZXN0aW5nIGlzIGRvbmUuDQpNYXkgYmUgdGhhdCBpcyB0aGUgZmlyc3QgdmVyc2lv
biBmb3IgdmlydGlvIHRvby4NCg0KSSBmcmFua2x5IGZlZWwgdGhhdCBuZXN0aW5nIHN1cHBvcnQg
cmVxdWlyZXMgaW5kdXN0cnkgbGV2ZWwgZWNvIHN5c3RlbSBzdXBwb3J0IG5vdCBqdXN0IGluIHZp
cnRpby4NClZpcnRpbyBhdHRlbXB0aW5nIHRvIGZvY3VzIG9uIG5lc3RlZCBhbmQgaGF2aW5nIG5l
YXJseSBzYW1lIGxldmVsIHBlcmZvcm1hbmNlIGFzIGJhcmUgbWV0YWwgc2VlbXMgZmFyZmV0Y2hl
ZC4NCk1heWJlIEkgYW0gd3JvbmcsIGFzIHdlIGhhdmUgbm90IHNlZW4gc3VjaCBoaWdoIHBlcmYg
bmVzdGVkIGVudiBldmVuIHdpdGggc3cgYmFzZWQgZGV2aWNlLg0KDQpXaGF0IGNhbiBiZSBwb3Nz
aWJseSBkb25lIGlzLCANCjEuIFdoYXQgYWRtaW4gY29tbWFuZHMgYXJlIHVzZWZ1bCBmcm9tIHRo
aXMgc2VyaWVzIHRoYXQgY2FuIGJlIHVzZWZ1bCBmb3IgbmVzdGluZz8NCjIuIFdoYXQgYWRtaW4g
Y29tbWFuZHMgZnJvbSBjdXJyZW50IHNlcmllcyBuZWVkcyBleHRlbnNpb24gZm9yIG5lc3Rpbmc/
DQozLiBXaGF0IGFkbWluIGNvbW1hbmRzIGRvIG5vdCB3b3JrIGF0IGFsbCBmb3IgbmVzdGluZywg
YW5kIGhlbmNlLCBuZWVkIHRvIGhhdmUgbmV3IGNvbW1hbmRzLg0KDQpJZiB3ZSBjYW4gZm9jdXMg
b24gdGhvc2UsIG1heWJlIHdlIGNhbiBmaW5kIGNvbW1vbiBhcHByb2FjaCB0aGF0IGNhdGVyIHRv
IGJvdGggY29tbWFuZHMuDQoNCj4gPiBEbyB5b3Uga25vdyBob3cgZG9lcyBpdCB3b3JrIGZvciBJ
bnRlbCB4ODZfNjQ/DQo+ID4gQ2FuIGl0IGRvID4gMiBsZXZlbCBvZiBuZXN0ZWQgcGFnZSB0YWJs
ZXM/IElmIG5vLCB3aGF0IGlzIHRoZSBwZXJmIGNoYXJhY3RlcmlzdGljcw0KPiB0byBleHBlY3Q/
DQo+IG9mIGNvdXJzZSB0aGF0IGNhbiBiZSBkb25lLCBQYWdlIHRhYmxlIGlzIG5vdCBhIHByb2Js
ZW0sIHRoZXJlIGFyZSBzb2Z0IG1tdQ0KPiBlbXVsYXRpb24gYW5kIHZpb21tdSwgdGhyb3VnaCBw
ZXJmb3JtYW5jZSBvdmVyaGVhZC4NCg0KRHVlIHRvIHRoZSBwZXJmb3JtYW5jZSBvdmVyaGVhZHMs
IEkgcmVhbGx5IGRvdWJ0IGFueSBjbG91ZCBvcGVyYXRvciB3b3VsZCB1c2UgcGFzc3Rocm91Z2gg
dmlydGlvIGRldmljZSBmb3IgYW55IHNlbnNpYmxlIHdvcmtsb2FkLg0KQnV0IHlvdSBtYXkga25v
dyBhbHJlYWR5IGhvdyBuZXN0ZWQgcGVyZm9ybWFuY2UgbG9va3MgbGlrZSB0aGF0IG1heSBiZSBh
Y2NlcHRhYmxlIHRvIHVzZXJzLg0K

