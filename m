Return-Path: <virtio-comment-return-7895-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836EDC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D7C1C1FF9C
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7D8B98666A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 04:42:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BF1FE98637E; Mon, 23 Oct 2023 04:42:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B19A4986663
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 04:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7QBjGXVU/xQ3NTlt5n/u7BB/n15Ny0KBJao/piK3y4qqs0PyxP7zoWqYAD7FxPnCP4bK8vhDzlekt76hVzSMwVgqEn6JbwSJP8q07zHQODRIZcwYjgW4LKOU3RIf7h6Oo65V1tr5gUxbB65UXLG3isHdefsxA0Ka7sxdH+XLgeOuND7e4c0tFwWsGIKItQJQEuV52+wTXoVkwPF6/pUA6QbLfGb4XKyXDxYx6IyaoGAh7f214eJidz0iWYvZTb+0fdG+NQhCgp9uaOtfaVh69ftwTc2Z+aAfWpq1mFttJvmcT2+rYeKOhJCDGU4Dyi/BlFsdjwlxd0YDeukx3zHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CXC/fGJlZXEWLyWZujVpZXuFCc9FTs/fGmce/IfDNs=;
 b=XkiTkx33n7oIB9sK/Twc1gkaLJA1/JhrB/IhnowhZQhlW9kap3lBGvdY90pLFmnpOo73QYE2TBpr5LDc/sXgthTx3TVLXJQbtRNhVNwHULR1zOABo6LCXskrCoTqKcCw2GJ0jD3XeLMNHyweyljNrQoBBGT9Nhkt0tQj4iuhrDcKtSYRA1zph5cOpicvkE6teQLm8xpoAT8UE99AmtTZueXZ/u2Tzu273w8nqfK+Bp25XQ+O9GgsVh5Fnc3XXL3BKK68qM71/DaRMO/bwfP0obWMJhTI9roU3bLPEu+KDvZBx6U3xW2+PryxZenokan/6YnLFjWSW7rml+RMFeJXWw==
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
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZg
Date: Mon, 23 Oct 2023 04:42:53 +0000
Message-ID:
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
In-Reply-To:
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB8881:EE_
x-ms-office365-filtering-correlation-id: 4d110aa8-272c-439f-aa81-08dbd3828523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EicLTrQMJ6w2f86YNyIlAGdQNv2NvnIysA634psL5DRJIhyBTcHaEDLDlUCAzRCAdVN2TXvOqNtceOcqiODGyKTH+eRjSDiuECducy3dxQ8fXyJX7h9UuJFiMlccmFIBYmOGYNaie12y/z6WccHInM14tl3DxmjmbJ/yucHeWNJkMdjPo42nJzpLMnXgTWz+l5ce7Oi5o3ZxfSxN4BydtNhRjBwH86EOGkinAi4PF5c7BYSpZ0xiUCQULNxKP2D39l3j6Ssy6Ebo/gMQKlMQ2giNsat/xmeqqll2skGn5AkYGBSKNMcSc7TNlzQu/xpHEktPKZwDKCyjXtDsi62Mc/mJ+F46vfszYOir3G33g/xdR3RgXUUiXjGE9Ya9dLGL2daxjTPWiwlQarJFPeLMEjbueqYgf/SZuXVlAu65eCWd53fxUC5w1RcoPgs5e99wrFiYH7Pby1j0Nz1ilktU1Y76f0hGEN37J5zWVyWqWX1GRcgQmXW65sMUI/PXW3uXHRs7Yvq7MQZQfWnQl7gokZgJCOZPMZallUFW8VRAK6htTixPzwgMZfDs0C0QjKVKwacX+pAZuqcpuCyzkUDTeQaS6Tp9gkOHz2HFwCMoTSfTSZ/Ws/8V2bMzZYzIsnw3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700009)(478600001)(55016003)(2906002)(53546011)(55236004)(7696005)(66476007)(9686003)(66446008)(26005)(54906003)(71200400001)(6506007)(107886003)(86362001)(66946007)(33656002)(64756008)(316002)(122000001)(83380400001)(4326008)(76116006)(41300700001)(66556008)(38100700002)(8676002)(5660300002)(8936002)(66899024)(52536014)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZU9xQW1KTTJyVFhSTlpKa3Z6bVg0Z0Nybld2SWNDd21CalhBd0hERTJTWjZt?=
 =?utf-8?B?QklNakZOaldGcjZleXFPK3NuZGJQc2t4c0lJeXNCSEJ5SkpTV1llOGRZamcr?=
 =?utf-8?B?anF4aFBhV0NHenhjT3RBenRNeDU4OWNXL2hTQ1hlNGpGMjhXL3RyMmdRUUt4?=
 =?utf-8?B?d1Q1a3JTNC9JNHp3R25GK2RzSHMybXVMTFoyZVl0TWlxZFBkKzJOUXJwNWI3?=
 =?utf-8?B?ZkEwQXExa1JtbU1NQkQvOUVnalhZMUdKWk9hcDRNcUc0SENoaFZYeDQzemFh?=
 =?utf-8?B?eTljRzdPVTZxT3BTTmM3Nkd4MTcvenE5K2ZwejJvaGt3QzJXV3d1U09LRHNT?=
 =?utf-8?B?b1F0RzhXTis3RXJaK1o0TkVZM015YjdnUU1UeFdUbE9YNzZvTnpaNmVtUzUw?=
 =?utf-8?B?UjdFNzVOY25jbCtQVGNHYnZKM1ZLZTNacDJtVXMvSy9GdWdVRDFJMnh0Tkp3?=
 =?utf-8?B?Vk9va01wSFl2VFJFQ3VZbEdWWFlCcWs4V0ZRQXhaWlc3YXE2cTNEeUEvOTRr?=
 =?utf-8?B?amR0M2FYY0VlQ2F4cU80RGVQVkZEdGZocW5YNmdSOWJRcU1BWXZLLzFubmJm?=
 =?utf-8?B?eXMvaUJuVHcwS28wS2pUeEpXU3hiNVptOWZENXdWZ3hSOS9YcWI0ZEtEOEV2?=
 =?utf-8?B?ZkRRT0NYSkFhRVVUdDg4eDV6UHFvT1gzdmNjUmJKdVlCeit6Ym0yVjZuekZx?=
 =?utf-8?B?ckhnNCszNitzTVhYUmFibFlQY1o0RzEwSWtJZFZNN3M3YW1oZnpNTUMzZVFB?=
 =?utf-8?B?b1pYdTdQN2JpRFppZWNrMGFrdXNVNnZwelN3citkUFZNaVJ1aE0xMFIvdUph?=
 =?utf-8?B?cGlQaXN1cWhhdjNUYzcyL09VaFNtNnVlUkFQV25HbVBrWitHMmlYQU9uZmp0?=
 =?utf-8?B?YXFTaTdQR05uT002VFRIQzZOeWxrYnBtOHpFbkZwSzFzNWQyZkRzSkVQTWxD?=
 =?utf-8?B?OVJYWkFvbU9WNzM2WEVlc0VXQStoOGJKZlduckd2SG5pTUZubzUxeUNqSEVF?=
 =?utf-8?B?QjVnbmpPRk90MEE0RFVicnVqU2ZjNDdvWm9lTGpnNGJFV3lTdlBLNG1KWkNM?=
 =?utf-8?B?ZHE3WkxJYTVCYmhDSXJGT0tFbDFpb1VYRjZBVStmM3lpY0FoSUY1NVFJanl3?=
 =?utf-8?B?ZFMrekxabld5SHlOQ2tvR00yVXVrZitCdURYRzBOTVpRZ3hWZEhZQ3hMMVJp?=
 =?utf-8?B?NDkvYTYyUHBRbTRzTG4wRDc2cXdpdnROaDZPR3VyQzE4RmlwVVE3aHRTeXFr?=
 =?utf-8?B?bjVUQUR0OXEwUUszQnJScTNhMDhsbjJRbDRJRis3NFg0SW5lZnE1UWZrME1B?=
 =?utf-8?B?VjNSV1QveFF2ZHVOWWFTSThGeThndHBORDJFR05nYm1idzVCVllmaTVjdWw5?=
 =?utf-8?B?anBNWUFPWXRvRy9wNXRLbHdpR3dEQVZLVUt6SXlXajZZU1E2bldmcDN1eWJE?=
 =?utf-8?B?L1lvdm9EZ01RZ1lLdExpOXp3Si9lc2FENThOUjR6OUdVdUUzd2JwREhjNmRZ?=
 =?utf-8?B?d0c4L0RSYVBoWVFzWkxJUmFKWm5vWGIwSEpockVuMUNndUM2bW4yQnVneXh5?=
 =?utf-8?B?bE8xRGVZbzJnVGhPL2pZNGRBa24vWjFackExVjJsWTVRMitDblJDcW5sYnZx?=
 =?utf-8?B?c0pTb3A3V2lMQkhETmFsd0R4K3JGTnNoeTdCcWtTM2RLMVZqRno1MEFaeVoy?=
 =?utf-8?B?MjNUMEdHdTg1NCtleHA0V0dhZFUrSlBJeENvWjYraFhlc0Z0QzZZZ3RPcmpR?=
 =?utf-8?B?OFRmcUU2YmV0clp6akJab1E5Qm1VeW0wU0dMU0lSeUlLVFkzQWw2TzRtM1Na?=
 =?utf-8?B?N2xUaVNjUTBsS0ovVThvODh5NDNVNGJOTjlaTzdycVVxT1VwM0J1UFU0UEV4?=
 =?utf-8?B?dUxnUWw0ZnMxdWlwK1dwNENkSVFtalZ4aTVLYkJCQ3ZKT0lXNjh5VXVHU0ow?=
 =?utf-8?B?RFQwb0h0SFEra0xGOUJoUStmcXh5eHRva21Ba1ZZZCtPR2oxclJSN2VyMTl6?=
 =?utf-8?B?dE43b1g4eVhkYmJGd0hPQ1RiUXkydURNcStNa29oa1RsYncySEF6bXVYMjdC?=
 =?utf-8?B?M1FnUnVycXVXL2ROdmsyQVZVRWl2VW1BRy9TdzMzbEo0amF6TDlQMGtjWVoy?=
 =?utf-8?Q?XDFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d110aa8-272c-439f-aa81-08dbd3828523
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 04:42:53.5505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXE+DrvNfKuuXNijj+pRZZQ3t/JyTXsHQ/nuJSh4yr3hmI49P3QBlHcL1XkxDQrUYgWbGsqm/wVK9U2+1a7Gtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDk6MTUgQU0NCj4gDQo+IE9uIFdlZCwgT2N0IDE4LCAyMDIz
IGF0IDY6MjPigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiA+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+
ID4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTgsIDIwMjMgMzoyNiBQTQ0KPiA+DQo+ID4g
PiBGb3IgY29tcGxldGVuZXNzLCBhbmQgdG8gc2hvcnRlbiB0aGUgdGhyZWFkLCBjYW4geW91IHBs
ZWFzZSBsaXN0DQo+ID4gPiBrbm93biBpc3N1ZXMvdXNlIGNhc2VzIHRoYXQgYXJlIGFkZHJlc3Nl
ZCBieSB0aGUgc3RhdHVzIGJpdA0KPiA+ID4gaW50ZXJmYWNlIGFuZCBob3cgeW91IHBsYW4gZm9y
IHRoZW0gdG8gYmUgYWRkcmVzc2VkPw0KPiA+DQo+ID4gSSB3aWxsIGF2b2lkIGxpc3Rpbmcga25v
d24gaXNzdWVzIGZvciBhIG1vbWVudCBmb3Igc3RhdHVzIGJpdCBpbiB0aGlzIGVtYWlsLg0KPiA+
DQo+ID4gU3RhdHVzIGJpdCBpbnRlcmZhY2UgaGVscHMgaW4gZm9sbG93aW5nIGdvb2Qgd2F5cy4N
Cj4gPiAxLiBzdXNwZW5kL3Jlc3VtZSB0aGUgZGV2aWNlIGZ1bGx5IGJ5IHRoZSBndWVzdCBieSBu
ZWdvdGlhdGluZyB0aGUgbmV3DQo+IGZlYXR1cmUuDQo+ID4gVGhpcyBjYW4gYmUgdXNlZnVsIGlu
IHRoZSBndWVzdC1jb250cm9sbGVkIFBNIGZsb3dzIG9mIHN1c3BlbmQvcmVzdW1lLg0KPiA+IEkg
c3RpbGwgdGhpbmsgZm9yIHRoaXMsIG9ubHkgZmVhdHVyZSBiaXQgaXMgbmVjZXNzYXJ5LCBhbmQg
ZGV2aWNlX3N0YXR1cw0KPiBtb2RpZmljYXRpb24gaXMgbm90IG5lZWRlZC4NCj4gDQo+IFdoaWNo
IGZlYXR1cmUgYml0IGRpZCB5b3UgbWVhbiBoZXJlPw0KPiANCkEgbmV3IGZlYXR1cmUgYml0IHRv
IGluZGljYXRlIHRoZSBndWVzdCB0aGF0IGRldmljZSBzdXBwb3J0cyBzdXNwZW5kIGFuZCByZXN1
bWUsIGhlbmNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlc2V0IHRoZSBkZXZpY2UgYW5kIGRlc3Ry
b3kgcmVzb3VyY2VzIGxpa2UgaG93IGl0IGlzIGRvbmUgdG9kYXkuDQoNCj4gPiBEMC0+RDMgYW5k
IEQzLT5EMCB0cmFuc2l0aW9uIG9mIHRoZSBwY2kgY2FuIHN1c3BlbmQgYW5kIHJlc3VtZSB0aGUg
ZGV2aWNlDQo+IHdoaWNoIGNhbiBwcmVzZXJ2ZSB0aGUgbGFzdCBkZXZpY2Vfc3RhdHVzIHZhbHVl
IGJlZm9yZSBlbnRlcmluZyBEMy4NCj4gDQo+IEl0J3Mgbm90IG9ubHkgYWJvdXQgdGhlIGRldmlj
ZSBzdGF0dXMuIEkgd291bGQgbm90IHJlcGVhdCB0aGUgcXVlc3Rpb24gSSd2ZSBhc2tlZA0KPiBp
biBhbm90aGVyIHRocmVhZC4NCj4gDQo+IFdoYXQncyBtb3JlLCBpZiB5b3UgcmVhbGx5IHdhbnQg
dG8gc3VzcGVuZC9mcmVlemUgYXQgUENJIGxldmVsIGFuZCBkZWFsIHdpdGggUENJDQo+IHNwZWNp
ZmljIGlzc3VlcyBsaWtlIFAyUC4gIFlvdSBzaG91bGQgcmVhbGx5IHRyeSB0byBsZXZlcmFnZSBv
ciBpbnZlbnQgYSBQQ0kNCj4gbWVjaGFuaXNtIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGNhcnJ5IHN1
Y2ggc2VtYW50aWNzIHZpYSBhIHZpcnRpbyBzcGVjaWZpYyBzdHVmZg0KPiBsaWtlIGFkbWlucS4g
U29sdmluZyB0cmFuc3BvcnQgc3BlY2lmaWMgcHJvYmxlbXMgYXQgdGhlIHZpcnRpbyBsZXZlbCBp
cyBhIGxheWVyDQo+IHZpb2xhdGlvbi4NCj4NClBDSSBzcGVjIGhhcyBhbHJlYWR5IGRlZmluZWQg
d2hhdCBpdCBuZWVkcyB0by4gU1ItUENJTSBpbnRlcmZhY2UgaXMgYWxyZWFkeSBjb25jbHVkZWQg
YmVpbmcgb3V0c2lkZSBvZiBQQ0ktc3BlYyBieSB0aGUgcGNpLXNpZy4NCkFuZCBubywgdGhlcmUg
aXMgbm8gbGF5ZXIgdmlvbGF0aW9uLg0KDQpBbnkgbm9uIFBDSSBtZW1iZXIgZGV2aWNlIGNhbiBh
bHdheXMgaW1wbGVtZW50IG5lY2Vzc2FyeSBTVE9QIG1vZGUgYXMgbm8tb3AuDQoNCkFuZCBhbGwg
b2YgdGhvc2UgdGFsayBtYWtlIHNlbnNlIHdoZW4gb25lIGNyZWF0ZXMgTU1JTyBiYXNlZCBtZW1i
ZXIgZGV2aWNlLCB1bnRpbCB0aGF0IHBvaW50IGlzIGp1c3Qgb2JqZWN0aW9ucy4uLg0KIA0KPiA+
IChMaWtlIHByZXNlcnZpbmcgYWxsIHJlc3Qgb2YgdGhlIGZpZWxkcyBvZiBjb21tb24gYW5kIG90
aGVyIGRldmljZSBjb25maWcpLg0KPiA+IFRoaXMgaXMgb3J0aG9nb25hbCBhbmQgbmVlZGVkIHJl
Z2FyZGxlc3Mgb2YgZGV2aWNlIG1pZ3JhdGlvbi4NCj4gPg0KPiA+IDIuIElmIG9uZSBkb2VzIG5v
dCB3YW50IHRvIHBhc3N0aHJvdWdoIGEgbWVtYmVyIGRldmljZSwgYnV0IGJ1aWxkIGENCj4gPiBt
ZWRpYXRpb24tYmFzZWQgZGV2aWNlIG9uIHRvcCBvZiBleGlzdGluZyB2aXJ0aW8gZGV2aWNlLCBJ
dCBjYW4gYmUgdXNlZnVsIHdpdGgNCj4gbWVkaWF0aW5nIHNvZnR3YXJlLg0KPiA+IEhlcmUgdGhl
IG1lZGlhdGluZyBzb2Z0d2FyZSBoYXMgYW1wbGUgZHVwbGljYXRlZCBrbm93bGVkZ2Ugb2Ygd2hh
dCB0aGUNCj4gbWVtYmVyIGRldmljZSBhbHJlYWR5IGhhcy4NCj4gDQo+IEl0IGlzIHRoZSB3YXkg
dGhlIGh5cGVydmlzb3JzIGFyZSBkb2luZyBmb3Igbm90IG9ubHkgdmlydGlvIGJ1dCBhbHNvIGZv
ciBDUFUgYW5kDQo+IE1NVSBhcyB3ZWxsLg0KPiANCk5vdCByZWFsbHksIHZjcHVzIGFuZCBWTUNT
IGFuZCBtb3JlIGFyZSBwYXJ0IG9mIHRoZSBoYXJkd2FyZSBzdXBwb3J0Lg0KMiBsZXZlbCBuZXN0
ZWQgcGFnZSB0YWJsZXMgaXMgaHcgc3VwcG9ydC4NCkFueXRoaW5nIGJleW9uZCAyIGxldmVsIG5l
c3RpbmcsIGxpa2VseSBpbnZvbHZlcyBoeXBlcnZpc29yLg0KDQo+ID4gVGhpcyBjYW4gZnVsZmls
IHRoZSBuZXN0ZWQgcmVxdWlyZW1lbnQgZGlmZmVyZW50bHkgcHJvdmlkZWQgYSBwbGF0Zm9ybSBz
dXBwb3J0DQo+IGl0Lg0KPiA+IChQQVNJRCBsaW1pdGF0aW9uIHdpbGwgYmUgcHJhY3RpY2FsIGJs
b2NrZXIgaGVyZSkuDQo+IA0KPiBJIGRvbid0IHRoaW5rIFBBU0lEIGlzIGEgYmxvY2tlci4gSXQg
aXMgb25seSBhIGJsb2NrZXIgaWYgeW91IHdhbnQgdG8gZG8gcGFzc3Rocm91Z2guDQo+IA0KRXZl
biB3aXRob3V0IHBhc3N0aHJvdWdoLCBvbmUgbmVlZHMgdG8gc3RlZXIgdGhlIGh5cGVydmlzb3Ig
RE1BIHRvIG5vbiBndWVzdCBtZW1vcnkuDQpBbmQgZ3Vlc3QgZHJpdmVyIG11c3Qgbm90IGJlIGFi
bGUgdG8gYXR0YWNrIChyZWFkL3dyaXRlKSBmcm9tIHRoYXQgbWVtb3J5Lg0KSSBkb27igJl0IHNl
ZSBob3cgb25lIGNhbiBkbyB0aGlzIHdpdGhvdXQgUEFTSUQuIEFzIGFsbCBETUFzIGFyZSB0YWdn
ZWQgdXNpbmcgb25seSBSSUQuDQoNCj4gPg0KPiA+IEhvdyB0byBJIHBsYW4gdG8gYWRkcmVzcyBh
Ym92ZSB0d28/DQo+ID4gYS4gIzEgdG8gYmUgYWRkcmVzc2VkIGJ5IGhhdmluZyB0aGUgX0ZfUE0g
Yml0LCB3aGVuIHRoZSBiaXQgaXMgbmVnb3RpYXRlZCBQQ0kNCj4gUE0gZHJpdmVzIHRoZSBzdGF0
ZS4NCj4gDQo+IFdlIGNhbid0IGR1cGxpY2F0ZSBldmVyeSB0cmFuc3BvcnQgc3BlY2lmaWMgZmVh
dHVyZSBpbiB2aXJ0aW8uIFRoaXMgaXMgYSBsYXllcg0KPiB2aW9sYXRpb24gYWdhaW4uIFdlIHNo
b3VsZCByZXVzZSB0aGUgUENJIGZhY2lsaXR5IGhlcmUuDQo+IA0KSXQgaXMgcmV1c2VkIGJ5IGhh
dmluZyB0aGUgZmVhdHVyZSBiaXQgdG8gaW5kaWNhdGUgdGhhdCBkZXZpY2Ugc3VwcG9ydHMgc3Vz
cGVuZC9yZXN1bWUuDQpJZiBmcm9tIERheV8xLCBpZiB0aGUgUENJIFBNIGJpdHMgdXNlZCwgaXQg
d291bGQgbm90IHJlcXVpcmUgdGhlIGZlYXR1cmUgYml0Lg0KQnV0IHRoYXQgd2FzIG5vdCB0aGUg
Y2FzZS4NClNvIHRoZSBndWVzdCBkcml2ZXIgZG8gbm90IGtub3cgaWYgdXNpbmcgdGhlIFBDSSBQ
TSBiaXQgaXMgZW5vdWdoIHRvIGRlY2lkZSwgaWYgc3VzcGVuZC9yZXN1bWUgYnkgZ3Vlc3Qgd2ls
bCB3b3JrIG9yIG5vdC4NCkhlbmNlIHRoZSBmZWF0dXJlIGJpdC4NCg0KPiA+IFRoaXMgd2lsbCB3
b3JrIG9ydGhvZ29uYWwgdG8gVk1NIHNpZGUgbWlncmF0aW9uIGFuZCB3aWxsIGNvLWV4aXN0IHdp
dGggVk1NDQo+IGJhc2VkIGRldmljZSBtaWdyYXRpb24uDQo+ID4NCj4gPiBiLiBuZXN0ZWQgdXNl
IGNhc2U6DQo+ID4gTDAgVk1NIG1hcHMgYSBWRiB0byBMMSBndWVzdCBhcyBQRiB3aXRoIGVtdWxh
dGVkIFNSLUlPViBjYXBhYmlsaXR5Lg0KPiA+IEwxIGd1ZXN0IHRvIGVuYWJsZSBTUi1JT1YgYW5k
IG1hcHBpbmcgdGhlIFZGIHRvIEwyIGd1ZXN0Lg0KPiANCj4gTGV0IG1lIGFzayBpdCBhZ2FpbiBo
ZXJlLCBob3cgY2FuIHlvdSBtaWdyYXRlIEwyIHVzaW5nIEwxICJlbXVsYXRlZCINCj4gUEY/IEVt
dWxhdGlvbj8NCj4NCkVtdWxhdGlvbiBpcyBvbmUgd2F5IGFzIG1vc3QgbmVzdGVkIHBsYXRmb3Jt
IGNvbXBvbmVudHMgZG8uDQpNYXkgYmUgTDEgVkYgd2hpY2ggaXMgPSBWRiArIFNSLUlPViBjYXBh
YmlsaXR5IGlzID0gZW11bGF0ZWQgUEYuIFRoaXMgUEYgY2FuIHJ1biBleGFjdCBzYW1lIGNvbW1h
bmRzIGFzIEwwIGxldmVsIFBGLg0K

