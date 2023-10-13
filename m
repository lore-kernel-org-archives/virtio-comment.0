Return-Path: <virtio-comment-return-7705-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CB5CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:40:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC2032236C
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:40:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 881F298683F
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 06:40:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B23B986475; Fri, 13 Oct 2023 06:40:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AE54986835
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 06:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HY7ydqajKyBBGQznXPPXebxLnh9ancH6fDtVYqH2F1YOHQajoTzoW+Z/nGFbDhw7x20Jh1kThfFLwFX2gD9YhU3X0hV6MQcl4+PQ4efjKB4VQ3biMSpYzLI1YDrdeepeHaUcgrNtZ7HmYrMe6if9Sap/LmqzBTZBtbiup4BCGe3Kv7JI186UHsQEVYpGJuAoH7ULF0ikNrPxTVMsqZmVa0/yDM4SV2DT+8wnOyDzE81H9Xaub72nAQOPccgCu1SMdXadUrIDpoJfVlYz+m5Nps1EFknia0R25NKiXH+ubHYAkr2YOPcELPxeQkN+i1MSI91zit1Uo7XyfcfpjQqxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P39TwJYkFyT7X2OMj0hzM7GEMcvkUWHAqzTnPEIjA3M=;
 b=d2eTfmWjtzXLVUHrJdL4o1xlVKu5FrZlEsCBQHfF/SgEDk+ZTqWMMWdfAFFtDTP1ilb8WSSY41FXpBImZyIJwwpJDi57pZ+w2rKU3NMkN52g28e/SZQGGZghLw36pZ9m9TCYkA+gtN/bC53h73vDSisOXhWjic51O28R6PBER+AoxSnZRs+Jli8l0qGNyIx2t9XlFqQ5nF5zhBLsGehEjEBjs4qQVjlwE8uto4hTU5K6vXtb7ByOKByb2WGGSrB9KYIdWuVlsP+ByXRiLD7MAHYCJhaO1Z4KX/XIl25G0YupcnKU/BqqBbyxM3DdxpcTr0AqaZwxNkFkxSsDsOzDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAOkTgIAAS/0A
Date: Fri, 13 Oct 2023 06:40:09 +0000
Message-ID:
 <PH0PR12MB5481691682222F6A7E495A7DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com>
In-Reply-To:
 <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 461e1fa2-ca9d-489a-fc30-08dbcbb73ef2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tBDLtNKc47TWXwH02jQ9p9ArnOdUOy6PbOvVpr0TZtQdTBMHZCfnWncrsKCDrRCbnH7ieVGbg2bv18ACfHV7mbOx3DXZf58JFg2v4Oerge9SVa3vhfr+aj4BxmCY1OWE6AaX+VqEtHJGHhN8nVVPJoOd5CMCEUnUoJoFymD9jYoKacHWzsOVI8LqtViJs/WOI3j2humBOz5EmiomFknELjcGoSTd5P2g/qv+ZliNrwuP2kpC2+yRx6OouDw/0/BK9qst4YT9rT+n34Zc0ePEqnhrgnNgEKf/+syjlxgflDA4rl+1cEyO28HD7T2s7AHqjndUzOgo087a1+/a0fPOXvnKA6+6G/DCYFQ6N74U5+XNPUZ/opbWqpqyfOfPgY8USbjPqmwOICXxErU3vk0Yd9TsLVvKqiKO8iRI6t4dPUZ0NESYoN0HCW9/j7hUuQThVoVXRUTY8/cgW5WyCIxPdizLRhWpxlaKK4n+QAQq9/r5gwAfjYPXRGgmK+zH+mPFHgi302hQ8hPkogh3SpKbY8pP+Mlgn0+JbUFwhPnsHm3Mn8xmEobusU01wJJ+vTohwYE8EZRz7+Tcbi9zx0InLfIXBYcsto29EbvCejKUT+bSHgkOTYidatdhTht1rmfPn145dsbs4jBlVu+HlMoJ2w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(55016003)(966005)(71200400001)(2906002)(478600001)(41300700001)(4326008)(8676002)(8936002)(52536014)(5660300002)(66476007)(66946007)(64756008)(66446008)(54906003)(66556008)(76116006)(7696005)(316002)(83380400001)(6916009)(33656002)(26005)(6506007)(9686003)(122000001)(86362001)(38100700002)(38070700005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWtUaEhWTXFvN3dkUk85LzZlMDZYaVpua1p0RWNnR3Y1a0xpTVI1VE9JRVRl?=
 =?utf-8?B?OENMenVqdE9WQWkvSTMxUDYybjVSeHl1UFQ4Y3paKzhxU3BXbTV4YnV5Tktw?=
 =?utf-8?B?bFVNRFdtVlRVQkFpOGJvc2lhRUU4QkduRGVZakFNUlovbHloNDUyU0J4V0s4?=
 =?utf-8?B?cFA3THc3ZVF1c3l6OVRTZ2dFbkIyamFZMDZ6Q0lWNXBRTFBFNDE5cjdRdnIz?=
 =?utf-8?B?ZXd4c3NVbzk0VmEyaEtvMXhSdzlHM3o5bTBiQXliWTZsbzJHQStobjhrQTBF?=
 =?utf-8?B?UWw1UGhUeExxTWdxcWx4VSt6aGFvSmdHOXZmdFpMZ0VMOFRoQ1gxMHZHcXBh?=
 =?utf-8?B?aXgxWlFBZ1I5Q0w4dk8veFRucmU5YWgyZVFhYUtGRDM5dTlUWkxOZGowcXB1?=
 =?utf-8?B?bC9Ha2J6L0d6cmU2RWM1a3JYcVVoWnFRckJXczJoUy9ZcDIzenlQZ2lwZnc5?=
 =?utf-8?B?eFMrWmpjYzAwNXVFRGFWaWxXUEhmc3lFVmNUa1BDcHJ0RW8reDFqbjF4aTFK?=
 =?utf-8?B?OTlXMEczUzZ1ZTRVcHcyQmRHeS9yUVdvVlVCYUQvc0s4OEVHQm9FeDRqdE1l?=
 =?utf-8?B?NHFrdC9lQnQ5SGdvQS8zUk01dTc4aDFOQjlHazEwc3pTTVR6dVRWbk5pT1A1?=
 =?utf-8?B?bUJ4c3U2T3c0UHhmNFBBZk8zK1cwa3NPTTkrSzFzY2dxakJacFF2RVBsWFlk?=
 =?utf-8?B?UEdRYjdhamFKL0N1NmxOaGIrS09QU0pYWExUZkhhb0FVeit6Q3Byc0djL3pL?=
 =?utf-8?B?cUxYeDUxWktoU2dkVmI3MEZLMjZLWTMyWVhrL0wrWGlCaG50SHY0Q2o1MHV3?=
 =?utf-8?B?akhyRU1YMFI2a3Y5bkhrNk1jVmZPdnU4dE1ja002aE16YWVmM2Q5U0xTbWdB?=
 =?utf-8?B?K1ZZMEJaMTFUQzlLTlF0NmRaSUg1a0pPekNBWklsMVoxSG9iVXNkclo1eEZz?=
 =?utf-8?B?WnlxbklYZ25jT0FodTIrbVhYc0tsaTltbUlrUzVsTDBnWlRyOVlxMmREd2sv?=
 =?utf-8?B?RXB0Z1Y0Ui9tS2E5UVlUdk9kdnMxMG5MMW1IMHFWclRUN3ZqZHNGVXBkMG0r?=
 =?utf-8?B?QU42clRESTA3ZlVHOG83L0NWc2V2VmxJSGxPa3JDTkZKcFFhUUViQjdqWjNQ?=
 =?utf-8?B?WDFLWnJWRFNidWZPcHlYSTBRUXB5TnFuaElKSE54U3MzdVZvdlFtejRHV01Q?=
 =?utf-8?B?QlFyYldDTkFlNXFndHIrUVcyeThMSFdIZnd1T2tCSVBId1NpM2dxcGlzZXg2?=
 =?utf-8?B?TXlBeDBvZ0Rudk1yRUtZdzRCY09yUi9hcDZXZ1lFclNpdlJlVXZMUytwZEl6?=
 =?utf-8?B?Y3lIb21lZFhTbnhpRUYxNE1EMG9oQUtFSDZTbXVuRG5JdS81cGFCRjhnZWRF?=
 =?utf-8?B?QzVPa2dkYnRpQS9vNXhZR0gxWTBTQXhPUjBsNFBLc0xjZEpkbXJZSjlsbk1K?=
 =?utf-8?B?bmE3aDByR256NVNvL1B1bytVMVR3VWVHL2thYUFxTzBEVnVwNjM2SFJFMjZB?=
 =?utf-8?B?ZUtCaG4zbFBHaGY1amQ0ZFBUbi9JcUtONE5UNTF5d2RPd3F5Q1QvNXlVaXhV?=
 =?utf-8?B?cFY1bU84a2hwWGVtQzVWRUptY2FaM3hQZkNYL3c4U3lhbWJucm1vQ0dLTkdK?=
 =?utf-8?B?cHA5bzY5VW5OVVFZVWE3ZENJNWFjdE1LdGh2clZyNCtGYWl5ZS9XbHNOSkJU?=
 =?utf-8?B?NVBNaVcwT2lQa3hoakNEWjNnTEhoTm1WUHhUYlYyWjBkcXg1bEtudnhPYWxV?=
 =?utf-8?B?T3p5TVVRYjlIOHZGSnBFWTlGdVN0eHpMaXpGYk9HanpKR1g4TlJ4bDhLTElF?=
 =?utf-8?B?cWpUY014LzBMOUpEWSs4alFGSGxVL2xhUzB4UzU3RnE5eCs2RlBjWlNzai8x?=
 =?utf-8?B?cTFVZ3ZLcm9seXJBWlNKM1c4ZDB4cS9hM1V6TUVNOS8xdmc5VXRnZEVBVTEz?=
 =?utf-8?B?YlBaUVMvN1hYdGRxVitaeDBURVJnUUg0akJJQ0pzcjRSNHVKTU9ZU0xJTlBi?=
 =?utf-8?B?NzJrMzFnLzEzZ2lJU3NNb1NoelN0ZW9NNU15d3luUVNlSzJtclhYenJDczZO?=
 =?utf-8?B?Qnhmc3JjQ0FJYVFJUk1JQzJzb055YnUxeVF2SWdMVmY4TFZMZExidXJtSTU5?=
 =?utf-8?Q?AuiE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461e1fa2-ca9d-489a-fc30-08dbcbb73ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 06:40:09.8261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F/RuEEh1ct65DX51MONR2JyT1hVF83cQrPllpj1E+qGYD8g+nL3asZ0LwlBtMe2xhavsJTAepBjeU7zWru6CFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgT2N0b2JlciAxMywgMjAyMyA2OjQ4IEFNDQo+IA0KPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBh
dCA3OjM34oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZTo+DQo+ID4g
QXMgTWljaGFlbCBzYWlkLCBzb2Z0d2FyZSBiYXNlZCBuZXN0aW5nIGlzIHVzZWQuLg0KPiANCj4g
SSd2ZSBwb2ludGVkIG91dCBpbiBhbm90aGVyIHRocmVhZCB3aGVuIGhhcmR3YXJlIGhhcyBsZXNz
IGFic3RyYWN0aW9uIGxldmVsDQo+IHRoYW4gbmVzdGluZywgdHJhcC9lbXVsYXRpb24gaXMgYSBt
dXN0Lg0KPiANCj4gPiBTZWUgaWYgYWN0dWFsIGh3IGJhc2VkIGRldmljZXMgY2FuIGltcGxlbWVu
dCBpdCBvciBub3QuIE1hbnkgY29tcG9uZW50cyBvZg0KPiBjcHUgY2Fubm90IGRvIE4gbGV2ZWwg
bmVzdGluZyBlaXRoZXIsIGJ1dCBtYXkgYmUgdmlydGlvIGNhbi4NCj4gPiBJIGRvbuKAmXQga25v
dyBob3cgeWV0Lg0KPiANCj4gSSB3b3VsZCBub3QgcmVwZWF0IHRoZSBsZXNzb25zIGdpdmVuIGJ5
IEdlcmFsZCBKLiBQb3BlayBhbmQgUm9iZXJ0IFAuDQo+IEdvbGRiZXJnWzFdIGluIDE5NzYsIGJ1
dCBJIHRoaW5rIHlvdSBtaXNzIGEgbG90IG9mIGZ1bmRhbWVudGFsIHRoaW5ncyBpbiB0aGUNCj4g
bWV0aG9kb2xvZ3kgb2YgdmlydHVhbGl6YXRpb24uIA0KV2Vla2VuZCBpcyBjb21pbmcuIEkgd2ls
bCByZWFkIGl0Lg0KDQo+IEZvciBleGFtcGxlLCBuZXN0aW5nIGlzIGEgdmVyeSBpbXBvcnRhbnQg
Y3JpdGVyaWENCj4gdG8gZXhhbWluZSB3aGV0aGVyIGFuIGFyY2hpdGVjdHVyZSBpcyB3ZWxsIGRl
c2lnbmVkIGZvciB2aXJ0dWFsaXphdGlvbi4NCj4NCg0KSW4gbXkgcmVhZGluZyBvZiBhIGxlYWRp
bmcgT1MgdmVuZG9yIGRvY3VtZW50YXRpb24sIEkgbGVhbnQgdGhhdCBPUyB2ZW5kb3IgZG8gbm90
IHJlY29tbWVuZCBuZXN0ZWQgdmlydHVhbGl6YXRpb24gZm9yIHByb2R1Y3Rpb24gYXQgWzFdLg0K
U25pcHBldDoNCiJJbiBhZGRpdGlvbiwgUmVkIEhhdCBkb2VzIG5vdCByZWNvbW1lbmQgdXNpbmcg
bmVzdGVkIHZpcnR1YWxpemF0aW9uIGluIHByb2R1Y3Rpb24gdXNlciBlbnZpcm9ubWVudHMsIGR1
ZSB0byB2YXJpb3VzIGxpbWl0YXRpb25zIGluIGZ1bmN0aW9uYWxpdHkuIEluc3RlYWQsIG5lc3Rl
ZCB2aXJ0dWFsaXphdGlvbiBpcyBwcmltYXJpbHkgaW50ZW5kZWQgZm9yIGRldmVsb3BtZW50IGFu
ZCB0ZXN0aW5nIHNjZW5hcmlvcy4iDQoNClsxXSBodHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL2Rv
Y3VtZW50YXRpb24vZW4tdXMvcmVkX2hhdF9lbnRlcnByaXNlX2xpbnV4LzgvaHRtbC9jb25maWd1
cmluZ19hbmRfbWFuYWdpbmdfdmlydHVhbGl6YXRpb24vY3JlYXRpbmctbmVzdGVkLXZpcnR1YWwt
bWFjaGluZXNfY29uZmlndXJpbmctYW5kLW1hbmFnaW5nLXZpcnR1YWxpemF0aW9uDQoNCjJuZCBs
ZWFkaW5nIGh5cGVydmlzb3IgbGlzdGVkIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiB0byBiZSBub3Qg
dXNlZCBmb3IgInBlcmZvcm1hbmNlIHNlbnNpdGl2ZSBhcHBsaWNhdGlvbnMiLg0KDQpJIHdhbnQg
dG8gcmVwZWF0IGFuZCBlbXBoYXNpemUgdGhhdCBJIGFtIG5vdCBpZ25vcmluZyB0aGUgbmVzdGVk
IGNhc2UuDQoNCkFuIGV4dGVuc2lvbiBmb3IgbmVzdGluZyB3b3VsZCBiZSB0aGUgVkYgcHJlc2Vu
dGVkIHRvIHRoZSBndWVzdCBpdHNlbGYgd2l0aCBTUi1JT1YgY2FwYWJpbGl0eSBjYW4gd29yayBh
c19pcyBhcyBwcm9wb3NlZCBoZXJlLg0KTWljaGFlbCBwcmVzZW50ZWQgdGhlIGlkZWEgb2YgdGhl
IGR1bW15IFBGLCB3aGljaCBpcyB0byByZXByZXNlbnQgdGhlIFZGIGFzIGR1bW15IFBGIHdoaWNo
IGNhbiBkbyB0aGUgU1ItSU9WIHdpdGggb25lIFZGLg0KWW91IG5lZWQgdGhlIHN1cHBvcnQgZnJv
bSB0aGUgcGxhdGZvcm0gdG9vLCBJIGd1ZXNzIFRDIGNhbiBleHRlbmQgaXQuDQpNYXkgYmUgYSBk
aWZmZXJlbnQgaW50ZXJmYWNlIG1vcmUgc3VpdGFibGUgZm9yIG5lc3RlZCBjYXNlIHdoaWNoIGRv
IG5vdCBoYXZlIHBlcmZvcm1hbmNlIG5lZWRzLg0KDQpIb3cgYWJvdXQgYSBuZXN0ZWQgdXNlciB0
byBoYXZlIEFRIGxvY2F0ZWQgb24gdGhlIFZGIHNvIHRoYXQgbWVkaWF0aW9uIHN3IGNhbiBvcGVy
YXRlIGFkbWluIGNvbW1hbmRzIG92ZXIgc2VsZj8NCkRldmljZSBtb2RlIGNvbW1hbmRzIHdpbGwg
bm90IGJlIGFwcGxpY2FibGUgdGhlcmUsIGluc3RlYWQgc29tZSBvdGhlciB0aGluZ3MgdG8gYmUg
ZG9uZS4NClNvIG5vbiBwYXNzdGhyb3VnaCBtb2RlIHNvZnR3YXJlIHBvc3NpYmx5IGNhbiBtYWtl
IHVzZSBvZiBpdD8NCg0KPiBUaGF0IGlzIHRvIHNheSBmb3IgYW55IENQVS9oeXBlcnZpc29yIHZl
bmRvcnMsIHRoZSBhcmNoaXRlY3R1cmUgc2hvdWxkIGJlDQo+IGRlc2lnbmVkIHRvIHJ1biBhbnkg
bGV2ZWxzIG9mIG5lc3RpbmcgaW5zdGVhZCBvZiBqdXN0IGFuIGF3a3dhcmQgMiBsZXZlbHMgKGJ1
dA0KPiB3aGF0IHlvdSBwcm9wb3NlZCBjYW4gbm90IHdvcmsgZm9yIGV2ZW4gMikuDQpIdWgsIHNv
bWUgbWlzc2luZyB0ZXh0IGZvciBjb3JuZXIgY2FzZSBhcyBtYWtpbmcgY2xhaW0sIF9ub3Rfd29y
a2luZyBpbiBub3QgYSBoZWFsdGh5IGRpc2N1c3Npb24uDQoNCj4gRm9yIHg4NiBhbmQgS1ZNLCBh
bnkgbGV2ZWwgb2YNCj4gbmVzdGluZyBoYXMgYmVlbiBkb25lIGZvciBhYm91dCAxMCB5ZWFycyBh
Z28uDQo+DQpJIGRpZG7igJl0IGZpbmQgaHcgZm9yIFBNTCBzdXBwb3J0IGluIHg4NiBmb3IgTiBv
ciAzIGxldmVsIG5lc3RpbmcuIERpZCBJIG1pc3M/DQpJIGRpZG7igJl0IGZpbmQgaHcgZm9yIG5l
c3RlZCBwYWdlIHRhYmxlcyB1cHRvIE4gbGV2ZWwgd2Fsa2luZyBvbiB0aGUgUENJZSByZWFkL3dy
aXRlcyBpbiBhbnkgY3B1LiBEaWQgSSBtaXNzPw0KSGF2ZSB5b3Ugc2VlbiBuZXN0aW5nIGluIGh3
IHdvcmtzIGF0IE4gbGV2ZWw/DQoNCj4gRm9yIHZpcnRpbywgaXQgY2FuIGRvIGFueSBsZXZlbC4g
U28gZGlkIGZvciB2aG9zdC92RFBBLiBGb3IgZXhhbXBsZSwgSSB1c3VhbGx5DQo+IGRldmVsb3Ag
YW5kIHRlc3QgdmlydGlvL3ZEUEEvdmhvc3QgaW4gYSBuZXN0aW5nIGVudmlyb25tZW50Lg0KPiAN
CkdyZWF0Lg0KQ2FuIHlvdSBzaGFyZSB0aGUgcGVyZm9ybWFuY2UgdGVzdCByZXN1bHRzIHJlbGF0
aXZlIG51bWJlciB3aXRoIDIgYW5kIDMgbGV2ZWwgbmVzdGluZyBjb3ZlcmluZyB0aGUgY3B1IHV0
aWxpemF0aW9uLCBsYXRlbmN5Pw0KDQo+IFRoYW5rcw0KPiANCj4gWzFdIGh0dHBzOi8vZGwuYWNt
Lm9yZy9kb2kvcGRmLzEwLjExNDUvMzYxMDExLjM2MTA3Mw0K

