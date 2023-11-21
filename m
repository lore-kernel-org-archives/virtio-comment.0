Return-Path: <virtio-comment-return-8498-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853DC61D85
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 422C42A88F
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3923B9868A0
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 16:25:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2E5C098688A; Tue, 21 Nov 2023 16:25:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20B9D98688B
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 16:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4h9qIyDlJgAmUwanSg2udMPPh4wQBAuiTylczK+fPav5t2JEQpGbye5+f3Qfj8RZFEWeK4XSbrRWbWt5i0T3nA7sJhS2DZclbkh9v1887A+jOk9yd/nAqgf6lbII+wT6osqxz4N8NSgmG/TN72v4vQjyuhYkKVamLUZEwrNYrcXovV6DrUOeUuiHzKfvy50MhWaJ0exPeRzKtzaAcMk9tjKCPKH+Ax72Adp3lS9HINLeEoMDjvLVVk6wqf+enlHUEQa5UuPNn7gBkjpbpsIZVvddxTQz/HutiJULV2ZctcFVAthLrCfSNrYNL6svlFCO4JD6PqmKvaCKhTJBRGVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/xvMd5WK8j6E8I01pzSujgnZBuYb/NFd91za288mno=;
 b=Fy7WszM1HUOEM42cXQH5Epc1fN5QtCjLgpmU9z1TzXYDTyrV9WMyHPaMqVqlWQgcyxeguTUX1OepbWDu5ywlIWx6Itf9N2miyWzZovIBWNqc3n93z7teYrP30wtXSj+9Es1pxrFRpJibhC5FFZ7tmf5e8rh5gNCLqzBWSyz0S4sOqmxBGBNxZs/VL5VKee7WKiFYLiWmzi33QjqdXjmkGfs6dQnr6uBnhTdwHLrsVSddRQrcOi8KXRjiMQqXU3oRuKpryUeRnajDlaFqj6Glv0awE0Ryau3BQAGjpVWuATaUh8Ln2SElslL8gZ7/kMqMCRKBAaUbTM+VunAA+NtfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAA3lwAgAAHcaCAABr2AIAAAQ0QgAe48YCAAKtowA==
Date: Tue, 21 Nov 2023 16:25:09 +0000
Message-ID:
 <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
In-Reply-To:
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL3PR12MB6569:EE_
x-ms-office365-filtering-correlation-id: 10ba73e5-ae41-4857-1f96-08dbeaae6ddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KWFUT07skoz3bhwgWywJ6XSdrUMv3HA8YiqDjRAsGeW5TBmAeSF0f6D27b7jK6AlHYh3zpkty3E9fgjbOBYw5CrIGuGr9N63fZgKuFcIrzMcgDpSK6PJZc29g1J4AhfRDJSrqIax4s1gRMDvIRNdFCVbdvXqIgK8mito197vJsIi8RI6fn0d+gIYX1Ld5wGG1PScSFTLtyMWcYpzmt+9+gQfgAzeTku06BXRbt7aL4Mt/aH7snRupwhszG2o3bw0oqNzb2envN6EhLZQJRJZ231H7xUcGRmUAlp3VuKDSdtxP4CQvuFKVSZW4ANwAamH87xHLOLCs8kPOI+4DvfnO7Qs4mdQjKsBOc7cqCI/HV0OqNMCLPmIW1IgtUkXXxZ2S8Oxw5iG1dHAPbbkJYoBzUBZ8wjHIMN4CmO0dp2Df/Y3dyVGGWugLzxtrLAJQdeHiynnXnYN4UDnRss6PQiCSEzeArRMsKkB4dYACQNCczwMTMGyg5t9sb5DVuN+4ien21jCYzQwCaFKpoKXJYQWG0/TOy/wPIh2HwoFNTBAhNr3CsWoHna99CKhNfe4ILBnU/AAa1oa6Xz9klHGv1t+rb6T7uCRFMj708h5n/k891O/CsiUEfw5fyeZuLxn10c+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(86362001)(5660300002)(2906002)(54906003)(64756008)(66946007)(66556008)(66476007)(66446008)(6916009)(316002)(76116006)(8676002)(8936002)(4326008)(52536014)(38070700009)(33656002)(41300700001)(9686003)(55016003)(83380400001)(122000001)(478600001)(7696005)(6506007)(53546011)(71200400001)(107886003)(26005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QktNUmc2eWxZWnFWNzY2R2kyTElsSTIrdWJUVit2dXhTd2R1WmVyRXpiSWlZ?=
 =?utf-8?B?bDEvbVhlMUVzMzhqUGUyUDZ5SjFWOU15akgydXhxR3FhUHlYUVdtR09FeDEx?=
 =?utf-8?B?aHB2RGs0ay95dHhscmlVOVBYVytEWnFwTEtrMkx4Z1c1WkR3NXhPN1RLTkJX?=
 =?utf-8?B?RWxseGJZVGoxZDJmVmhSLzBDQjdra2tsdUZVUUlGUjFDMXJudFo3V0ZjZlc3?=
 =?utf-8?B?OUlIYW1Ld2RranI4WUFJOUFJVVhuRThMSFpuei9wYWhNbkc0aExGNTdiVnlt?=
 =?utf-8?B?TVRQUGtHM3ZSdXJHbmZyeXY2c0VuUFlLN2pkRVhkZm1sMUlKNVJyT3laYzlk?=
 =?utf-8?B?NFhONGhiS1NuWkY5cGZkVFpVNzJKTWxHQUVZcDV5WnUxMjQ0cnNnWXVxQlBx?=
 =?utf-8?B?alpxWGxsQjBUV1Z0Q0RPOEJUU3dDTEdDVjd4b1FsR0NhY2lCZmFxSDZodm9E?=
 =?utf-8?B?U1l3dnFKc012SHd5RS9EZGlzdEh4cDU1M2tvRFZnWmE5YWVzZEZSWi80VFB5?=
 =?utf-8?B?WTdNRUhyTU1MMmgwSWlUWnY5NVdmR3dydCtnSzZpODVHZVBTRU9ZQ1FkekNR?=
 =?utf-8?B?NHN6bVVhVWR3SFhkaGNiTHVSKys5MnhVeWo4UjdXZXVPU09ueVZmRFlYVGVi?=
 =?utf-8?B?cWtzaEcwRnFEUE1kdkhySEdzQ2Jod3pHQndFUlZ2RWwvaUlOTWdhSnR3a1ZS?=
 =?utf-8?B?emJwbGJnd2Q1QlEzODBNN3FNczVJeWZNbHB5cmtmSUNzOERtNE1IV2UzQm8w?=
 =?utf-8?B?MENZV1FOOTNudkdocG04NFZZMEtZdEtKQ0hZVy85dWRYQ2F6NGF1NGJRdkNi?=
 =?utf-8?B?Nlg4azVJaGw0MGZSbE9KMC8yVklUR1FaMVQ5aWs5TWhGdGdIRUE1NmFxb05B?=
 =?utf-8?B?MFl3QjVvV2ZzNDFQWGx5eHJsdEV5RGRqejdmUmlpc3NIMjVxSURoSE1DRG96?=
 =?utf-8?B?cnV2VitjREJPc2JWd0p2WjhiVlBzbkprakpaZ2I1dXEwRkR2R3h5REU2MUFl?=
 =?utf-8?B?WHFUVFlBbVEvelYvc3pDQmZqcGNBRHUyM09wYkVVd2w0czZQMTB3WXUycnVw?=
 =?utf-8?B?S0ZYRmRHb01BVks1enI4U2o1TFhuUUc4K1Ura3h2amduR09ScHRvNUhXK1BJ?=
 =?utf-8?B?aVFCdWM5bE5veHdTM0dWaVZ2WnNjUlJwMDFtWHFVMCszek5BWVBtWjJTcGd2?=
 =?utf-8?B?NE9yYzZ2ajlvempaKytyN3hTWDI3S3ZVM3RGbEp5NTJ5eHhoT3QvL2Q1OXJy?=
 =?utf-8?B?NlZCRlRxcHdtcTFUOFhpM0Q3L3lMTlV1TFFsWW9EV1gyeS9mblBZaUlCNjRZ?=
 =?utf-8?B?MW5mQnB3UktQamJ3NWQ2aThBVjMyUExySC9iVEZ3WmVuSC9GM1lDek1wZ0Nn?=
 =?utf-8?B?Ukd4ZkVScUFlMGJTcU1WK1Z4RmJYZHlHN3dDaEtZdjBiMTZPYlh6OHRNaTBp?=
 =?utf-8?B?bHkyVzBUWXJOM3BKendpQ2FkQm9SaGNWMGZYNzJPWTIvdVFUN3BBM1VNZkFl?=
 =?utf-8?B?RFhPRlErQ2oyQTc0Ulo1MkU3OEdvd3BFNHRNdTVnY3B1QlpCRnRhK2pPY3Yr?=
 =?utf-8?B?YjVGMERIQ0tuQXlMcHZ3SjdkanZYc3hpaWVHTkt0VXQ0emRyeFNja002V3k5?=
 =?utf-8?B?alZ4eldCU3c4U041SjRSYVdsc0JUZlN5TTlrOERxeGZUcmpsL2xEbnkwajBm?=
 =?utf-8?B?elJJS1VDRVRYVldVdDJmb054NnRXNkhYWFhVM2FjYUVoN0NYOWgxN21pNmp1?=
 =?utf-8?B?aXJUcTMvMmtwVjNxajhMa1hxdjVtc2NnK1hGYWViTFMzcXJOUkRPbkg1SFhF?=
 =?utf-8?B?TTdJVThzcSs0cGNreDBnZEhlV2xheVFMMWhya091a2tNYm1MWjdPaGVRcU1m?=
 =?utf-8?B?TXRTSStucmZsU0ZXU1l1clhhNkppNVptV0MxSG01Sy8vWkFsUEQ2VVB5RVQy?=
 =?utf-8?B?Mm1PMjNTc255WnpHVytaV1B4ZHo1Yld5QWpWeVloYTVTOXR0Sk90SHFOdjRw?=
 =?utf-8?B?emZ3aG1uRlJnTWFQNEdqOXlob1NoV3hyTGhmMmo0SWR1VWhoS2l6R3RLTlo5?=
 =?utf-8?B?YTIvQWFFNHAxK1hEeUVVKzU1U0dLbWM2eGVVMXpLSGRCZlZ0Snd6eEtDWDl2?=
 =?utf-8?Q?VZuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ba73e5-ae41-4857-1f96-08dbeaae6ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 16:25:09.1378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcbxQVo14GElngQfO+oHvUaKCOrNxEnNpuLDATdHd6PGCWp0U2JETx8+5M8aXzrv+5NL9/0jlO1i0vwaB4LA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDIxLCAyMDIzIDk6NTMgQU0NCj4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQg
MjozNOKAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4NCj4g
Pg0KPiA+DQo+ID4gPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0K
PiA+ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE2LCAyMDIzIDExOjUzIEFNDQo+ID4gPg0K
PiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMDU6Mjg6MTlBTSArMDAwMCwgUGFyYXYgUGFu
ZGl0IHdyb3RlOg0KPiA+ID4gPiBZb3UgY29udGludWUgdG8gd2FudCB0byBvdmVybG9hZCBhZG1p
biBjb21tYW5kcyBmb3IgZHVhbCBwdXJwb3NlLA0KPiA+ID4gPiBkb2VzDQo+ID4gPiBub3QgbWFr
ZSBzZW5zZSB0byBtZS4NCj4gPiA+DQo+ID4gPiBkdWFsIC0+IGFzIGEgdHJhbnNwb3J0IGFuZCBm
b3IgbWlncmF0aW9uPyB3aHkgY2FuJ3QgdGhleSBiZSB1c2VkIGZvcg0KPiA+ID4gdGhpcz8gSSB3
YXMgcmVhbGx5IGhvcGluZyB0byBjb3ZlciB0aGVzZSB0d28gY2FzZXMgd2hlbiBJIHByb3Bvc2Vk
IHRoZW0uDQo+ID4gRm9yIGZvbGxvd2luZyByZWFzb25zLg0KPiA+DQo+ID4gMS4gbWlncmF0aW9u
IG5lZWRzIGluY3JlbWVudGFsIHJlYWRzIG9mIG9ubHkgY2hhbmdlZCBjb250ZXh0IGJldHdlZW4N
Cj4gPiB0d28gcmVhZHMNCj4gDQo+IFRoaXMgaXMgd3JvbmcuIFdlIG5lZWQgdG8gaW52ZW50IGdl
bmVyYWwgZmFjaWxpdGllcy4gSSd2ZSBwb2ludGVkIG91dCBzdWZmaWNpZW50DQo+IGlzc3Vlcywg
YW5kIHdoYXQncyBtb3JlIGRlbHRhIGRvZXNuJ3Qgd29yayBmb3IgdGhlIGZvbGxvd2luZyBjYXNl
czoNCj4gDQpJIGRpc2FncmVlIHRvIHlvdXIgYWJvdmUgY29tbWVudHMuIFBsZWFzZSByZWFkIGJl
bG93Lg0KSXQgd29ya3MuDQoNCj4gMSkgbWlncmF0aW9uIGJ1dCBmYWlsIHRoZSBhbm90aGVyIHRy
eSBmb3IgbWlncmF0aW9uDQoNCldoZW4gaHlwZXJ2aXNvciB3YW50cyB0byByZXRyeSB0aGUgbWln
cmF0aW9uLCBpdCBpbnZva2VzIHRoZSBESVNDQVJEIGNvbW1hbmQgcHJlc2VudCBpbiB2NC4NCkFu
ZCBzdGFydHMgcmVhZGluZyB0aGUgZGV2aWNlIGNvbnRleHQgYWdhaW4uDQoNCj4gMikgc2F2ZSB2
bSBzdGF0ZSB0d2ljZQ0KPiANClRoaXMgY2FuIGJlIHNhdmVkIHR3aWNlIHdoZW4gbmVlZGVkLg0K
DQo+IEl0IHJlcXVlc3QgYSBsb3Qgb2YgdHJpY2tzIGluIGh5cGVydmlzb3IgdG8gZG8gdGhhdCAo
ZS5nIGNhY2hlIHRoZSBsYXN0IHN0YXRlPykuDQpOb3QgcmVhbGx5Lg0KSHlwZXJ2aXNvciBjYW4g
YWx3YXlzIGRpc2NhcmQgd2hhdCBpdCByZWFkIGFuZCByZS1yZWFkIGl0IGFnYWluIGFzIGZyZXNo
IGRldmljZSBjb250ZXh0Lg0KDQo+IA0KPiA+DQo+ID4gMi4gbWlncmF0aW9uIHdyaXRlcyBjb3Zl
cnMgbGFyZ2UgcGFydCBvZiB0aGUgY29uZmlndXJhdGlvbnMgbm90IGp1c3QgdmlydGlvDQo+IGNv
bW1vbiBjb25maWcgYW5kIGRldmljZSBjb25maWcuDQo+IA0KPiBZb3UgaW52ZW50IGEgZHVwbGlj
YXRpb24gb2YgY29tbW9uX2NmZyBzdHJ1Y3R1cmUgbm8/DQo+IA0KTm9wLg0KQ29tbW9uIGNvbmZp
Z3VyYXRpb24gaXMgd3JpdHRlbiB1c2luZyBhIE1NSU8sIGJ5dGUvd29yZCBldGMgYm91bmRhcnkg
YnkgdGhlIGd1ZXN0IGRpcmVjdGx5IGluIGd1ZXN0IG93bmVkIGFyZWEuDQoNCj4gV2hhdCdzIHdy
b25nIGlmIHdlIGp1c3QgYWxsb3cgdGhlbSB0byBiZSBSL1cgb3ZlciBhZG1pbnEvY21tYW5kcz8N
Cj4gDQpBcyBleHBsYWluZWQgYmVmb3JlLA0KRWFjaCBndWVzdCBoYXMgaXRzIG93biBkZWRpY2F0
ZWQgbm9uIG1lZGlhdGVkIGludGVyZmFjZSBhcyBkZWZpbmVkIGluIHZpcnRpbyBzcGVjIHRvIG5v
dCBpbnZvbHZlIGh5cGVydmlzb3IuDQpUaGlzIGlzIHVuaWZvcm0gZm9yIFBGIGFuZCBTUi1JT1Yg
VkZzLg0KQW5kIGl0IHdpbGwgYmUgdW5pZm9ybSBmb3IgYmFja3dhcmQgY29tcGF0aWJsZSBTSU9W
IHRvbW9ycm93LCBvbmUgdGhlIHBlcmZvcm1hbmNlIG51bWJlcnMgZm9yIFNJT1YgYXJlIGF2YWls
YWJsZS4NCkZvciBub24tYmFja3dhcmQgY29tcGF0aWJsZSBTSU9WLCB0aGVyZSBpcyBiZXR0ZXIg
d2F5IHRvIG5vdCBoYXZlIHN1Y2ggYSBsYXJnZSBjb25maWcgc3BhY2UgYW55d2F5Lg0KDQo+ID4g
U3VjaCBhcyBjb25maWd1cmF0aW9uIG9jY3VycmVkIHRocm91Z2ggdGhlIENWUS4gQWxsIG9mIHRo
ZXNlIGlzIG5vdCBuZWVkZWQNCj4gd2hlbiBkb25lIGZyb20gZ3Vlc3QgZGlyZWN0bHkgdmlhIG1l
bWJlcidzIG93biBDVlEuDQo+IA0KPiBUaGF0J3MgdGhlIGRldmljZSB0eXBlIHNwZWNpZmljIHN0
YXRlIHdoaWNoIHJlcXVpcmVzIG5ldyBjb21tYW5kcyBmb3JzdXJlLiBJDQo+IGRvbid0IHNlZSBh
bnkgY29ubmVjdGlvbi4gVGhlIFNJT1YgZGV2aWNlIG5lZWRzIHRvIGJlIG1pZ3JhdGVkIGFzIHdl
bGwuDQo+IA0KQW5kIHRoZXkgd2lsbCB1c2UgYWxsIG1ham9yaXR5IG9mIHRoZSBkZXZpY2UgY29u
dGV4dCBhcyBwcmVzZW50ZWQgaGVyZS4NCg0KPiA+DQo+ID4gRm9yIGJhY2t3YXJkIGNvbXBhdGli
bGUgU0lPViB0cmFuc3BvcnQsIG9uZSBtYXkgbmVlZCB0aGVtIHRvIHRyYW5zcG9ydA0KPiB3aXRo
b3V0IGFib3ZlIHR3byBwcm9wZXJ0aWVzLg0KPiANCj4gV2h5LCBqdXN0IG1lZGlhdGUgYmV0d2Vl
biB2aXJ0dWFsIFBDSSBhbmQgYWRtaW5xLg0KPiANCkkgZG9u4oCZdCB1bmRlcnN0YW5kIHRoaXMu
DQoNCj4gPg0KPiA+IDMuIE5vbmUgb2YgdGhpcyB0cmFuc3BvcnQgaXMgbmVlZGVkIGZvciBQRnMs
IFZGcyBhbmQgbm9uLWJhY2t3YXJkDQo+IGNvbXBhdGlibGUgU0lPVnMuDQo+ID4gRWFjaCBkZXZp
Y2UgdG8gaGF2ZSBpdHMgb3duIHRyYW5zcG9ydCB0aGF0IGlzIG5vdCBpbnRlcmNlcHRlZCBieSB0
aGUNCj4gaHlwZXJ2aXNvciBhbmQgZm9sbG93IHRoZSBlcXVpdmFsZW5jeSBwcmluY2lwbGUgdW5p
Zm9ybWx5IGZvciBhbGwgMyBkZXZpY2UgdHlwZXMuDQo+IA0KPiBZb3UgY2FuIGhhdmUgcGVyIFZG
IHRyYW5zcG9ydCBxLCB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGF0Pw0KQXMgZXhwbGFpbmVkIGluIHRo
ZSBkb2MgYW5kIGluIG11bHRpcGxlIGVtYWlscywgaXQgaXMgaW5lZmZpY2llbnQuIENWUSBpcyBq
dXN0IGVub3VnaC4NCg==

