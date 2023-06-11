Return-Path: <virtio-comment-return-6300-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46AFC7EE23
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Jun 2023 20:56:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C57132B03A
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Jun 2023 20:56:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE7179864F3
	for <virtio-comment@archiver.kernel.org>; Sun, 11 Jun 2023 20:56:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9980F98608C; Sun, 11 Jun 2023 20:56:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 853BA98640B
	for <virtio-comment@lists.oasis-open.org>; Sun, 11 Jun 2023 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3m6l7jkGDnQYTNUErgl7ohGalAXA+Z/OP7QPN6J+pjSZE/X5NVjNyu8M9A4BV0ac0SKcZgZG0eOvwL3iE1vAAegcCiRQZFvsbxDgWVOejZxDW2sjvPpn1M5U44wkjezy9neBQETHrgZP94TrhbR3m+z/6jESYBddaQTkA7xPwsjklJekRNjfxE5bvv/Dew1JVfGGYHDe/MQ0hG7mug3iKrBThEXL4LEFs17M5rwnA6zr4gnB7QYxtTzZ7ArVkGd0K+LxxTM39thuggIjOzS9P0WsV4Ewg4V/KFPRAo2rEfFjGMaeq5OKu/ILtyajHmmO8riafVLKChMbWj5oWcxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UIlL0qwm1NSG1Zr4VKxV9ckh2kada53qh1qWN4juyg=;
 b=gcWNGUoxAFtizBA6hYRwzNlx0i54DM4P0Xl63ZueRyPzuaSipUk5F+xOc4bGjHuUnNvERHxQCvCbFhekH6DbVVz5rYS7bbbHReoQljEcbGBQAfj9YRMfhQpfS4z1HZXTOhQgXb7imwUMwDwXShYMNiM8TN2SVvOlQvyiwpbCVBUxrXB4nRTPp7Nx1DFRbdquohi8pI6/VgvORVufBPHYWSqduAZifJOBSANUb7gJEeaYNqbOgrj6upvSov2M4TqHN3f5o958c24h4MPG6K/LCcecVGC82YNxrgf79vWmjczgfyY3lL22N9044i/7mzNdzkRw+WnwGJC5d+Pim6oBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, Stefan Hajnoczi
	<stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] RE: RE: Re: Re: Re: [PATCH v2 06/11]
 transport-fabrics: introduce command set
Thread-Index:
 AQHZfmF2m1yu3FfKeUGpsXWnsx3M9K90yN4AgAJcugCABXPNAIAAlxGAgADKFQCAAOCkgIACeCyAgAADBvCAAJNGgIAABt4QgAAfEgCABEC1cA==
Date: Sun, 11 Jun 2023 20:56:12 +0000
Message-ID:
 <PH0PR12MB5481B15C36FA7600FB9CFD73DC57A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
 <20230606133444.GC1958291@fedora>
 <86978fc3-c065-5a64-2996-28b4eb2b40bd@bytedance.com>
 <20230608164123.GB2240319@fedora>
 <PH0PR12MB5481C447A5FCA25A6D5B28E0DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3455f74-c0a8-5285-0b07-caa99e17ce44@bytedance.com>
 <PH0PR12MB548134F882F3B725749BED05DC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <36cf507b-2dd8-2d77-c6a9-b561e5ba491e@bytedance.com>
In-Reply-To: <36cf507b-2dd8-2d77-c6a9-b561e5ba491e@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4113:EE_
x-ms-office365-filtering-correlation-id: df4c879a-7e51-4143-913f-08db6abe4a63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dSd/lvzrZcvP9iZBvFLDfkVq7Gz8kkCyi3X/ftR7gqdheI2m42YtAWqZOiths2ZZAj3EOqnQcXPBGmCVhAqZKbCxW7iAZwSONGBT1nAehMyvLR4HbQakX3Gml5sezaeUKbLgAjBL4X+GEVGiAxyYhZDhFCL/8mGS9bfkNhx46clBVOWoJtmiCIK5LB6BzPeu88yknj7di6jUU8tUwvNcvpfSKpUEiGTs3l11z4YE8/03NJFBS+7Ej4AkmNPH7et4yQ/sfTui159o9z3d3bRwRiUAIveivLF5dtueMUckpbm3rST1L80KDvFzyb+nHKSWIlmmvwNj1/lL46GxVzWh8S0LJ3pJ/3nEvKGK/z2kkHipWf77S6uAu1fqVj7VjBE0642cfwC7WVjPSghmXI+hd4f/OI3EPqRwXdKpQlpu+CaPIYtrM1nybKXdtJknjy7O2PZKztv320hd/dhEHlF20GeZteOfttW2pm3qbiKKu+pNESwMLVxdQ1rNhrsZmkZsXpmzMmnTEMUaf0VMUXPDIqVMvJUkMSalg/fpQ7duGJGeT0RDo4/tXKOEUmsrN6tEB3lZOCw1nu0TqshEGG1q8jJN/m9q0Cx/H0Z6w4WbrJg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39850400004)(451199021)(186003)(26005)(6506007)(9686003)(83380400001)(7696005)(71200400001)(2906002)(8676002)(8936002)(55016003)(54906003)(110136005)(478600001)(33656002)(4326008)(38100700002)(122000001)(5660300002)(86362001)(66556008)(52536014)(66446008)(41300700001)(38070700005)(316002)(66476007)(66946007)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjNmelRjcENwdkJWYjJ6QlhmeGM1TkxxNzNYanEveDU0dUFMeXhNM2hMeW1J?=
 =?utf-8?B?MjlDU3hwK1VPdjNDY2s2blpGeENyVHIrZWZ1UHJaTHRtb05FTUZmN1hkcHYr?=
 =?utf-8?B?WmlzclFFQU9xYVNXc2NJWlA4NjV3cW0zV082aDF0OTd6N1BTbWlZVndzb1JC?=
 =?utf-8?B?TmhmVisrZUxScnMvMzdyVTBsZ1R1Q1c4R25vR1h4ZWlqQzIvNGJ6SldOV2tW?=
 =?utf-8?B?RzYzL2JaSGFTS3RHQlB3bVlYMmlnSFBjeDR6aW9tLzNWWGV5cFlPeTdKeFd1?=
 =?utf-8?B?Q09oUDZ6TjluNVVWWGo1ZDlmTWllSzJvMUtpRWZEY2RvL05KdjBUZ08xMlRM?=
 =?utf-8?B?WS9acFNJM2NRbEJmQXZJMGlzZWlPQ3dhRmFWWHpHV2s1V2JGY05GYjE0SDA1?=
 =?utf-8?B?WjlPSm9FdDJnSnUxaDdkMVNjRHFiYzc3allFTVVIQ2p1U21jYVdTVFF2czd5?=
 =?utf-8?B?RWcyN2lSRUFmVEh5R3Zvc1JadDMzK1hGQS9ieklyM2FSRUFaQ2JId0E0YktY?=
 =?utf-8?B?enJ5RlFHclFDNHpnZVdQN29RdDlsUWxnTGY3dUhBblZsYmJQM0F1T2lxaUhr?=
 =?utf-8?B?NWVBUE1KWC9Cb0lma0JEVHJSYWF1RUJEdXpIUkl3QzkyUThaaklXWGU1cGYz?=
 =?utf-8?B?UkUzWnVoREVqazRqU2lxNlBFYTNrOVFCc3pzeDBmSzZmdGFYRkVFeWFiZlNE?=
 =?utf-8?B?TWQwdDI0aFg5MjlnVU1qZUJhc0orSUNRU20rWVNCQSt2Q0JQM3crb2U4YlRQ?=
 =?utf-8?B?dmkzU21jemxYTERQQ3EzUmtFelZCdWVLVjNDQVVwVm9ydUQ3MFQ3dE1LU0dX?=
 =?utf-8?B?QnlQM3dsaEdEdkVGUEovVVprTFRxajh3VDBiQXFZRjJzanNQQVRxOWt6N2Nz?=
 =?utf-8?B?WFkzYzF0eDRTWkRTZ0VVQzdWVWhzeXBVT2RCQWtyM2lHOU5YSWNPN1RWSStq?=
 =?utf-8?B?blB4WHRlTWc0Q2FhRkptdksyYStIMUMrVFkrbjl5QUU3RkJzaTc2QVdFQWpX?=
 =?utf-8?B?ZEQwNVptbFBtYXB3Q0dib0VkY2lsMXZ6dDQ3V2RmbWRGcEFpeXp2dllLS2V6?=
 =?utf-8?B?VjcvZjhIQkRRRmE4R1lIS0xscGxUNmFlcWxnZmlhVyt2bXlpQTdUOTAzc3JF?=
 =?utf-8?B?amw2T0wzc3JidzZYc2RpdWZya3lWVVZSejJBK1doWVp2ZGE2R0tMZlNpU2x2?=
 =?utf-8?B?UWMrSGhzRlFXYkh6SzYzRno1TnRLclZKMGtHN0hQUjg1SUg2TVcwakViNFhm?=
 =?utf-8?B?VnVtUzg2ZU0yTHRXRjRodU5aWStQOEVNRVJjL29MZmV6S1RBQ0NCT2NqVUJ3?=
 =?utf-8?B?VUtwUnErTE81NlN2eWlObUV2ZytRUGVJemVaV3IzY3d3TndJMnhPWmVEZ1Nx?=
 =?utf-8?B?VE9veHBxc0FuaDVQd25VYUJ4aVplcGN3cTJvb2pEbXFtYmlGdGJBSHZwNTFE?=
 =?utf-8?B?NW1rSkhZZkp3blR3S1c3NVp4OWNKVTFOVEp2dW9aa3FDdlRLMGFVc0Z6YWkw?=
 =?utf-8?B?dlYrc0JhNldEaGhMNGl0L25rMEljT3gzYmFWakRvWllmUlNlSERhcis4aEl0?=
 =?utf-8?B?Mk5vRE5STDNhMWJiTktuQkF3ZndrK1V6TnhMMEIxVEI3M0NNeHBNNjFpdStX?=
 =?utf-8?B?RGw5Ym51U2hPY2ZpVEhQaThMK2xML1NoTWFSMmVWZ3BvdkJWSkl5MmJ1V0hk?=
 =?utf-8?B?dytHZU5zOEZ3Uis2Nm1ZdUZZSldSczVlSGlMdzVmU0JrTEpUMnY3c3ZrbEt2?=
 =?utf-8?B?bGZsYVNYeE13S1lWTXpSMk92RDA5RXpxWm5SZEh2bkFBWnVOSzB4RFVEZ2k3?=
 =?utf-8?B?U1FKMm9HMllZRlgxY2VzaXFJbXRWNFBjemFUcCtDUVNjeGxtckU3aSs5NTlI?=
 =?utf-8?B?SEVaWndYQXhUT1VQWFliNGhET2U1WHZPSVZqSE9TQW9QZzVqa05GZkFNRXg1?=
 =?utf-8?B?ZnNpd0M0WXlrMGJwTlc4dmxRcFRWbHd6cjJ3OHlaRVcwYitFbzVveGp4TDZN?=
 =?utf-8?B?dFVpb25XRkFTUkN2L2hRT2loS3V6NTBiMHYvMHd1MlAvcENaek95UnZUbEhG?=
 =?utf-8?B?djJDaVgvV1BBVWpSRW1wQVZiN29EOHk5a0w1dXRxSWhWNnFtb1pLT0JaMXNT?=
 =?utf-8?Q?s9tA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4c879a-7e51-4143-913f-08db6abe4a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2023 20:56:12.7134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tje7/YvgNHNZW7AyCn5oXk+4TKd1JmhcwZKmIJyzdkGavlxovkHFsLa3UOkirW76y6VYaVTb6pEQKug2SkZspw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113
Subject: RE: [virtio-comment] RE: RE: Re: Re: Re: [PATCH v2 06/11]
 transport-fabrics: introduce command set

DQo+IEZyb206IHpoZW53ZWkgcGkgPHBpemhlbndlaUBieXRlZGFuY2UuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgSnVuZSA4LCAyMDIzIDExOjU1IFBNDQoNCj4gSSB0cmllZCB0byB1bmRlcnN0YW5k
IHlvdXIgcHJvcG9zYWwsIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgbWlzdW5kZXJzdGFuZC4uLg0K
PiANCj4gRGVmaW5lIGRhdGEgc3RydWN0dXJlIGxpa2U6DQo+IA0KPiBzdHJ1Y3QgdmlydGlvX29m
X2tleWVkX2Rlc2Mgew0KPiAgICAgICAgICBsZTY0IGFkZHI7DQo+ICAgICAgICAgIGxlMzIgbGVu
Z3RoOw0KPiAgICAgICAgICBsZTMyIGtleTsNCj4gfTsNCj4gDQo+IHN0cnVjdCB2aXJ0aW9fb2Zf
Y29tbWFuZF92cSB7DQo+ICAgICAgICAgIGxlMTYgb3Bjb2RlOw0KPiAgICAgICAgICBsZTE2IGNv
bW1hbmRfaWQ7DQo+ICAgICAgICAgIGxlMzIgb3V0X2xlbmd0aDsNCj4gICAgICAgICAgbGUzMiBp
bl9sZW5ndGg7DQo+ICAgICAgICAgIHVuaW9uIHsNCj4gICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
dmlydGlvX29mX2tleWVkIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGxlMzIgb3V0X29m
ZnNldDsNCj4gICAgICAgICAgICAgICAgICB9Ow0KPiANCj4gICAgICAgICAgICAgICAgICBzdHJ1
Y3QgdmlydGlvX29mX3N0cmVhbSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICB1OCByc3Zk
WzRdOw0KPiAgICAgICAgICAgICAgICAgIH07DQo+ICAgICAgICAgIH07DQo+IH07DQo+IA0KPiBz
dHJ1Y3QgdmlydGlvX29mX2NvbXBsZXRpb24gew0KPiAgICAgICAgICBsZTE2IHN0YXR1czsNCj4g
ICAgICAgICAgbGUxNiBjb21tYW5kX2lkOw0KPiAgICAgICAgICB1OCByc3ZkWzRdOw0KPiAgICAg
ICAgICB1bmlvbiB7DQo+ICAgICAgICAgICAgICAgICAgbGU2NCB2YWx1ZTsNCj4gICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgdmlydGlvX29mX3ZxX2NvbXBsZXRpb24gew0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGUzMiBpbl9sZW5ndGg7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBs
ZTMyIGxlbjsNCj4gICAgICAgICAgICAgICAgICB9Ow0KPiAgICAgICAgICB9DQo+IH07DQo+IA0K
PiANCj4gRm9yIHN0cmVhbShFeCBUQ1AvSVApLCB0aGUgcmVxdWVzdCBQRFUgaW5jbHVkZXMgW3N0
cnVjdCB2aXJ0aW9fb2ZfY29tbWFuZF92cQ0KPiArIGRhdGFdLCB0aGUgcmVzcG9uc2UgUERVIGlu
Y2x1ZGVzIFtzdHJ1Y3QgdmlydGlvX29mX2NvbXBsZXRpb24gKyBkYXRhXS4NCj4gDQo+IEZvciBr
ZXllZChFeCBSRE1BKSwgdGhlIHJlcXVlc3QgUERVIGluY2x1ZGVzIFtzdHJ1Y3QgdmlydGlvX29m
X2NvbW1hbmRfdnEgKw0KPiBzdHJ1Y3QgdmlydGlvX29mX2tleWVkX2Rlc2NdLCB0aGVyZSBhcmUg
MiBvcGNvZGVzIGZvciBrZXllZCB0cmFuc21pc3Npb246DQo+IDEsIG9wY29kZSB2aXJ0aW9fb2Zf
b3BfdnE6IChiYXNpYyBhbmQgcmVxdWlyZWQgY29tbWFuZCkgdGhlIGluaXRpYXRvciBwcmVwYXJl
cw0KPiBhIGJ1ZmZlciBvZiBbb3V0X2xlbmd0aCArIGluX2xlbmd0aF0sIHRoZSB0YXJnZXQgcmVj
diBhIDMyQiBjb21tYW5kLCBhbmQgcmVhZHMNCj4gdGhlIHJlbW90ZSBtZW1vcnkgW2FkZHIsIGFk
ZHIrb3V0X2xlbmd0aCkgYnkgUkRNQSBSRUFELCB0aGVuIHdyaXRlcyB0aGUNCj4gcmVtb3RlIG1l
bW9yeSBbYWRkcitvdXRfbGVuZ3RoLA0KPiBhZGRyK291dF9sZW5ndGgraW5fbGVuZ3RoKSBieSBS
RE1BIFdSSVRFLCBmaW5hbGx5IHNlbmRzIGNvbXBsZXRpb24gYnkNCj4gUkRNQSBTRU5ELg0KPiAN
Ck1heWJlIHdlIGNhbiBzd2l0Y2ggdG8gdGhlIDY0QiBmb3JtYXQgd2hpY2ggaGFzIHR3byBiZW5l
Zml0cy4NCjEuIHNlcGFyYXRlIFJETUEgYnVmZmVyIGZvciBpbiwgb3V0IHhmZXIgYXMgZWFjaCBj
YW4gaGF2ZSBkaWZmZXJlbnQgRE1BIGF0dHJpYnV0ZXMuDQoyLiBhYmlsaXR5IHRvIGhhdmUgb25l
IG9yIG1vcmUgaW5saW5lIGRlc2NzDQoNCkEgZ29vZCB3YXkgaXMgdG8gbmVnb3RpYXRlIHRoZSBt
YXhfY21kX3NpemUgbWluaW11bSBiZWluZyAzMiwgbWF4aW11bSBiZWluZyBhIGZpbml0ZSByZWFz
b25hYmxlIG51bWJlciBvZiA2NCBvciAxMjguDQoNCj4gMiwgb3Bjb2RlIHZpcnRpb19vZl9vcF92
cV93cml0ZV9pbmxpbmU6IChvcHRpb25hbCBjb21tYW5kKQ0KPiB0aGUgaW5pdGlhdG9yIGdldHMg
YSByZW1vdGUgYnVmZmVyIG9mIHRhcmdldChFeCwgMTI4SykgYWZ0ZXIgZmVhdHVyZQ0KPiBuZWdv
dGlhdGlvbi4NCj4gDQo+IFRoZSBpbml0aWF0b3Igc2VsZWN0cyBhIHJlZ2lvbiBvZiB0YXJnZXQg
cmVtb3RlIG1lbW9yeShFeCwgNGsgLSAxMmspLA0KPiBhbmQgd3JpdGVzIHBheWxvYWQgYnkgUkRN
QSBXUklURSwgdGhlbiBzZW5kcyBhIDMyQiBjb21tYW5kIGJ5IFJETUENCj4gU0VORChvdXRfb2Zm
c2V0IGlzIDRLLCApLg0KPiBUaGUgdGFyZ2V0IGhhbmRsZXMgY29tbWFuZCwgd3JpdGVzIHRoZSBy
ZW1vdGUgbWVtb3J5IFthZGRyLA0KPiBhZGRyK2luX2xlbmd0aCksIGZpbmFsbHkgc2VuZHMgY29t
cGxldGlvbiBieSBSRE1BIFNFTkQuDQpZZXMuDQo=

