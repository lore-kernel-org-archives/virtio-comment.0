Return-Path: <virtio-comment-return-8074-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D4C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:07:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 051C82B06E
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:07:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6EA8986BB3
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 03:07:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE416981235; Wed,  1 Nov 2023 03:07:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADC31986BAA
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 03:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFpHam1KLFrY7E1Ig9zofGabYJou41noe5/5JmqcnYQTo59u1x/hBrslNosxVRsteMMLKTbfo8fGmaxV9x18M0oMTcvzPIu0/jlVAfpJrL1GA6B6wN5YPXvkHH7xFNx/+gHs7oyjU7Usi58ACehbl8oa7HSMBdbUfDCtQSesw1cW3DWBXt1Xuy6IKAEHU67maANMCXf3v83Ia2LapTL6gWQtNWws88sh0yP6keOkdu4qwXIyeaC0kfqJxCBrOUqxdzrri/qKNvlE03n4HTA9K4u/Af5BlhHFs8Ob1Mpj8YRUhgasoQvYQD7h2vpO2OvyNqkj0wDqCGuvy0Z7rbsk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+fIxW3XoXkUStDY5ihh6lC1e/INWq5b7edqapt+5to=;
 b=B5dKBBORPQhoffXEK4NM6yB/btRL2hQ3C1xbZlqtj0+ssZGC8SxTvreDldr/j9fTYo8nnX17XcO4FT212pmlIJ4AwccEph+O7UYD4ohjWme5fsq0xb1Lety/Oc8Sw6MNH2Y5wKLZCI0VM/nqqdcDi1oUbIb/uOf5evdjmlAAUfy4gvYW/rFDUnvVPwYE3qdtrJ6sNIWuQcJXZGUkmBva94lPfATQMxmJhEUWze4TdSrG+0g9cqGhJO/WSyGupeWF05+XMqBoOHvP8dlbuGNLsfBCV3WhOWAgwE+flhgpKA+hZDqS4NZs3PTwmfMyX4BUhFoRpowobZxptlSletzZxg==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQgAZNdoCAAAPWsIABZTAAgAA9LXCAAUN1gIAAKeEA
Date: Wed, 1 Nov 2023 03:07:11 +0000
Message-ID:
 <DM8PR12MB548082010AC006539B04CB16DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEt_HnZ26ZySCt8w58-OdH+UDzqveqZ2=LN3mK3Z3oy4EA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CYXPR12MB9339:EE_
x-ms-office365-filtering-correlation-id: ce511d7a-55b3-4cb0-573f-08dbda87a467
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 F5xfSna+Xn0kVg2saopQcHw864/bbz/bhMVoGryJ/5kezApH0rnKdfnoUtIG0KenMNgZhFtNgQ4pQGnsg8JFDWGFPzHqmCeI0zoVPdC9j80FJSr4/jlsSrmooLvgsf1WaWyQs4+wEB+7VjC9Iqv3Gph4DoiAcXz4x0+ZoK00kC5rO2pUAssyc/8zZIbIUmQoUatV2TBFyWHlKjPNCjehfcEPLDd808HNCuRPMOX/QAMqirBQJL25Mdwko9jRgplNNsH7WjwL2ORE31g1rtjPn8TK5PDVQ9rgwaimtb1DhN0KMnC1eRzkpkEeAQa4DlokDpSf76wNOpE/d83ImnwRMygT30L5bXqZtDmw4MxBKNvctC/Bcplb5fCBw9zPKY8iaI9ZGzY5Cfezg3giI7hZnG9kmybl0OwlbklCYSEHBQ1W39sYnrUKWjsJBdzEsQNR9Ate5dXZGJWjziTzTEKaAbFKJX/0m6Rtt0WvbJRpDVx42NWLbsBfn/xlZvfQH7bk8W9N7WMdiZXf2YmsnodL3Ev3fRVgHm4K0gR3BLrp8NRpVopJVKIWrOGDHRqkZSwt5wtG5M4hcdPAzpMpUNmDuxH0LfIglRkKt7u2xbF2tIQMTc6p3sdPK180jlzzsGmW6s2DK4nAWENrByqr2wWIpzj0DHMRdRYUAPrO+gACbf4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52536014)(6916009)(5660300002)(2906002)(76116006)(66946007)(66446008)(54906003)(64756008)(316002)(66556008)(66476007)(8676002)(966005)(55016003)(45080400002)(41300700001)(478600001)(8936002)(4326008)(71200400001)(53546011)(9686003)(26005)(7696005)(107886003)(6506007)(38070700009)(33656002)(122000001)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zm9MUlJ1ME5SU3NmYU93S3R0TloxSmZZaHJhZ1BEdFFvT3BlS3BEOGh4cnJC?=
 =?utf-8?B?UVNhd1d0TzgxaHlBNC9VUU9uQXVUOW5ZekF0cHEyNW84eUEyNFkxMVQ1VUln?=
 =?utf-8?B?aGdweUR5Y2N4akVDemRNYjI3N1JLUHp2KzkxSFh1YUI2ZU5QSUJBUTNtNE1y?=
 =?utf-8?B?NURtL3p5L1VlMUlDUGcyWE1XUEdyY21WWmJESTM1SEhleWZ4RmhDakxsejds?=
 =?utf-8?B?MGNyVVpuLzdveHdyejBPRUY3aXhCNlArQ0V0Q1Q4bkVrMlV3SFFRdlNnR2Yx?=
 =?utf-8?B?eXRkZlBRUmlTaE5LekpIdGk1SWVKMDVGT01abjArWE9Nd01kZU9pSWFocU0z?=
 =?utf-8?B?LzlrUXJaaTNOemFOOFFjNEhlYzZBcXFEVnA5WGpENkY0dVRGdFdOaUp5SzB4?=
 =?utf-8?B?TUMrZmZNRkdyeXdaSU1udm1UYjNmQnNqSmd2eVJPeVVuckJMcTRVL3l1K1RN?=
 =?utf-8?B?MU83a3lJNWNGTzRNbnhkUWhlZXFPRVJFc2JKOXdyaUF6RHM5cHJvODRabjlK?=
 =?utf-8?B?T0VZeGw1UFRmWFdPV1hDOFNWdDdrdFl2dThPN2FTQUdjM0JoZHlYRFZjcmZ3?=
 =?utf-8?B?VHN3UFYvK29hcThWd25XUUNHckFCM0xoK2YzTERCSGhoRnVRbFNOeGI0SGRj?=
 =?utf-8?B?WStFRzkxR0d6YXBTVVJFWVpuZkd2MjJ0cmN4emVYR0tpTFk0Z3VId2tpK290?=
 =?utf-8?B?cjk2eFNoSzFRdlFJT1ZnbEFweGVWSXpzU0IrZzNvVFBGUThodklqeXpPRW53?=
 =?utf-8?B?WGtqQjVEbzcwaS9rNjhlUWpZOGc3eHNqcXl6K2dXNDlhenBQc3RPME83bkRT?=
 =?utf-8?B?OFM4TDVZSFRWMUZNanowR21FL2pvajJ6SHVWMWVsOGIxcU1rT0R3bjFDanp3?=
 =?utf-8?B?dDYxOFBwV3ZLeUxmZ0VTaVpaZkVnYy9IQjBmanhYZWlQUzlnTmI3L1BVRE9T?=
 =?utf-8?B?dUxxV0VGeUZzVXhwblZtTndKME5BcC9LWlR3SGMwc29CNmFnRmVkdHB0QnFO?=
 =?utf-8?B?WFMrOGZVb3FMTGNvY3RxbFNLMHRmZXBFNGxmd2FzdEg3SVVvTU05RWtNaHk5?=
 =?utf-8?B?TGpMVVRORzR3enkycVl1Wk11VTR1ZjhzekZSOW82azg0UlNOOWdScFY4RXg3?=
 =?utf-8?B?VDN0UXZFM0pOeDVaN3BGeXlDMG5ZU2VGSnZObzM2Szh3RkJZTEF3TmZjTGdT?=
 =?utf-8?B?VkJwQ3FGbjVjOTE3WHlVcjAyeHpJVmVkT1dqS3JXN0ZIVGV4OUhCS2x1eGp6?=
 =?utf-8?B?S1ZsSEZGQnM3V0pGTEFlcHJmTjhDbmwzc2ZhWHNvS1BpZEQ3U0QrVHFHbllk?=
 =?utf-8?B?RlM0dlNObzIvN3h1QVpuMFZnR01XREVZOFphKy9HRkVMblZ6RWZlRVljd2Mv?=
 =?utf-8?B?aDhxMUJLUGRpZG01ZFpKZC8vV0dVZlJ4czhlOGZUY0VOTHYrc1lFSWcvbk44?=
 =?utf-8?B?LytoYW8wQkRPZHlBUzdpOTZNQzRDRGxCWEo5R29qM3YwdU9Nd0VZenE1U2Jt?=
 =?utf-8?B?WFhvaVhabGVMVHQwZlZHakkzRHVvMi9mSGJhVjBRYVRORm1TR2lhUktpNlZz?=
 =?utf-8?B?NTJhbHJYVHpTRFRIYURCM045cEFZWTAvTzZNTjQwOWlPdjNTQjIrK2hoU21O?=
 =?utf-8?B?a2lzbFJtS3pkZnBPZkZKNTRMdzhuUmhSNHVJSWYyNk5mbXNhT1lxYks2MUFF?=
 =?utf-8?B?c0VyUVlGR3l6WE9lcWZVR0w0ejNpUlFDMVN4MHhxRDZwL1VXRXVKTU41bjlp?=
 =?utf-8?B?VHNmQi9sWkYyNHN2c0NCWnNOa2VwVzgvTlp1MHByaHI5VTVCUDRaNjIrcWNi?=
 =?utf-8?B?dThqZ3NKcHZROXplUExYdjMvTDR3RHd4UmtaVVc1SVJnZDNJY2N6MjF2clBK?=
 =?utf-8?B?VUtYTHY2cFV5eEdEdUpaM3VOeWo3bWRjWkd4SHB3MWxSRktlc3M5anhPZHli?=
 =?utf-8?B?cWRnR2pRajRYVmV5Y1Q3b0hTczd3aDB5UDhKZHNidW55NUMxL1dwR2pqNjM1?=
 =?utf-8?B?SXRCbUszQlNvZi9UQlJTYm1jd2wzQjI1ZUgxVWhZanBGR0M3MTk2YjNDUkh1?=
 =?utf-8?B?WW1iNElEc2x3am16dmw1Z3ZVd1FjNzlnUUduV2VtbjJ1NGlFd251THZqQzdB?=
 =?utf-8?Q?r2aM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce511d7a-55b3-4cb0-573f-08dbda87a467
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 03:07:11.6510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bD5W6orXr+Jisv41Gvw5hVJyb7N7GLeopWbKwJs5yuGyetwPfE3h5tMZ3JWmD2C6RRNrB2pu1z2hzRiOKW1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBOb3ZlbWJlciAxLCAyMDIzIDY6MDMgQU0NCj4gDQo+IE9uIFR1ZSwgT2N0IDMxLCAy
MDIzIGF0IDE6MTfigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0K
PiA+DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Bl
bi5vcmcNCj4gPiA+IDx2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy0gb3Blbi5vcmc+IE9uIEJl
aGFsZiBPZiBKYXNvbiBXYW5nDQo+ID4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDMxLCAyMDIz
IDc6MDcgQU0NCj4gPiA+DQo+ID4gPiBPbiBNb24sIE9jdCAzMCwgMjAyMyBhdCAxMjoyOOKAr1BN
IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+
DQo+ID4gPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+
ID4gPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMzAsIDIwMjMgOTozNSBBTQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4g5ZyoIDIwMjMvMTAvMjYgMTE6NTAsIFBhcmF2IFBhbmRpdCDlhpnpgZM6DQo+ID4g
PiA+ID4gPj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gPiA+
ID4gPiA+PiA8dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYg
T2YgSmFzb24NCj4gPiA+ID4gPiA+PiBXYW5nIEZvciBleGFtcGxlLCB5b3Ugc3RpbGwgaGF2ZW4n
dCBzdWNjZWVkZWQgaW4gZGVmaW5pbmcNCj4gcGFzc3Rocm91Z2guDQo+ID4gPiA+ID4gPiBJdCB3
YXMgZGVmaW5lZCBvbiAxOXRoIE9jdCBpbiBbMV0uDQo+ID4gPiA+ID4gPiBXaGF0IHBhcnQgaXMg
bm90IGNsZWFyIHRvIHlvdSBpbiBkZWZpbml0aW9uIG9mIHBhc3N0aHJvdWdoIGRldmljZT8NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBbMV0NCj4gPiA+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3ZpcnRpby0NCj4gPiA+ID4gPiBjb21tZW50L1BIMFBSMTJNQjU0ODFFQTZBNEQwQzY0
QzVBRjZEM0ENCj4gPiA+ID4gPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9k
Lm91dGxvb2suY29tLw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBMZXQgbWUgY29w
eS1wYXN0ZSBpdCBhZ2FpbjoNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZvciBleGFtcGxlLCBhc3N1
bWluZyB5b3UgYXJlIGNvcnJlY3QsIHlvdSBzdGlsbCBmYWlsIHRvIGV4cGxhaW4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IDEpIHdoYXQgaXMgdHJhcHBlZCBhbmQgd2hhdCdzIG5vdCwgb3Igd2hhdCdz
IHRoZSBib3VuZGFyeQ0KPiA+ID4gPiBQYXNzdGhyb3VnaCBkZWZpbml0aW9uIHdhcyByZXBsaWVk
IGZldyB0aW1lcy4NCj4gPiA+ID4gT25lIG9mIHRoZW0gaXMgaGVyZSwNCj4gPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLQ0KPiA+ID4gY29tbWVudC9QSDBQUjEyTUI1NDgxRUE2
QTREMEM2NEM1QUY2RDNBDQo+ID4gPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5w
cm9kLm91dGxvb2suY29tLw0KPiA+ID4gPiBJIGRvbuKAmXQga25vdyB3aGF0IHlvdSBtZWFuIGJ5
ICdleHBsYWluJy4gV2hhdCBkbyB5b3Ugd2FudCB0byBiZQ0KPiBleHBsYWluZWQ/DQo+ID4gPiA+
IFdoYXQgaXMgdHJhcHBlZCBpcyBsaXN0ZWQgaW4NCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvdmlydGlvLQ0KPiA+ID4gY29tbWVudC9QSDBQUjEyTUI1NDgxRUE2QTREMEM2NEM1QUY2
RDNBDQo+ID4gPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9kLm91dGxvb2su
Y29tLw0KPiA+ID4gPiBXaGF0IGlzIG5vdCB0cmFwcGVkIGlzIGFsc28gbGlzdGVkIGluDQo+ID4g
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby0NCj4gPiA+IGNvbW1lbnQvUEgwUFIx
Mk1CNTQ4MUVBNkE0RDBDNjRDNUFGNkQzQQ0KPiA+ID4gPiA1N0RDRDRBQFBIMFBSMTJNQjU0ODEu
bmFtcHJkMTIucHJvZC5vdXRsb29rLmNvbS8NCj4gPiA+ID4gU28gd2hhdCBtb3JlIGRvIHlvdSB3
YW50IHRvIGV4cGxhaW4gaW4gdGhlcmU/DQo+ID4gPg0KPiA+ID4gWW91IGV4cGxhaW5lZCB0aGF0
IE1TSS1YIGlzIHRyYXBwZWQgYnV0IG5vdCB0aGUgb3RoZXJzLiBQZW9wbGUgbWF5IGtub3cNCj4g
d2h5Lg0KPiA+ID4gb3Igd2hhdCdzIHRoZSBib3VuZGFyeSB0byBjaG9vc2UgdG8gdHJhcCBvciBu
b3QuDQo+ID4gPg0KPiA+IElmIGEgcGxhdGZvcm0gY2FuIHN1cHBvcnQgd2l0aG91dCB0cmFwcGlu
ZywgaXQgY2FuIGJlIGF2b2lkZWQgYXMgd2VsbCBhbmQgY2FuDQo+IGJlIGFkZGVkIGluIHRoZSBm
dXR1cmUuDQo+IA0KPiBXaG8gaXMgZ29pbmcgdG8gZG8gdGhhdCBzeW5jaHJvbml6YXRpb24/DQpM
ZXRzIGZpcnN0IGJyaW5nIHRoYXQgaHlwZXJ2aXNvciBzdyBkZXNpZ24gYmVmb3JlIGRpc2N1c3Np
bmcgcGhhbnRvbSBwcm9ibGVtIHNvbHZpbmcuDQpBbGwgbmVjZXNzYXJ5IG1vZHVsZXMgd2lsbCBi
ZSBpbnZvbHZlZCBpbiBzeW5jaHJvbml6YXRpb24gZGVwZW5kaW5nIG9uIGhvdyBpdHMgZG9uZSBp
biBmdXR1cmUuDQoNCj4gDQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiAyKSBpZiB0aGUgaHlwZXJ2
aXNvciBpcyBub3QgZGV2ZWxvcGVkIHdpdGggdGhvc2UgYXNzdW1wdGlvbnMsDQo+ID4gPiA+ID4g
dGhpbmdzIGNhbiB3b3JrDQo+ID4gPiA+IFdoYXQgdG8gZXhwbGFpbiBpbiAjMi4gOikNCj4gPiA+
ID4gVGhpbmdzIGNhbiBleHBhbmQgd2hlbiBzdWNoIGh5cGVydmlzb3IgaXMgYm9ybi4NCj4gPiA+
DQo+ID4gPiBTbyB0aGUgcG9pbnQgaXMgc3RpbGwsIHRvIG1ha2UgeW91ciBwcm9wb3NhbCB0byBi
ZSB1c2VmdWwgaW4gbW9yZSB1c2UgY2FzZXMuDQo+ID4gPg0KPiA+IFdoZW4gYSB1c2UgY2FzZSBh
cmlzZSwgZGV2aWNlIGNvbnRleHQgY2FuIGJlIGV4cGFuZGVkLg0KPiANCj4gSXQncyBub3QgZGV2
aWNlIGNvbnRleHQuDQo+DQpJIGRvbuKAmXQgc2VlIHdoeSBub3QuIEl0IGlzIHN0b3JlZCBpbiB0
aGUgZGV2aWNlLg0KUmVtYXBwaW5nIHBhcnQgd2lsbCBiZSBoeXBlcnZpc29yIHNwZWNpZmljLCBz
byBpdCBtYXkgYmUgc3RvcmVkIGluIHBsYXRmb3JtIHNwZWNpZmljIG1pZ3JhdGlvbiBkYXRhLg0K
IA0KPiA+IE5vIHBvaW50IGluIG1ha2luZyB0aGluZ3Mgbm8gb25lIGltcGxlbWVudHMgb3Igbm90
IHByZXNlbnQgaW4gaHlwZXJ2aXNvci4NCj4gPiBUaGUgaW5mcmFzdHJ1Y3R1cmUgaXMgZXh0ZW5k
aWJsZSBzbyBzcGVjIGlzIGNvdmVyZWQgZm9yIGl0Lg0KPiANCj4gSXQgd291bGQgYmUgcHJvYmxl
bWF0aWMgaWYgeW91IHN0aWNrIHRvIGNsYWltICJwYXNzdGhyb3VnaCIgYnV0IG5vdC4NCg0KSSBk
b27igJl0IGtub3cgd2hhdCB0aGlzIG1lYW5zLiBJIGFtIG5vdCBkZWJhdGluZyBwYXNzdGhyb3Vn
aC9ub24tcGFzc3Rocm91Z2guDQpXaGF0IGlzIGluc2lkZSB0aGUgZGV2aWNlLCB3aWxsIGJlIHBh
cnQgb2YgZGV2aWNlLWNvbnRleHQuDQpXaGF0IGlzIHBhcnQgb2YgdGhlIHBsYXRmb3JtIGNvbnRl
bnQsIHdpbGwgYmUgcGFydCBvZiBwbGF0Zm9ybSBjb250ZXh0Lg0KU2luY2UgdGhpcyBpcyBnZW5l
cmljIHRvIGFsbCB0eXBlcyBvZiBQQ0kgZGV2aWNlcywgSSBkb27igJl0IHNlZSBhIG5lZWQgdG8g
b3Zlci1zb2x2ZSBpdCBub3cgaW4gdmlydGlvLg0K

