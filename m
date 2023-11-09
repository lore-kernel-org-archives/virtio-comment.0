Return-Path: <virtio-comment-return-8279-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8082EC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:24:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B821B2A829
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:24:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9AD41986CCA
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 06:24:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 823CA986CC0; Thu,  9 Nov 2023 06:24:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7160B986CC1
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 06:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgcZ5ZdgkGGyK7sp3+EDHOidregcM5fcem7Mp1iyHthfEROyued+ga3Q3jh2TNTldvyskEZIZmezfGkvjGOFK0fRbTcPLdtlK3OWbQxU8PE90zBu4x2y7PCsAdzVEtvOSEgVU6FTgUY/IOMapAQIbDZkVuN1BBF8f0EWx09FxfwTEbxZfMGzyHq1LRk9sPXYi/xPn6OcomTtYxUBT5NQ6ekX74KXMpLdBxLc6serxpAFcceMatcQWqxpI+6oEkJUeZE30XpLkmLMjlKTki5AL28esmkSfC3acttc9hpkLG0L1JwbOM0pnArmiboCMFxS2GvUvs4zPw0wxbu6aNQbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=No2Op5x+CrppPNbirCAW6JQWsv1l6j8oEVBgpxDbjoc=;
 b=J7d5SmgAqfcIoKzSr/q+ortc6mFAjjP2v1xCgrv6/uRvxCjqJbkXbBsJPZ11sFtCTqHYQIh5Lw5AzX7cLpObkc29Y5Els0rKQMY2x+FOlLrBZduveZxRWtj9NFc4pwB6iJiMzHq9uJcLrBeYleO3kcD6dAKoW4oJXH5HMNUwdbJa8cZRXVQ1e+GxenoX+BLeOukTkWQtHBz1kMMMTjaQoiRSTsDM0mqaQZD1Of5AdXwofxzhvL1j556+lzn0qCjK9DMXlMDStwRvKA+me9fBVp3JPo34kRjmWW0moWqxG1gy4PJSb/lFP1oNqc2MnIuDB57uy8pcsfXyM9TI8P8ldg==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQgAZNdoCAAAPWsIABZTAAgAA9LXCAAUN1gIAAKeEAgAGo8QCAABeXUIAGVlYAgAN9bzA=
Date: Thu, 9 Nov 2023 06:24:53 +0000
Message-ID:
 <DM8PR12MB5480CCBF619D7F6AA5EA45CFDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
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
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
 <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
 <PH0PR12MB5481F7BE5C7F4430D1F26B06DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com>
 <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuh+9h9nwGbv63onEh2MgGoCEkKmCwsLEvJ9O5NqtFs-Q@mail.gmail.com>
 <PH0PR12MB548181EA329E774DC359FD10DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsUBtEQO7_B0qoWHDZfxFA4zjM97=ox+gjHrOksPSFM3A@mail.gmail.com>
In-Reply-To:
 <CACGkMEsUBtEQO7_B0qoWHDZfxFA4zjM97=ox+gjHrOksPSFM3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|PH0PR12MB7864:EE_
x-ms-office365-filtering-correlation-id: 7d7dc1ec-fab5-45b9-e3d5-08dbe0ec95c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AwWr8aXNR9gqvpcuQJbexSRHCMUnQFCByemO8cUUIxCnVKaszvlqM42RndsBoe6EvcyBhuGSHvQa7+jz9JpB5YPM98WStbVZN9ExnTRCP0+O5AVxFdvE4D8xBpfr9h/NocdthI0IVTHX7/gZOkkLIRXOsexOdOkkp9ixppeLxvJrnhIjWbigtVOuAaFnrZPC6yYZs2nVbFjWcWosKbcevwjeCf/Wi1+g1hiA3d59xNIoX01hEfGKKt77mJTDTcp+W4m1bwnTDp3NGDMAykroYJ9Y6TWL2uxExD7yxjeMuSYGxiRAUcRdKfFZsG3pUrkVSr8qmBsHmpequ4RJQQSysurs5afCuv+7iETDIUx3SnKBn512VAIrsLQBGqCvLo1Z+YLK3d6e8jOY9WdweShKbsILGRWU3GdwixD/ROwuHoEIw2aS949OaX9FfSqi39HYHesGn2R21r1skuBZztEFfU9eo8Bbu58mbT26IQ+o8LE/B3tI3PNO8LFJR0CC8Y2V5wW9ZztrdKVHtlQfYJTSZlAzXic/PHVdKbfF/siupqYykjaMniXDzKDoRMVEzvHhsOr1AvXx4UczA3dv4HEspkVB9QKanK233vcKtQNR2JsE1fvevaclu49EXQVdmMOV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(9686003)(122000001)(4326008)(107886003)(26005)(38070700009)(478600001)(8936002)(5660300002)(33656002)(66946007)(52536014)(8676002)(41300700001)(316002)(2906002)(76116006)(66556008)(64756008)(66476007)(6916009)(54906003)(66446008)(55236004)(7696005)(6506007)(71200400001)(55016003)(38100700002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUpFNWJxaWhaTDZQRFVoTmpWVDRxWWtrdDhFOFJ2dUkzV0Ntc2tLNXN0Mnl4?=
 =?utf-8?B?YmlyRTdFOGp2cUdjcXRTNkhhQkhmU0t4OWRoOTJMK1VWVjJac05oeUNjV3g2?=
 =?utf-8?B?SXJkb3JkZDFtYUNpRy8zbUluNC9PeDRGZXBDWHQ4WmkwUWFnMzdBd0VCcXNJ?=
 =?utf-8?B?UUE1akhveEZyb01xWnNxUllhTVFIekp2Q1BVQ2grMDV2ODFwVVNkT2VsR2hx?=
 =?utf-8?B?QjRtb3lxRlY1RGdQNTlpNDUwSzJ1U2U0RFhhelVyNUswalovQzRtSzcrY082?=
 =?utf-8?B?UWNRbXBWWHVhcnNZbXJnNWZlVkZrbXkweUdzdnJ0bUpseFh4Y05paG5oTkk3?=
 =?utf-8?B?VFJ5aldBYytPbjVmUW41dWlFYVN1MnRNSEpLTzBKdld5Vm9tVWxOZm1sNTNr?=
 =?utf-8?B?czU0RUs1U2tuT3MxUU8vNlIzN05OK294ZXE3dUR3L3NSQVdFVFU3a24xdjhz?=
 =?utf-8?B?bXdxdGY5UlN3WlF0WiswUUNVSDdUTGl2bm4xR0g2SFlYS0owWURtWkdjbkkv?=
 =?utf-8?B?K2Z4cm5ZaWJvYU0yL0pPb056UXZxOFplZXRVYkJOLytnNWNKVDNpSkVWUGJU?=
 =?utf-8?B?YVBucEtNb0w5dXhsU3BSc3FPaitQVjErQUdYSHQwYkpVQzJ1bHFnV2NJNCtz?=
 =?utf-8?B?aWdXM29kWnVaY2ZLWGppdGpDZkxyUXllcG14UjZ0YlA4b0Q2UjRRUWUxTVJJ?=
 =?utf-8?B?YVZsSDd4NHhHa3grV3NxQ1RaRmUyb3djelNFYjNkQlJGVit5czd3WmgrNXRV?=
 =?utf-8?B?SEdycDU1M2ZYUnBJNmgzYitEZzRhUVA3d2pSY0dUS1Uxb1Y0akpWclRjUmhW?=
 =?utf-8?B?K2oxR1NsYnJ3K052aVQ4QlFOMlVpMkk3Zjl0UDhDZ3gwRnArZms3UTM0TlY1?=
 =?utf-8?B?RDZqYlhEWlB4R2cvZS9KaUNhc2JCQWh0eFo3TXQwOGdhRkN0WGpZTjNRRHhm?=
 =?utf-8?B?MTRXQXZrcGt0OHF1NGhmQTNNcDZtNWpkZU5mZCtpUXFCSFBsRjhIa0xDbmh4?=
 =?utf-8?B?WGJGNk5aMW9Kd2ZFNHJ3bGhhZmh3dXcrNlNyL3BDNnNveVQxNkFBclpSVDYr?=
 =?utf-8?B?UFN4b1BDeEw5bUllSllaVXNVNHBvbUlrZnJtdnBobEVoLytod1lHRXh3bDhD?=
 =?utf-8?B?QTRmOCtzbXVZMy91ekRKdm9DdzQ4SnI1MWFBclkvUTg1N0l3WjQ3ZjlWMGtl?=
 =?utf-8?B?YzllbGh4K0RKMVZUY0gwekVvZW5wU2FjNDhPOWsxQW15dGw1b2pLeWt5R1Bt?=
 =?utf-8?B?enRaYkZ0QTUrODFCa3NiY3NoOFYwWkJPQS9xc3NxaXV5OW1jN1RqNTBMaWdx?=
 =?utf-8?B?M1Z4eTY0UUl4TVRQb0c2OWhxMTlYd3lZUHlLWjRUN1FpMUxwa2tWQ2s5b0ZI?=
 =?utf-8?B?Vy9yMlRpamRsMGZDOUVDZEtaTFJiOTB6RnBtbDVWTHczeXUvOGFjM3VyOVVM?=
 =?utf-8?B?V09LZGNaRWZsK0RWYjhQblkxVDE2c0RVMkt3a05ncm1CRlJwbUF0QW5Pdzh1?=
 =?utf-8?B?N3paRGl5U0grV2NrczlIWUNqa0NjN3E2MkN2T3AyRDJEQVRydGZEYUhRTGpU?=
 =?utf-8?B?N1FWZTFTRXVYQmRlbFBmTzlob0dqelNtbHJYUm5naUZlZDNHcFJab3ZMaTI2?=
 =?utf-8?B?T0lyWE9abkliWjk2dFNUenZVZTlxcU0zck5TL0krN04yYTFEY1NQNjZlRDJZ?=
 =?utf-8?B?UDBsVGNaYmo2UmJmTWdUcEo2Y3VzOC9EL3lwcFh2ZXpmbzdvdGdPYWF4am1Q?=
 =?utf-8?B?TW8yNFJkTDJnWWNmc1pZMU9SNFUvV2RuUFN0aGNGVlROcVhJSWxRZ09leUVF?=
 =?utf-8?B?VndQdTRUZDlHc1NOVUg4SEdWZVdEd1M3T0o2b0RXM1hLa3VZWkxsa3ZJUWZ5?=
 =?utf-8?B?bWF6MFE4VmhCWWxOeUJZVVROcjdDSEpxaCs2bXZIS2tIaDg1UWY4ZkFzc3Bu?=
 =?utf-8?B?Zk1PaEEvYlpBS29IamhYenBZSEZCdE1RcnVDaG9OdDlTTmJmMk5WbDIzT3JJ?=
 =?utf-8?B?QkkzV29hNXlSaVcxUFpWT2tESGlIejlaOFdMcHlEeklVQkp6K3RnV1c3ZGM4?=
 =?utf-8?B?Y1JuZ2FUdy9jWjlobk9YRjFHQzc5ZVd5V3JianVxL0N1aHlBZkRVS1VqSWtu?=
 =?utf-8?Q?91Gk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7dc1ec-fab5-45b9-e3d5-08dbe0ec95c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 06:24:53.2159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KVIx/QWwD7A5soLOKS4Xmca6ElHv3oINe1o4f9u7GSNraK+VUhehF05uamSOknFoAyGT6MFOPHZSPHBFlvu0dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTm92ZW1iZXIgNiwgMjAyMyAxMjowNSBQTQ0KDQpbLi5dDQo+ID4gPiBJdCdzIG5vdCB0aGUg
Y2hhcmdlIG9mIHRoZSB2aXJ0aW8gc3BlYyB0byBtYW5kYXRlIGFueSB0eXBlIG9mIGh5cGVydmlz
b3INCj4gZGVzaWduLg0KPiA+ID4gQnV0IGl0IGxvb2tzIHRvIG1lIHlvdSB3YW50IHRvIGRvIHRo
YXQuDQo+ID4gWW91IGFsd2F5cyBhdHRyaWJ1dGUgaXMgd3JvbmcgdG8gZGlzcmVnYXJkIHRoZSBw
cm9wb3NhbCB3aGljaCBpcyBpbmNvcnJlY3QuDQo+IA0KPiBUaGlzIGlzIG5vdCBteSBwb2ludC4g
SSdtIGp1c3Qgc2F5aW5nLCBJIG5ldmVyIHNheSBhbnkgdmlydGlvIGV4aXN0aW5nIGZhY2lsaXRp
ZXMgbmVlZA0KPiB0byBiZSBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgZGV2ZWxvcG1lbnQgb2YgdGhl
IGh5cGVydmlzb3IuIFRoYXQncyBncmVhdCBwcm9vZg0KPiB0aGF0IGl0IGlzIHdlbGwgZGVzaWdu
ZWQuDQo+IA0KPiBJZiB0aGUgcHJvcG9zYWwgaXMgZGVzaWduZWQgaW4gYSBnZW5lcmFsIG1ldGhv
ZCB3aXRob3V0IGxpbWl0YXRpb25zLCB0aGUgc3BlYyBjYW4NCj4ga2VlcCB3b3JraW5nIGxpa2Ug
YSBjaGFybSBpbiB0aGUgcGFzdC4NCj4gDQoNClRoZSBmYWN0IGlzIHRoZXJlIGFyZSBhdCBsZXN0
IDMgaHlwZXJ2aXNvcnMgZXhpc3RzIHdoaWNoIGhhcyBkZWZpbmVkIHRoZSBsaXZlIG1pZ3JhdGlv
biBmcmFtZXdvcmsuDQpBbmQgdmlydGlvIGlzIGFkYXB0aW5nIHRvIGl0Lg0KDQpEZWZpbmluZyBz
b21ldGhpbmcgdmVyeSBnZW5lcmljIHdpdGhvdXQgYSBrbm93biBpbnRlcmZhY2UgaXMgbW9zdGx5
IHRoZW9yZXRpY2FsIGRpc2N1c3Npb24uDQoNCj4gPiBWaXJ0aW8gc3BlYyBkb2VzIG5vdCBtYW5k
YXRlIGl0Lg0KPiA+IFdoeT8NCj4gPiBCZWNhdXNlIHZpcnRpbyBpcyBzbyBsYXRlIGluIHRoZSBj
eWNsZSBvZiBkZXZlbG9waW5nIGZlYXR1cmVzLCB0aGF0IGl0IGhhcyB0byBmaXQNCj4gaW50byB0
aGUgZXhpc3RpbmcgaHlwZXJ2aXNvcnMgZGVzaWduIHRvIHN1cHBvcnQgdGhlIGZlYXR1cmUgYW5k
IHByb3ZlbiBVQVBJcy4NCj4gPg0KPiA+IFNvIGxpa2UgUlNTLCBmbG93IGZpbHRlcnMsIHN0YXRp
c3RpY3MsIHByb3Zpc2lvbmluZywgYW5kIG1vcmUsIGl0IGlzIGFkZGluZyB0aGUNCj4gc3VwcG9y
dCBmb3IgVUFQSXMgd2hpY2ggYXJlIGFscmVhZHkgcHJlc2VudCBmb3IgYSB3aGlsZSBhY3Jvc3Mg
bXVsdGlwbGUgZGV2aWNlcy4NCj4gPg0KPiA+IFNvIGF0dHJpYnV0aW5nIGl0IGFzIG1hbmRhdGlu
ZyBpcyBzaW1wbHkgd3JvbmcuDQo+ID4gSXQgaXMgYWRkcmVzc2luZyB0aGUgZXhpc3RpbmcgdXNl
IGNhc2UuDQo+ID4NCj4gPiBPbmUgY2FuIGFsd2F5cyBidWlsZCBuZXcgaHlwZXJ2aXNvciBhbmQg
ZGVtYW5kIG5ldyBmZWF0dXJlcyBmcm9tIHZpcnRpby4NCj4gPiBUaGF0IGlzIHBlcmZlY3RseSBm
aW5lLg0KPiA+DQo+ID4gWW91ciBleHBlY3RhdGlvbiBpcyB0aGF0IGRldmljZSBtaWdyYXRpb24g
ZnJhbWV3b3JrIHRvIHdvcmsgZm9yIGFuIHVuZGVmaW5lZA0KPiBoeXBlcnZpc29yLCB3aGljaCBp
cyBqdXN0IHNpbGx5Lg0KPiANCj4gSXQncyBub3Qgc2lsbHksIGZvciBleGFtcGxlIHZpcnRpbyB3
YXMgZGVzaWduZWQgYmVmb3JlIFZGSU8gd2FzIGludmVudGVkLiBJZiB0aGVyZSdzDQo+IG5vIGxh
eWVyIHZpb2xhdGlvbiBhbmQgdGhlIHNwZWMgYWxpZ25zIHdpdGggUENJIHNwZWMsIHdlIGRvbid0
IG5lZWQgdG8gZG8gYW55DQo+IHN5bmNocm9uaXphdGlvbiB0byBzYXkgIndlIGNhbiBzdXBwb3J0
IFZGSU8gbm93Ii4gIEFuZCB3ZSBuZXZlciBoYXZlIGENCj4gZmVhdHVyZSB0aGF0IGNsYWltcyB0
byB3b3JrIHVuZGVyIGNvbmRpdGlvbiBYLFksWiBpbiB0aGUgcGFzdC4NCj4gDQpXaXRoIHRoYXQg
dGhlb3J5LCBkZXZpY2UgbWlncmF0aW9uIHNob3VsZCBoYXZlIHdvcmtlZCB3aXRob3V0IGFueSBw
YXRjaGVzIHRoYXQgd2UgYXJlIGRvaW5nIG5vdy4gOikNCg0KPiA+DQo+ID4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gPiA+IDIpIGlmIHRoZSBoeXBlcnZpc29yIGlzIG5vdCBkZXZlbG9wZWQg
d2l0aCB0aG9zZQ0KPiA+ID4gPiA+ID4gPiA+ID4gYXNzdW1wdGlvbnMsIHRoaW5ncyBjYW4gd29y
aw0KPiA+ID4gPiA+ID4gPiA+IFdoYXQgdG8gZXhwbGFpbiBpbiAjMi4gOikNCj4gPiA+ID4gPiA+
ID4gPiBUaGluZ3MgY2FuIGV4cGFuZCB3aGVuIHN1Y2ggaHlwZXJ2aXNvciBpcyBib3JuLg0KPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTbyB0aGUgcG9pbnQgaXMgc3RpbGwsIHRvIG1ha2Ug
eW91ciBwcm9wb3NhbCB0byBiZSB1c2VmdWwgaW4NCj4gPiA+ID4gPiA+ID4gbW9yZSB1c2UNCj4g
PiA+IGNhc2VzLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gV2hlbiBhIHVzZSBjYXNlIGFy
aXNlLCBkZXZpY2UgY29udGV4dCBjYW4gYmUgZXhwYW5kZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBJdCdzIG5vdCBkZXZpY2UgY29udGV4dC4NCj4gPiA+ID4gPg0KPiA+ID4gPiBJIGRvbuKAmXQg
c2VlIHdoeSBub3QuIEl0IGlzIHN0b3JlZCBpbiB0aGUgZGV2aWNlLg0KPiA+ID4gPiBSZW1hcHBp
bmcgcGFydCB3aWxsIGJlIGh5cGVydmlzb3Igc3BlY2lmaWMsIHNvIGl0IG1heSBiZSBzdG9yZWQg
aW4NCj4gPiA+ID4gcGxhdGZvcm0NCj4gPiA+IHNwZWNpZmljIG1pZ3JhdGlvbiBkYXRhLg0KPiA+
ID4NCj4gPiA+IFRoZSBwb2ludCBpcywgZGV2aWNlIGNvbnRleHQgc2hvdWxkIHdvcmsgZm9yIGFs
bCB0eXBlIG9mIGh5cGVydmlzb3JzLg0KPiA+ID4gWW91IGNhbid0IGNsYWltIGl0IGNhbiBvbmx5
IHdvcmsgd2l0aCB5b3VyICJwYXNzdGhyb3VnaCIgbW9kZWwuDQo+ID4gPg0KPiA+IFdoaWNoIG90
aGVyIHR5cGUgeW91IHNwZWNpZmljYWxseSBoYXZlIGluIG1pbmQ/DQo+ID4gVGhlIGN1cnJlbnQg
cHJvcG9zYWwgc2hvdWxkIHdvcmsgZm9yOg0KPiA+IDEuIHBhc3N0aHJvdWdoIG1vZGVsDQo+ID4g
Mi4gbWF5IGJlIGZvciB2ZHBhIG1vZGVsLg0KPiANCj4gTm90ZSB0aGF0LCBpdCdzIG5vdCB0aGUg
dmRwYSBtb2RlbCwgaXQncyB0aGUgbW9kZWwgdGhhdCBjYW4gZG8gY29uZGl0aW9uYWwgdHJhcHMN
Cj4gZm9yIHZpcnRpbyBjb25maWcuDQo+IA0KPiBJIHRoaW5rIHdlIGFyZSBzb21laG93IG1ha2lu
ZyBhbiBhZ3JlZW1lbnQgaGVyZSwgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlDQo+IHByb3Bvc2Fs
IHdvcmtzIGluIGJvdGggbW9kZXMuDQo+IA0KPiBUaGVuIEknbSBmaW5lLg0KPiANCk9rLiBTbyBs
ZXRzIGV4dGVuZCB0aGUgYWRtaW4gY29tbWFuZHMgdGhhdCBmaXRzIHRoZSBib3RoIHRoZSBtb2Rl
bHMuDQpJIGRpZCBmb3IgIzEsIHlvdSBzaG91bGQgc2VlIHdoaWNoIG9mIHRob3NlIGNhbiBiZSB1
c2VmdWwgZm9yICMyIG9yIGl0IG5lZWRzIG5ldyBjb21tYW5kcyBvciBjbWQgZXh0ZW5zaW9ucy4N
Cg0KPiA+IFRoZSBtb2RlbCBzZWVtcyB0byB3b3JrIGZvciBwYXNzdGhyb3VnaCBhbmQgdmRwYSBi
b3RoIGNhc2VzIHRvIG1lLg0KPiA+DQo+ID4gSWYgc29tZXRoaW5nIGlzIG1pc3NpbmcgZm9yICMy
LCBlaXRoZXIgZGV2aWNlIGNvbnRleHQgY2FuIGJlIHVwZGF0ZWQsIG9yIG5ldw0KPiBjb21tYW5k
cyBjYW4gYmUgYWRkZWQuDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiA+IE5vIHBvaW50IGluIG1h
a2luZyB0aGluZ3Mgbm8gb25lIGltcGxlbWVudHMgb3Igbm90IHByZXNlbnQgaW4NCj4gaHlwZXJ2
aXNvci4NCj4gPiA+ID4gPiA+IFRoZSBpbmZyYXN0cnVjdHVyZSBpcyBleHRlbmRpYmxlIHNvIHNw
ZWMgaXMgY292ZXJlZCBmb3IgaXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJdCB3b3VsZCBiZSBw
cm9ibGVtYXRpYyBpZiB5b3Ugc3RpY2sgdG8gY2xhaW0gInBhc3N0aHJvdWdoIiBidXQgbm90Lg0K
PiA+ID4gPg0KPiA+ID4gPiBJIGRvbuKAmXQga25vdyB3aGF0IHRoaXMgbWVhbnMuIEkgYW0gbm90
IGRlYmF0aW5nIHBhc3N0aHJvdWdoL25vbi0NCj4gPiA+IHBhc3N0aHJvdWdoLg0KPiA+ID4gPiBX
aGF0IGlzIGluc2lkZSB0aGUgZGV2aWNlLCB3aWxsIGJlIHBhcnQgb2YgZGV2aWNlLWNvbnRleHQu
DQo+ID4gPiA+IFdoYXQgaXMgcGFydCBvZiB0aGUgcGxhdGZvcm0gY29udGVudCwgd2lsbCBiZSBw
YXJ0IG9mIHBsYXRmb3JtIGNvbnRleHQuDQo+ID4gPiA+IFNpbmNlIHRoaXMgaXMgZ2VuZXJpYyB0
byBhbGwgdHlwZXMgb2YgUENJIGRldmljZXMsIEkgZG9u4oCZdCBzZWUgYQ0KPiA+ID4gPiBuZWVk
IHRvIG92ZXItc29sdmUNCj4gPiA+IGl0IG5vdyBpbiB2aXJ0aW8uDQo+ID4gPg0KPiA+ID4gT2ss
IHNvIHlvdSBhZ3JlZSBpdCBjYW4gd29yayBldmVuIGlmIGh5cGVydmlzb3Igd2FudCB0byB0cmFw
Pw0KPiA+DQo+ID4gWWVzLiBJIGJlbGlldmUgc28sIGl0IGNhbiB3b3JrLg0KPiA+IElmIHNvbWV0
aGluZyBpcyBtaXNzaW5nLCB3ZSBzaG91bGQgZGlzY3VzcyB0byBlbmhhbmNlIGl0Lg0KPiANCj4g
VGhhdCdzIGdyZWF0Lg0KPiANCj4gVGhhbmtzDQoNCg==

