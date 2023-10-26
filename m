Return-Path: <virtio-comment-return-7967-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D20C25B67
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:51:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EA41C2B142
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:51:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C00F7986A49
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:51:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9EC3A986A3E; Thu, 26 Oct 2023 03:51:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E329986A3F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 03:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7tBpUSgcaSlkOMvIoc484RtBvEWpkDfkJtJMml7Rb1W7SJxTQG3Z0+lH2Vrq5Z3O9Ir2yMnTLMOeYJYXUnfGmdqNBTE7OTba5TpPoe82vNw1pZes2UrzSxWT3bbNPbexKHGUg+SKlUF1WylwJkl/XicGVr9yofWOe7pS8ePxFaISK5U+H1Lkaf12UGP5jDu0uOYpJ6gMXoRhVG4tRnXYspyB32Qhg7ZRjgyfrf/n5HznoHZJwJlNBXzoYSihZPR7JM/WR9rwYqigIkGu1GNF9wYLpnBSL+JfDkGzSjwjB4jBwUFP2MR7fFkq8TRbjKf1sNxIHoraUaqSUr6OwTWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT7sfzPYiwKMtqHn+CY7rtPdwe71lMOs0hP5iTlRsfw=;
 b=AoGDUXt1JkzNC7KL5W1wyefoB1vHREcnbO/1wQEtlEodYSIQqOmihLbTHlQwzmUotXnk0U/o67uhaowrlHekUviLycSCHU2A+pGgma1u/8hatuPAHUfR/vy7pR2Xkbh42b0aEkOMoG2I0loQXgIuFDWdN8dw/0coszFH4uk0KfYcRUs8tBP8ZonkAypsuTUm7Y79D40A7Mde2fmMpwNU7vXeCIx2l1lYVWHiy2XKmgND9uug8FNB+BIvE1GhbJH54unaL0JWSGQb47NvdcIvWbhvnFyaVgvTjK4+F4fqwl7AcVkWlXnSxMnHWKdHkERtZ0l9JChJTM3g3EJ1HP4ePQ==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQ
Date: Thu, 26 Oct 2023 03:50:58 +0000
Message-ID:
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
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
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
In-Reply-To:
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6112:EE_
x-ms-office365-filtering-correlation-id: 152b822c-cae3-4bd2-585b-08dbd5d6c3a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lzaoLM/DkzRU8oSaLzmU1i6f+mP5KrgcJ+qfJImidednIPNXvizEe12GFOEgT9wduWogfURK6iL1KJm0MpChEFgol/qWhrYry3Y23CTeHRhauZad+retPv0kvaUzIu3/9RwK1kbVECTwiGFoWOwJkSMlJ6w1a/kLvRsoPcEeLybBs84Ikl4tH13GALqqz0wLDn175Sl11RXDBDe/TLhDWP7mJxhhz28sWZlKoDs8exG19gUgns1H5X4D02F51e/Z+sSlQ4cBfEpSGp+HT5Ptcobgy70GXtzODKlfARXK8+3qV9lY5YFTlSbIClTbwSw2vP5Sh0lP33glP1eirwJDCFbWgZ+7RoYLtCtxZd8zOMNg3rbbPm/kWK/Ojo3LUcW3yOEaV2+TdihKUi6ZjCRRyzdBrOeXnNK/RUNETRLFJgXHMEhy4Rtb71Xxx1I0rqpNbl8vZrqI9gEVWOnnLyaZZ8rmSV1uQ2XJ8dBCwCdhYwMntO3+oC7vop+6meUf82jKVnqQWy47W0vTuUXGvZZ7b63WwjpN8h/IK9tR+ZFLxBayew6+2Mk+KS1Rzh8CK7pDd0XVtdobf6S43WLnY3ce6trZvvZdLGGeCPyNnidDOaZRFA1gMDj6QCGlrNXwR796o1s7U35D/TNsUy83Pcb9Kw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(33656002)(86362001)(5660300002)(55016003)(38070700009)(26005)(2906002)(478600001)(45080400002)(9686003)(966005)(6506007)(66476007)(38100700002)(122000001)(7696005)(76116006)(41300700001)(107886003)(66446008)(8936002)(316002)(71200400001)(6916009)(4744005)(66556008)(64756008)(8676002)(4326008)(66946007)(52536014)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2crMHJsS2VYZkVuakYxTmNuS3dEeXJ4K1VMV1J3bE4ycEltR00rVEVIWDZJ?=
 =?utf-8?B?YS8wZzVMUXFxTGJUSUNTVHduYUdUUEU3VnpadWkwbEVNQ1FMR0J3azZVbDdw?=
 =?utf-8?B?NXp4TFZiczM4aWZwVlZESXVqWFJGQmZPRmUwems0YU1IRDdUeExlYkptdFRO?=
 =?utf-8?B?alNRb3lCUWRkTU45UjdxeW5HaGRQK09HVFRjUzR3TUh6KzhleVpTUnFaUzgw?=
 =?utf-8?B?NVlPWGFVdUhWZVNiKzYwVUpucUlpZStEcXFQdzBYcWJQVEJZTnp6Wk5ZenVt?=
 =?utf-8?B?Q0FPMHZhV2RTWHdIZ1BhdzhpdmtTcWdwOVRLVVNycllBME11anBvd3pGSEty?=
 =?utf-8?B?blc3aXlqYnlaSSs4Q2xWYkJuMjB2RE1pTWp3elJ3V3JEM2VackgvM2NQL0pL?=
 =?utf-8?B?U3ZnN0U4cDN1UFJRU2o4SlJQZlNLQzEwN09JeEplampHMlN4SnBSa2xTRnFZ?=
 =?utf-8?B?cE11YmpGWStnVzJjUjdHWVBuVnUra2RhYk1qbHlpR0JaQ1dLczN3dlNxTk9p?=
 =?utf-8?B?bkZ6c2VhU0tVVXNGaFBXa0JWOHQ4S1VsZlhPNUVJeFRMNkRkRGw2QlpVY3ZL?=
 =?utf-8?B?R1dsQ0dRVEdpQVBJSkRCT3k2RHFSaVNiU1FIUDBZOUp0UUd1b0E1eVF3Smp5?=
 =?utf-8?B?YXlMUithZDNIUmowS3VHaWJFTTZzeGZXMjc0Z0EyczlrVEFkaTBObGdSWmRH?=
 =?utf-8?B?Mmd5eEROZFBwQmF1Z3NOV0JLT2Q3L1QrcnZMTVhZeWNMTEJxSkxDSUJBYzA4?=
 =?utf-8?B?ay9iWlh1UXk2emtSQzhsVVdPK0piZkFwYWVLWGh6Y3RaMldtUHZuanl5eUdG?=
 =?utf-8?B?cXRBaGp1LzVSbExTQ1RSaTBKL2VtaW91R2xJSnRFRVNka2VvUTFpZnVaNWIx?=
 =?utf-8?B?YUdIbHdzNlYxQVEyYmJ3QVN5Unp6UlE0ZDUrTTVVdXNYMkhMRnVpRnFERFE1?=
 =?utf-8?B?dksvM1ZDS3ZBbzhVNnBFM3N5ZEsyZ254WFJBaWRVbEFMYU1HS3IxOVhMV081?=
 =?utf-8?B?aVJBZVNmVURwRkNPMlZmcWxHRzFHK3dpSUtVWjA3My9VZlhCVWltVWZKdEN2?=
 =?utf-8?B?UTZzOHB4TzJJeTJVNE1YbzNXK1JROThjQmdSWDk0NmIrYzV4d0NDdVZURUlu?=
 =?utf-8?B?R01Cc0N2SkkzRHh0S09TbnFwaW1tNXhBUHMxVkp5NmluU01IaVdFcGFVU3Zn?=
 =?utf-8?B?a2I0TVh3NXZMQ1dhNmdrWDR6bFpWYmRHYmp6ZE16VDZ6Z3RRb3F6cnBjWmw1?=
 =?utf-8?B?TXJKeUZWL1VBbVIvS1ZkelZEdlo5UDFJdTlzSjRMdi9FczlNVk9jUkJFNWR5?=
 =?utf-8?B?V2dxSjdvRS90SGE1dE54VWV0dzZzQkEyS2pXd3N0TnM1T1p2ZVIrSGJRSy9o?=
 =?utf-8?B?YThVYnJqRG95Q0owbTBoYkVnRUVUZWFMSzZXeG9IVEx0M1pZc3h3aW9ISGVC?=
 =?utf-8?B?clNzMmF6N1QyMmZFeVJvcUp5NjluamFpNTJ2Umh3QzFFQmp5WHpGN1ZMQ2lY?=
 =?utf-8?B?eTBwZEVYYVZicDVoRlJ4R1NKVjJxM0gveXNiLyt6MTQ3SDdvWkJ4RTVSUXlC?=
 =?utf-8?B?RGk2cUVlajZOcGJrWEx1MUV4emQvZGVqQ2k4L0JPenZOVTBNUENwdkZCYURn?=
 =?utf-8?B?dlFYUnhPVlhLeDFBR3VXV2ZRTG1qVWtReEhIY3FIMmMxWk0vSkNlOXJYaGc3?=
 =?utf-8?B?SXRBUEd6MVRGdnhtdE9KQXBUbWRrcmoyNWs1SzBTMDlicUdNL280Mm52aUtG?=
 =?utf-8?B?UnZVSXJhRHU0NW00TXpBV0Jpem9ObFlHT1M4MHF5TGs5N0FESTlLejBCb0Mx?=
 =?utf-8?B?VVVrUG1OQkMzL0FlQTJETDhsRmVqaVZBYVZNSjBxNjdNSGxmaS9rcG1zdERn?=
 =?utf-8?B?Mzdpd2VSUW4xUWttNzRJa3dYQnhnWktCdDNQZVNCWVhYbFlYTHJmamRMTkVX?=
 =?utf-8?B?d09GdHZ4dUIzNGZkMUdWTzBlZ3ViYU91Ui85Y1IzdkU3ZnlYRWpodEkvOENz?=
 =?utf-8?B?ZmI0dmxrYmpOTXMwTFBjM3k2cnR0R3hDS0dLNndtMWZ4U2E2Zi9vaW9rVC9m?=
 =?utf-8?B?RHFGOU1SSlU0U3RBV0pUdEJxN0ttcGUwWitMN3A3R21RRENobDFhbTlkUUtz?=
 =?utf-8?Q?sDC8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152b822c-cae3-4bd2-585b-08dbd5d6c3a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 03:50:58.5091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hw+6TILSiVg4qBwL38xyj0c4654hJADm35i3K4XwRoudgAQXUaivIRyb7RLn/NSFiNEY26jHUoSkvuLd2ILhHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6112
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBKYXNvbiBXYW5nDQoN
Cj4gRm9yIGV4YW1wbGUsIHlvdSBzdGlsbCBoYXZlbid0IHN1Y2NlZWRlZCBpbiBkZWZpbmluZyBw
YXNzdGhyb3VnaC4gDQpJdCB3YXMgZGVmaW5lZCBvbiAxOXRoIE9jdCBpbiBbMV0uDQpXaGF0IHBh
cnQgaXMgbm90IGNsZWFyIHRvIHlvdSBpbiBkZWZpbml0aW9uIG9mIHBhc3N0aHJvdWdoIGRldmlj
ZT8NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby1jb21tZW50L1BIMFBSMTJN
QjU0ODFFQTZBNEQwQzY0QzVBRjZEM0E1N0RDRDRBQFBIMFBSMTJNQjU0ODEubmFtcHJkMTIucHJv
ZC5vdXRsb29rLmNvbS8NCg0K

