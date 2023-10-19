Return-Path: <virtio-comment-return-7866-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB52CCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:33:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EA03A2A8E1
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:33:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7DC89868DF
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:33:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B3ECE9868DC; Thu, 19 Oct 2023 10:33:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3C1B9868DD
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 10:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHAg81OXAHS0XG0ZSvhju13niaRPIfKvLNUiLt4oA6MTdyviyjGG8WZaiyEiXKEvPLNbWL4Sq9gn5sogLhtfdwrkizczeYz51Vp8wN4z4ntGMiAghOBTX1q1MLQWbdWJfkFQYtfqTxclDmQxwI+J5BVyviwaZDezcQ/LK0VR+xBWk8HaAoKLNB52jj7VSCWahcXP2fknWfO5yhEOzWOUGCuNUugVcQfGWWoXZyjaxcrdpuGYCeL90LYV095t390oBUPiSH0wgFsoQc+FdEsdc5HwpaQpncl0j6vrkSscSNJvH/zY7y6kluVXlXUWcCppdviwxm+CHCq2ex9tsXX7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y10S0CF/g/7+U2QBkDN0xVylw/clM1pBbe+3JOKtR8=;
 b=ZU+K+tTHAVtdhKHalvxuISitbzrcRL1DNwAe6LlAqQfiu51bk4jZIsJ1m+/sILUDM+50GNw9SeKloXFQmw/XvGgGzktN6LvIIlh7WlfJz5cncK9zQGt8IxUvBmgIh8eLXwyFefuvaTfZxrsDql92VdBSNEgFzeLUUq7oDQ+OB6z3LyDjgitRvsjTi3m8iUj4AVFiNt9WDXEgQdux0sxfo2XZ7c989Co7yhwVgJ28p62fFt08QCKPx4UH7AqpKYpqClFlhsv4WPMHBQyXzqCIFRmNQRYi4p40NWwee448MQ4Z6pQVsetqnvlY3AjC60+CDYQXJTWI3ASCmFjoxAotNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrw
Date: Thu, 19 Oct 2023 10:33:15 +0000
Message-ID:
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
In-Reply-To: <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7106:EE_
x-ms-office365-filtering-correlation-id: 34255917-7f12-4bd7-81ae-08dbd08ecdb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P54TmokikFEZ4Od/wq3nW2NLe5TEP6RDouQLnkfXWxZDL/GWhK9M/6+mesu2IOV0TR2BtWojwymwsE6TgdLE6GjQqoJeZ8IfE9h/3ScrlIG6LlM/yIIHNkkyFCYpj4+PMzawx2nWOVhIJI4ROloQF5HF6COSJYwVJEpoMSC1sgUK22B+hcc09SXpPuk18NxObp0x/Y0eoWZSFd/zB3cG3HBcIDEWGEabr2fCF06Of18TlxQgsanxY6dNW/xJy8aGMAkymQemSJ2IRWiqGE42T550Noz82ZhYcCRFw6DSCviTslf0GvBqzveRb9ebczEXh5RVg+pL3id4tUfcttiKRGtHzqiqM+E1y5ElbUf9SYqY6HHF7Gt3i6OmWgmhxcBD6lypy1KdQm1XCPgOOgPuQ4dRdQDiz/vPoD3z/QtxrAMwazSEO4ag03fxjWfAe5icqU3GUr+SVivop0Xnp5O9W5w2D2WBZyhd6eN0IkvvyPV+MO5dQHm+Hg21rX4ca+07WXQxI3MIOPAWXt4GVuRzmxFxEErYyt54lgR+yXG4p+MCgQcbXNuS3nTH0BEKko49A4A/TPt3XWPXBlkAg4BpIGqQ7l4cGdbcX484gKQuV2jAGQ3QFrjwizkk+rPtCKDU+OOxkBOWugca+PoyEVIZk0L+XiJvYyVLv+Q8cO+06e8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(41300700001)(55016003)(9686003)(71200400001)(26005)(66946007)(55236004)(53546011)(76116006)(4326008)(2906002)(83380400001)(8936002)(107886003)(478600001)(52536014)(110136005)(8676002)(66556008)(316002)(54906003)(66446008)(5660300002)(64756008)(66476007)(6506007)(122000001)(7696005)(966005)(38100700002)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnlzQWZYRWpZWEdOTnBNNlNMdWJ2V21jcEN0d3g0MjQ4K3RFWWh3RDIwdElt?=
 =?utf-8?B?Z21yM1A1OHg3Uk9tVEFTaFlUTDJkeEJYL01UVXBjaEtldmtEWDNwMmRMazRB?=
 =?utf-8?B?bnlyVENXbitNNGhSbXNSVXFFOUE5VWEzOTBESlhFdTJFbFl3SFhERHArblB4?=
 =?utf-8?B?MmhPbjB6V2N3Y2xBenlvSWNCUlNRSlRZWTBWVUVURzhLM1oyQW9HM0xkQWti?=
 =?utf-8?B?MlpaN2VuOW5iTzF6Q3hYelRDNFBEVE44K3lwaVg0cUZBVWpDeVFoZmhCSHgv?=
 =?utf-8?B?bzJqSjBpM3lPS2l1Zmlnb2pDbmQwRmRFR0s4NlJheWxUbStpRG04cnBYTHRC?=
 =?utf-8?B?eGIyRjE3VGlGamRmK1FHczZiVmZnUVhMMG93Vk9Pc3lpMjlzQ0YvbmJVb3Zn?=
 =?utf-8?B?ckZ6eENyNXh2dlVFb3lQNS80S0dMK1hRSTNUUzdwYW16aFZHSnZlRGhIeTJh?=
 =?utf-8?B?WlRqbVlObW5ZU1E1YnQ5bUhrSVJOTHN4QjZjY25VaWcybHgyaGlHRkg5dFRv?=
 =?utf-8?B?UjRKdDBwQ0plK3NrbEltVmtDVkNrcDhUaEl1MlFuejNhWmcrS0t6U3hBa3NP?=
 =?utf-8?B?OXo2MGVadWFkUDhRQmlzYzJNdDI5elhlNCsrNzlwaUk3d2twNXdJb2I3c011?=
 =?utf-8?B?eDlRbzFlVG5qNkdBZWt3WGZwdXlCRlVySDJEUm91QmhBQzcxZ1EzNTBWUkpL?=
 =?utf-8?B?QzBRcDVIR01Wa2JWSENleS9lTHRzZW8xVUdPU1ZwMGNzUFNQSVJvS3czcUJO?=
 =?utf-8?B?SnU3RlAvYm8xb1RhR083VkF4R05uZWRZenUzSWlHQzVHMW1nOWlXc1dOSlFQ?=
 =?utf-8?B?d0VQQ1Z2S1hBZ2RrYnQ2ZWFLY1FiRjZxbzVETE9WaVo1S2RyVGF1MWg3V1do?=
 =?utf-8?B?d0JDTEQ5cmlFNm9MV3MrZE1VUXUrTzNaNXF5V0VBZUY0d1k1YW9nV2VBK1dw?=
 =?utf-8?B?VjlHYjEzdkJMaXhHVVNBOE5NUFhzbkNxYXYwbHpGNTdtVklLanpJL3NmMVJB?=
 =?utf-8?B?UE1mdlZJKzJTMmxHbi9qY0NGTVd6bGJYSXI2c0dpRTZHWUdqS1BBNWd2WXB1?=
 =?utf-8?B?QjUyOFlQZFBhV0RncjFLakxzQzBlQVN0ZGhBeW9ZbVhIY21FUmNNVEhuN1NB?=
 =?utf-8?B?TEQ0emtJalQ0NnNEc281dGtnTGMrOTQ2NzV0SjF6MGNVdk1ad1ZUcVI5S3Jk?=
 =?utf-8?B?aDBmNTVCem9Jb2pCaEk0V3c1ZW05WW5rckJGTXh4RmFMTkdrWGw4OFNUMXRX?=
 =?utf-8?B?Q3BZZ3g1ZHdhYUhkM1g3VHV2ZmJJN2ZOcmlyalkxbnRBdmlPN1RGVEx2RWhQ?=
 =?utf-8?B?NkRWbHJscUxoM3dPVjY4cVVxVnR3MXF1UE03Nk1KRzJqNHlEUzJUQWhocEVP?=
 =?utf-8?B?KzdQM01xMHRLaENQSGlZRHgvRnVoQ1d2WGN4RlRsN1JWdmYwTXZWNlNvdlZz?=
 =?utf-8?B?cjJ2V2JqaW9zQWJDclMxZEZFTlZ2S0xwR29qZUtKT0UyMWFKbzYvcTEzUXhC?=
 =?utf-8?B?b2txbCtOK0ppZWY1cGFDa1hvVFk1ak4xSEVubHFaL3hZUUpsTEVQdW9YWHRI?=
 =?utf-8?B?NHZQcEkwd0ZzR0NBUTNjbkV0MzRlUllVd3hBL002QVBUaldYSWs0cWRtY1VY?=
 =?utf-8?B?YXRWUGE3Z0ltdEhZaXRXRDJ3L3VIVjNCbVczUEVPUW9xOTArTkcrYzB0ZTMw?=
 =?utf-8?B?OEZxS0pnZlJoTkQvWTFPelZtSVpJYnVFOU9vSU1scnE1YU50Rlp0TUVPVDc2?=
 =?utf-8?B?QlhodVdQYWNlUW94dHV2ZWljVXlrbkV3blVxUno3NnllNzMvM09ucXlicFZ0?=
 =?utf-8?B?M25IUWQ4NmFUS1ExTEdZV20vZ3ZsRmRuVXZoL0tuM3ZUUWhjLy9MOVo2Sm5C?=
 =?utf-8?B?ZDVzbGpYUDhxQ2V4dERVM3hGNnkzK2RLTVpsVEp4eDJ5Y08zMEV5ZDlVTkZH?=
 =?utf-8?B?WXdJTEVwVXlLU2xVQ2FJaGdib0FrRk1zM3B5SEtHOExFS1NGRGhzUERiZGdk?=
 =?utf-8?B?eXQyNHRXT1duTHlSWmVpL0tXRk1SdTdmNDlCRW01S3ZLSXU4L2tXaDcxZ20r?=
 =?utf-8?B?ODFhaW5nNi9ZOHBNY0p0dkhtOXB2bGxBdUNqRWFxTVZuK09MWEV1UnNkL29w?=
 =?utf-8?Q?dgYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34255917-7f12-4bd7-81ae-08dbd08ecdb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 10:33:15.7865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3mOWP3QNFG7ruGlncHy2XpOqdWd8dDes9WYV4cr0iiJo1d6BKDyR7hMzVgMBSCVrn1Zfk93GIVAvBPk1eCWiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgT2N0b2JlciAxOSwgMjAyMyAyOjQ4IFBNDQo+IA0KPiBPbiAxMC8xOS8yMDIzIDU6
MTQgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBUaHUsIE9jdCAxOSwgMjAy
MyBhdCAwOToxMzoxNkFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+PiBPaCwgcmVh
bGx5PyBRdWl0ZSBpbnRlcmVzdGluZywgZG8geW91IHdhbnQgdG8gbW92ZSBhbGwgY29uZmlnIHNw
YWNlDQo+ID4+PiBmaWVsZHMgaW4gVkYgdG8gYWRtaW4gdnE/IEhhdmUgYSBwbGFuPw0KPiA+PiBO
b3QgaW4gbXkgcGxhbiBmb3Igc3BlYyAxLjQgdGltZSBmcmFtZS4NCj4gPj4gSSBkbyBub3Qgd2Fu
dCB0byBkaXZlcnQgdGhlIGRpc2N1c3Npb24sIHdvdWxkIGxpa2UgdG8gZm9jdXMgb24gZGV2aWNl
DQo+IG1pZ3JhdGlvbiBwaGFzZXMuDQo+ID4+IExldHMgcGxlYXNlIGRpc2N1c3MgaW4gc29tZSBv
dGhlciBkZWRpY2F0ZWQgdGhyZWFkLg0KPiA+IFBvc3NpYmx5LCBpZiB0aGVyZSdzIGEgd2F5IHRv
IHNlbmQgYWRtaW4gY29tbWFuZHMgdG8gdmYgaXRzZWxmIHRoZW4NCj4gPiBMaW5nc2hhbiB3aWxs
IGJlIGhhcHB5Pw0KPiBzdGlsbCBuZWVkIHRvIHByb3ZlIHdoeSBhZG1pbiBjb21tYW5kcyBhcmUg
YmV0dGVyIHRoYW4gcmVnaXN0ZXJzLg0KDQpWaXJ0aW8gc3BlYyBkZXZlbG9wbWVudCBpcyBub3Qg
cHJvb2YgYmFzZWQgYXBwcm9hY2guIFBsZWFzZSBzdG9wIGFza2luZyBmb3IgaXQuDQoNCkkgdHJp
ZWQgbXkgYmVzdCB0byBoYXZlIHRlY2huaWNhbCBhbnN3ZXIgaW4gWzFdLg0KSSBleHBsYWluZWQg
dGhhdCByZWdpc3RlcnMgc2ltcGx5IGRvIG5vdCB3b3JrIGZvciBwYXNzdGhyb3VnaCBtb2RlDQoo
aWYgdGhpcyBpcyB3aGF0IHlvdSBhcmUgYXNraW5nIHdoZW4geW91IGFyZSBhc2tpbmcgcHJvdmUg
aXRzIGJldHRlcikuDQpUaGV5IGNhbiB3b3JrIGZvciBub25fcGFzc3Rocm91Z2ggbWVkaWF0ZWQg
bW9kZS4NCg0KQSBtZW1iZXIgZGV2aWNlIG1heSBkbyBhZG1pbiBjb21tYW5kcyB1c2luZyByZWdp
c3RlcnMuIE1pY2hhZWwgYW5kIEkgYXJlIGRpc2N1c3NpbmcgcHJlc2VudGx5IGluIHRoZSBzYW1l
IHRocmVhZC4NCg0KU2luY2UgdGhlcmUgYXJlIG11bHRpcGxlIHRoaW5ncyB0byBiZSBkb25lIGZv
ciBkZXZpY2UgbWlncmF0aW9uLCBkZWRpY2F0ZWQgcmVnaXN0ZXIgc2V0IGZvciBlYWNoIGZ1bmN0
aW9uYWxpdHkgZG8gbm90IHNjYWxlIHdlbGwsIGhhcmQgdG8gbWFpbnRhaW4gYW5kIGV4dGVuZC4N
CkEgcmVnaXN0ZXIgaG9sZGluZyBhIGNvbW1hbmQgY29udGVudCBtYWtlIHNlbnNlLg0KDQpOb3cs
IHdpdGggdGhhdCwgaWYgdGhpcyBjYW4gYmUgdXNlZnVsIG9ubHkgZm9yIG5vbl9wYXNzdGhyb3Vn
aCwgSSBtYWRlIGh1bWJsZSByZXF1ZXN0IHRvIHRyYW5zcG9ydCB0aGVtIHVzaW5nIEFRLCB0aGlz
IHdheSwgeW91IGdldCBhbGwgYmVuZWZpdHMgb2YgQVEuDQpBbmQgdHJ5aW5nIHRvIHVuZGVyc3Rh
bmQsIHdoeSBBUSBjYW5ub3QgcG9zc2libGUgb3IgaW5mZXJpb3I/DQoNCklmIHlvdSBoYXZlIGNv
bW1hbmRzIGxpa2Ugc3VzcGVuZC9yZXN1bWUgZGV2aWNlLCByZWdpc3RlciBvciBxdWV1ZSB0cmFu
c3BvcnQgc2ltcGx5IGRvbuKAmXQgd29yaywgYmVjYXVzZSBpdCdzIHdyb25nIHRvIGJpZnVyY2F0
ZSB0aGUgZGV2aWNlIHdpdGggc3VjaCB3ZWlyZCBBUEkuDQpJZiB5b3Ugd2FudCB0byBiaWZlcmFj
YXRlIGZvciBtZWRpYXRpb24gc29mdHdhcmUsIGl0IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIG9w
ZXJhdGUgYXQgZWFjaCBWUSBsZXZlbCwgY29uZmlnIHNwYWNlIGxldmVsLiBTdWNoIGFyZSB2ZXJ5
IGRpZmZlcmVudCBjb21tYW5kcyB0aGFuIHBhc3N0aHJvdWdoLg0KSSB0aGluayB2ZHBhIGhhcyBk
ZW1vbnN0cmF0ZWQgdGhhdCB2ZXJ5IHdlbGwgb24gaG93IHRvIGRvIHNwZWNpZmljIHdvcmsgZm9y
IHNwZWNpZmljIGRldmljZSB0eXBlLiBTbyBzb21lIG9mIHRob3NlIHdvcmsgY2FuIGJlIGRvbmUg
dXNpbmcgQVEuDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC84
NzBhY2UwMi1mOTljLTQ1ODItOTMyZi1iZDEwMzM2MmRhZTlAaW50ZWwuY29tL1QvI20zNzc0M2Fh
OTI0NTM2ZDAyNTZkNmIzYjhlODNhMTFjNzUwZjI4Nzk0DQo=

