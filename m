Return-Path: <virtio-comment-return-8547-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F1C61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:14:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0DBE2B147
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:14:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A74BC9868A7
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 10:14:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 87EA8986895; Wed, 22 Nov 2023 10:14:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77ADD986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 10:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2zUOcxNQrJ47C+j2EdlnolnJdEZ1/pPciHp+XrejY4glu7UvKJSoAqtRhLWCs8Q8mxf3oYRgrG8ua05CBA2Z8TzQDw+errEj46kSNbEgcGHjrjUsYF7k1dTguNqjfxtk/oTdm6V4ZOVh9PPRnIkcez8d1PcCVi5Cx8ooLu9bn4iHJ0yanDVrofDBtTTFngTQu1x2B6mTfWYsosgVBmlmZAHNJZ1YTpKBtfXjKYbaZdDs2xNZ2/QdojloV/PD7x0qWv2dHdSXedGjv+3eYgIVCHNt7DFQbJ8Ky5ByP/lqaVXDamWGe0XGr8V07EtzJPXjzfSJT1uLIZg2df6rSCHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//hJ3nsuzh2H/r99clcbty4h2q0yUfMEfcJuP0wWaKI=;
 b=ksFa1XFd2RkknHW5VIh0oB54AKPsxhvIa+SQAXUrrLNECr/bXWMRbfuFTpKaNdF/WUyKo90CqctJcbHN74O0GRMA0IX4qTCSAwZqgjTGFFw0lsPrntHjBYWClqnQQUc6eZPd01J55d2mCSGnZ44Hga962xRXZcX2gOLW7UqquvkcHeE/Z1j9mUrdGr0YletBzFfd1BCSTrb1H9yd8XaJCgmprxnxO7K0Ru/k0gScRNcLXvdBw3iXcRklK8kKdTvo2MRgJgdSL24ATKMJ76l809FkWreQl82oKuy9sgZwHlLFO3kY1PVEEQM/iOSxi2Cvfq3vEPTQhINYjjMldA5e5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND
Thread-Index:
 AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiCABdpcAIAD/JZggADHAYCAAANsQIAIDjuAgADmeQCAAEx8gIAAUcaQgAA3zACAAADSsA==
Date: Wed, 22 Nov 2023 10:14:46 +0000
Message-ID:
 <PH0PR12MB5481C717C8180679F89F1FD8DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
 <PH0PR12MB548163E7EA30AFE2BAF7A937DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6d60a6d4-f02b-4fd1-8981-f605552ee94e@intel.com>
In-Reply-To: <6d60a6d4-f02b-4fd1-8981-f605552ee94e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7566:EE_
x-ms-office365-filtering-correlation-id: d124074d-7916-4f9e-69ba-08dbeb43daae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RIxUvYLKdN5s7h8rQd9XcW4FpPkKrIrJGVbs7N6SodlFrKzUYDLoyMnxw3waeTVu4Ath8o5QvU7Nsm6lpnIcMWszvV5GaHgdO9ZoglczkMwKPPsSqKtRrfHoaCFHcKW7dS7O//xCO7V3V4qtnKRCYQQTON4c1WhGSNsDJr152PqBkomS2vnyMhV6wDq9kRdZytGlMvB5dWJVCozQavcNAT7ZDV53wGGYdKckuZ4sfOiQdStx8fa4fPDC4d4CQFyJdaKmJWn4QCdc9hM1AmWuDDnoEZKtd7rDdk8h8y7or5p3VzrwKbEy4AoM1dBX44Wc1p0Rb/HxycmMOe7jbqYBjM8nHagUB2ChBWYtcLcvsRrdx0ftJ3B3Y1IdNXGGyygMD8whqNIKR/QJ7zAmBw/7XbNKXXMdPM/xAd6Ve/LAUmP4hOLkgivFMnIEr+V98EEHpgTh9AOPjDGWc0Nn6u/xDZ1FBgDb7lYPvmIZe3nvLziQfamRANrKCNG+G9WYYntE5ayua17fQmKPFF63it+gGOZkztffdJn0R474ZmXg7dPpn0OCdXqYh7tYpGmm5qxlkUgIFzQIu9wWPOQHc+nilRasHKLAACgS/I+rOvBb6ae2xFGlkmuSlXq1fZhun7WvNWSFl8beWIq0qnkf1n+idA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(86362001)(38070700009)(55016003)(83380400001)(71200400001)(110136005)(66946007)(316002)(7696005)(66476007)(64756008)(66556008)(66446008)(76116006)(122000001)(33656002)(54906003)(6506007)(53546011)(9686003)(26005)(41300700001)(478600001)(4326008)(2906002)(5660300002)(52536014)(8676002)(15650500001)(38100700002)(8936002)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGcyL0dnbm5rR0U3Q1crYjBtQXc3UWdOaGl1eTVCb0tJS2ZBRmx3NXFhM3Jh?=
 =?utf-8?B?SW8vUHl3bHBZSDFhYkdHeXpOQWFqTndtOE5TNVFqRWlMNmlWSkhZR3NySFR4?=
 =?utf-8?B?TjlJaVp4VE1OWVVkam80UTcxWUVKVjVJZXVKNHMvZVNKZTZDWXlpSWdLa2JY?=
 =?utf-8?B?Sk9pVGF3eFlleU85VnAzNEEzMFVSUVcvRkFCbTk4Z01zQktmNU1VQm54TytH?=
 =?utf-8?B?SmRSVGJHdVdicVVUL1RaSmgvTnZLM2VmYzRKQ0E3ZkYraU1BVXhNWDlFcGt3?=
 =?utf-8?B?bHN1dW5FVGhBRnhwT0xBRVYvZGdWUWZKclpXOW1mSU9tejQ0Rm16SHMyeG9W?=
 =?utf-8?B?cStmbUhueHFHdGhhS3J6TFVlREUwSjZrNGtZUndDSmtNKzV1a3RTdFl6QjJD?=
 =?utf-8?B?WU5hS2JFbEtCaE9HVXBEQ3R4VXE0ZnNQT0xHN3dDTmxTVnNXRHFKMVlBeUtk?=
 =?utf-8?B?YTJYemZvbFgxSVZYRi9FOFpiOGt3clIyWW1XRExvLy9ObWJwVmdZWnNIZkNJ?=
 =?utf-8?B?Wm9HcUpXS0RkQXhPK2FJakZINnA3L0c4U1QwVmtLcFlrTzc0RmhSdURtSmVy?=
 =?utf-8?B?UHkvVG84RStucGN4NGVQaFplQmRmUnRENEMzbXN2Szh4Rm8zNEpaa3I1cDdr?=
 =?utf-8?B?VjlhVlBCL2orKzJYNDMzNFZTZTlSZldYVU5WWUxoZndTKytiVm9oOElHOEd3?=
 =?utf-8?B?RENoOXVVVnp3Q2NYOTFkSFo5RS9rbDlLWEdrTkRYUVBxVFFqclZyL0RPZUR4?=
 =?utf-8?B?N0JKSjBYSkpYa3UyVzhreVQ4L3pnRTJROUk5ZElUanljczFGZi9IVTRjRFRX?=
 =?utf-8?B?SlpHRWJZQkpJZ3I0dE9vQVdEOE5OU2phMTE1bXltY2I3Yks1VzZTTmp0Vlpl?=
 =?utf-8?B?TTFBOWJkME1ZUDhmS2ptajdBQzAxSDkyb01YaHZYTjBvQjBjNlkrcmdoTHlh?=
 =?utf-8?B?VXVVR2RJcHpub3BkZDJCQkRlNjd1bXRpU1AyVHRZcmdJN2EvQUswZTY3aHlp?=
 =?utf-8?B?ZjlQKzRTQ09LdjNxcHgrdzZnUkdzQThTRFRaMkUrcVhCMlBncDhSNmNwcDZn?=
 =?utf-8?B?M1l0OS9NWWxsdzNpZWg2UDdXNHJiV2VUZkdJNXlSTTg4d3FZRmsxKzg4Vjky?=
 =?utf-8?B?a3hFeXJ0WFJaTk53ZmdIeVVGK1dZL29IR0VBVW0xK2p1SU12Y2hVRzNlalVG?=
 =?utf-8?B?dTE5ZitKNkZ5dUxUVll6SExKNWJrcmRaU3h0UGVGdElKOUYyS2ZOelFybFRr?=
 =?utf-8?B?WkdjTTYyZHUwMkNyQlBRWkRZQy9BVlZtanViZVc3NU9EakF5RjJ4cXpWVVA1?=
 =?utf-8?B?MzhKSUFXSGVpZ0pFOEZDUlErSzRFNkZZNVhJejZEaGdVSFlVTFZPaFpBYThU?=
 =?utf-8?B?cWUxSmQyVjBhTTR3elkzaDdJTWpPZXZHWW1xN3Y3V3luU29GNHJnZHBlMllo?=
 =?utf-8?B?R3krU1RVR2g3aVo2Mi9zMFM5MGtlaTA3YldKWWN3alZ0R0gyWUtqQkNGckcw?=
 =?utf-8?B?bTBHUTA1bHFzWXJXL3BKU2RsbnFCZW1OaEIvQnNaQmN0RTJHN2hWSXZad25t?=
 =?utf-8?B?LytwaGF0MEpVbzMzbmcyQjVWV0FjVkx6TmJKRFhPUDNFblBzUFU4dnkzWGN1?=
 =?utf-8?B?d3NUdXhMelgyU2Vpa2h5TWlUY3Z1RHhpczdHTkFPVkp4dEFjQVhTNERFTmdW?=
 =?utf-8?B?R29mRFNJSUpCQnRNNU10ZWk4MmcyMmR6ckpVTFFvQ0tiOXd5bGlCTXlSelBN?=
 =?utf-8?B?YXh1R005T3pnakxmM0w1YzhQQ1A5OTRmTVBLSXZWa25Pd3FWNmhGb3hLTmk4?=
 =?utf-8?B?c3lsSzBTWGJoTTUwaWo0NHpRT2plYXhhMHRaZ3E5blFDVm1RVjJBQzdHRWMw?=
 =?utf-8?B?RHp2NDBvSmdQeFlTY2ZMTUIzQVYvQkhLY0JlcDVCMDIzQjRaNEo3UlR1NmJa?=
 =?utf-8?B?Ly9xRFhnWEkweWZvRUVNMi9CUVhtUE9Td2IySGt6MS9tOWdHZmErRG00K0ZS?=
 =?utf-8?B?TGU1NnBkNkdpY3dMaDBGSWl0UG1naCs3Q3BtaGFtdHpvdXNveTVraE9LT2s3?=
 =?utf-8?B?Y2FVY1VmcVZZNzhpa3J3OEZURWwvTHBYVU9ZQ1BpMXVmaE9VVk5QbTlwYzJQ?=
 =?utf-8?Q?ovUs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d124074d-7916-4f9e-69ba-08dbeb43daae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 10:14:46.6902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzQbx7REqReixSVDEhJZX4CMjZeCaq0xGAA7EUDy/CflC0WUl4rZehZqtifMaZ/L+HducmorRx0RTYtmzmwNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566
Subject: RE: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgTm92ZW1iZXIgMjIsIDIwMjMgMzozNCBQTQ0KPiANCj4gT24gMTEvMjIvMjAy
MyAyOjQ3IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+IEZyb206IFpodSwgTGluZ3NoYW4g
PGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIg
MjIsIDIwMjMgNzoyMiBBTQ0KPiA+Pg0KPiA+PiBPbiAxMS8yMi8yMDIzIDU6MTggQU0sIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgTm92IDIxLCAyMDIzIGF0IDAzOjMz
OjA3UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6DQo+ID4+Pj4+IExpbmdzaGFuIGNsYWltZWQg
dGhhdCBzdXNwZW5kaW5nIGRldmljZSBpcyBmb3IgbGl2ZSBtaWdyYXRpb24gaW4NCj4gPj4+Pj4g
Y29tbWl0IGxvZw0KPiA+PiBhbmQgaW4gZGlzY3Vzc2lvbiBoZSBwb3J0cmF5IGl0IGFzIHNvbWUg
YmFzaWMgZmFjaWxpdHkgdW5yZWxhdGVkIHRvDQo+ID4+IGRldmljZSBtaWdyYXRpb24gc3VjaCBh
cyBkZWJ1ZyBldGMuDQo+ID4+Pj4+IEluc3RlYWQgb2YgY2xhaW1pbmcgaXQgYXMgc29tZSBub25f
ZGV2aWNlX21pZ3JhdGlvbiBmYWNpbGl0eSBkb2VzDQo+ID4+Pj4+IG5vdCBtYWtlDQo+ID4+IHNl
bnNlLg0KPiA+Pj4+IEl0IGlzIHVzZWQgZm9yIG1pZ3JhdGlvbiBmb3Igc3VyZS4NCj4gPj4+IFdl
bGwgaGF2aW5nIGEgZ2VuZXJpYyBmYWNpbGl0eSB0byBzdG9wIGRldmljZSBzb3VuZHMgbGlrZSBh
IG5pY2UgdGhpbmcuDQo+ID4+PiBIb3dldmVyIHRoZSBkZXZpbCBpcyBpbiB0aGUgZGV0YWlsLiBB
IGxvdCBvZiBkZXRhaWwgaGVyZSBzZWVtcyB2ZXJ5DQo+ID4+PiBtdWNoIHRhaWxvcmVkIHRvIGEg
dmVyeSBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBpbiBtaW5kLg0KPiA+Pj4gU28gdGhpbmtpbmcg
dGhyb3VnaCBob3cgaXQgd2lsbCB3b3JrIGUuZy4gZm9yIHBvd2VyIG1hbmFnZW1lbnQgd291bGQN
Cj4gPj4+IGJlIGEgZ29vZCBleGNlcmNpc2UgdG8gZmlndXJlIG91dCBob3cgaXQgc2hvdWxkIHdv
cmsgaW4gZGV0YWlsLg0KPiA+Pj4gUGFyYXYgZGlkIHlvdSBpbmRpY2F0ZSBhdCBzb21lIHBvaW50
IGEgdmlydGlvIHNwZWNpZmljIFNVU1BFTkQgYml0DQo+ID4+PiBjYW4gYmUgdXNlZnVsIGZvciBQ
TT8gQ291bGQgeW91IHNoYXJlIGhvdyBpdCdzIGJldHRlciB0aGFuIHRyYW5zcG9ydA0KPiA+Pj4g
bGV2ZWwgUE0gYW5kIHdoYXQgdGhlIHJlcXVpcmVtZW50cyBhcmU/DQo+ID4+PiBUaGFua3MhDQo+
ID4+IERvIHlvdSBtZWFuIGxldHRpbmcgdGhlIGRldmljZSBlbnRlciBhIG5ldyBwb3dlciBzdGF0
ZSB3aGVuIFNVU1BFTkQsDQo+ID4+IGFuZCBzdWNoIGRlc2NyaXB0aW9uIGluIHRyYW5zcG9ydC1w
Y2kudGV4PyBUaGVuIHJlc3VtZSBub3JtYWwgc3RhdGUNCj4gPj4gb24gRFJJVkVSX09LLg0KPiA+
IE15IHByb3Bvc2FsIGlzLA0KPiA+IDEuIHN1c3BlbmQgYml0IChub3Qgc3RhdGUpIHRvIGJlIGNv
bnRyb2xsZWQgYnkgdGhlIGd1ZXN0IGRyaXZlcg0KPiBUaGUgZ3Vlc3QgY2FuIHNldCBTVVNQRU5E
IGJpdCBmb3Igc3VyZS4gSG93ZXZlciB0aGVyZSBpcyBubyByZWFzb24gdG8gZm9yYmlkDQo+IGhv
c3QgZnJvbSBzZXR0aW5nIFNVU1BFTkQuDQpTdXJlLiBoeXBlcnZpc29yIGNhbiBhbHNvIHRvdWNo
IGFsbCB0aGUgYml0cyBpdCBoYXMgYWNjZXNzIHRvLg0KDQo+IA0KPiBUaGUgcmVhc29uIGlzLCB0
aGUgbGl2ZSBtaWdyYXRpb24gcHJvY2VzcyBzaG91bGQgYmUgdHJhbnNwYXJlbnQgdG8gdGhlIGd1
ZXN0LA0KPiB0aGF0IG1lYW5zIHRoZSBndWVzdCBzaG91bGQgYmUgc3VzcGVuZGVkIGZpcnN0LCB0
aGVuIHRoZSBob3N0IHN1c3BlbmQgdGhlDQo+IGRldmljZSwgc28gbm8gSS9PIGVycm9ycyBpbiB0
aGUgZ3Vlc3QuDQpJIGV4cGxhaW5lZCB0aGlzIHlkYXkgdG8gbXkgYmVzdCwgdGhhdCBoeXBlcnZp
c29yIGluIG15IHByb3Bvc2FsIGFsc28gbXVzdCB0b3VjaCB0aGUgZGV2aWNlIHdoZW4gdGhlIGd1
ZXN0IGlzIE5PVCBzdXNwZW5kZWQuDQpUaGlzIGlzIGhlbHBpbmcgdG8gbG93ZXIgdGhlIGRvd250
aW1lIGFzIGJhc2UgdGVuZXQuDQoNCih5b3UgY2FuIGltYWdpbmUgYXMgdGhlIHByZS1jb3B5IHBo
YXNlIG9mIHRoZSBkZXZpY2UgY29udGV4dCBsaWtlIGhvdyB0aGVyZSBpcyBwcmUtY29weSBpcyBw
cmVzZW50IGZvciB0aGUgbWVtb3J5KS4NCg0Kc28gZ3Vlc3QgdmNwdXMgdG8gc3VzcGVuZCBmaXJz
dCBiZWZvcmUgZGV2aWNlIGlzIHNtYWxsZXIgY2FzZSBvZiB3aGF0IG15IHByb3Bvc2FsIGNvdmVy
cy4NCkFuZCBpdCBpcyBmaW5lLg0KDQpJIGFtIG9rIHdpdGggZ3Vlc3QgY29udHJvbGxlZCBzdXNw
ZW5kIGJpdCwgdGhhdCBvcHRpb25hbGx5IG1heSBiZSB1c2VkIGJ5IHRoZSBoeXBlcnZpc29yLg0K
DQo+ID4gMi4gdGhpcyBiaXQgbXVzdCBiZSBidXN5IHBvbGwgdHlwZS4gTWVhbmluZywNCj4gVGhp
cyBpcyBhbHJlYWR5IGluIHRoZSBwYXRjaCwgdGhlIGRyaXZlciBzaG91bGQgcmUtcmVhZCB0byBt
YWtlIHN1cmUgdGhlDQo+IFNVU1BFTkQgYml0IGlzIHNldC4NCj4gPiBhLiB0aGUgZHJpdmVyIG11
c3QgZ2V0IGFja25vd2xlZGdlbWVudCBmcm9tIHRoZSBkZXZpY2UgdGhhdCB0aGUgc3VzcGVuZA0K
PiBvcGVyYXRpb24gaXMgY29tcGxldGVkIGluIHRoZSBkZXZpY2UuDQo+ID4gYi4gdGhlIGRyaXZl
ciBtdXN0IGdldCBhY2tub3dsZWRnZW1lbnQgZnJvbSB0aGUgZGV2aWNlIHRoYXQgdGhlIHJlc3Vt
ZQ0KPiBvcGVyYXRpb24gaXMgY29tcGxldGVkIGluIHRoZSBkZXZpY2UuDQo+IFllcywgYnkgcmUt
cmVhZCwgZm9yIGV4YW1wbGUgdGhlIGRldmljZSBzaG91bGQgb25seSBwcmVzZW50IFNVU1BFTkQg
Yml0IGluIHRoZQ0KPiBkZXZpY2Ugc3RhdHVzIHdoZW4gaXQgZmluaXNoZWQgdGhlIHByb2Nlc3Mg
dG8gc3VzcGVuZCwgYWxyZWFkeSBpbiB0aGUgcGF0Y2gNCj4gc2VyaWVzLg0KPiA+DQo+ID4gMy4g
Tm90IHRvIGNvbmZ1c2UgdGhpcyB3aXRoIGFkbWluaXN0cmF0aXZlIG1vZGUgYWN0aXZlL3N0b3Av
ZnJlZXplIHNldA0KPiA+IGJ5IHRoZSBvd25lciBkZXZpY2UgZHVyaW5nIGRldmljZSBtaWdyYXRp
b24NCj4gPg0KPiA+IDQuIFRoaXMgZmVhdHVyZSBpcyB1c2FibGUgaW4gcG93ZXIgbWFuYWdlbWVu
dCB1c2UgY2FzZSBhbmQgbWF5IGJlIHNvbWUNCj4gb3RoZXIuDQo+IFllcywgYXMgbG9uZyBhcyB3
ZSB1c2UgdmlydGlvIHN0YXR1cyB0byBjb250cm9sIFBNLCByYXRoZXIgdGhhbiB0aGUgcmV2ZXJz
ZS4NCg0KUENJIFBNIGlzIGFscmVhZHkgdGhlcmUuIFRoZSBleHRyYSBvcHRpb25hbCBzdXNwZW5k
IGJpdCBpcyBhbiBhaWQgdG8gdGhvc2UgdmlydGlvIGRldmljZSB3aGljaCBjYW5ub3QgbWVldCB0
aGUgZGVhZGxpbmVzIGluIDEwbXNlYyB0aW1pbmcuDQo=

