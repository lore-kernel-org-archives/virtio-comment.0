Return-Path: <virtio-comment-return-8055-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217D5C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 05:17:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 650522B06F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 05:17:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 391BC986B6C
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 05:17:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 196AA986B60; Tue, 31 Oct 2023 05:17:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 05B10986B61
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 05:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhFlWKbe8ouXbeXVhfPPWGdVQTkYCVjOV2c8eBOGXGpdwy0bbmEwqRY4OFZA+gBJ+I5WgvrggDJ0+83hHdvDWL1Q0roGOOvt6jp1zT5nB/YgmUAEGA5Jj2kjtb81C+DTg2p1byI68CmJOgtina0CdHcgCmrHDOAFai4INwN3lGy65epaisFkGAsDcUEAmyGPu43YloCbTpDAqmCbotyfdCB8n3iAKPODj1ZhBFA2TjsggHSYIhyj2Gp0f9rajnl+OjYIaW97QisBayRNR6IUr5TjMzn/usXgqZYaFznvzFBulyjQMJ76R6N9deGOllUQJ4nthm0beMYSzOG6ofpHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHo0TSwkdb35q5QArn0AjeeIvnjD7VQlSR83d5CwGn8=;
 b=gUyS0/8sBkZGFRFy7GosKDv1ivUsSAU6N9ZloQPXSsBl+2BrkJCwGou90tfnfn7Vl1cN3oj2NipEEh7/Tqr3lyf8ODwfP1SLSh3QipKOHcbXRznNUpuQ8o73LhGeChAvv0bEKPa7CfR/K5wG7+rio+Nw4SwHw7vLhu149unnazrR6PP+NXF2e2MN41Tf6dY36LDDELUMoDspIiZHqFQvMaB8X5kn1pb+Ncxt+obfdjqQXP5abQNA+0ICUUTSgaRSz1d34PUrFSpnVNq4z0SZ9XmO12l4cllb+v5eCfQJQ1v1a6M4oyi76Vs9IgwjeRGRv871ivyTVBtCW69mPCHeBQ==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQgAZNdoCAAAPWsIABZTAAgAA9LXA=
Date: Tue, 31 Oct 2023 05:17:34 +0000
Message-ID:
 <PH0PR12MB5481F7BE5C7F4430D1F26B06DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
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
In-Reply-To:
 <CACGkMEsC9F0SY=ydOSe+nV11L7d2t1Ypzr6nz_UoUc3w632VUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB8552:EE_
x-ms-office365-filtering-correlation-id: a431baf6-a7d0-470b-feb1-08dbd9d0b0a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DAGe9BCYHQU1oE1I9LtiiehjVkSrCKqjoBe2wliuAu/7BqKW7NGpEfJgpsjvX+U6PkvdSKn6joZODeXmqcVjaVnf4DIYkzmKTw3WfK+Rd8p6xnoYAl/Kd1+doM0w7Js1SbCDaLjq0+gM+vYMaiS4spt5RE1+QDqxuotkWFo4OaWg6eEFuRpibFkHLD5sGar8AulNwo841X/ZMzybhFujrZc9bgqoGN1CbHM+BAKexhmY6J05sSjrkcNFJyJGcJOckQx4OJSlYYDt6hTW4WrkuZihs5WjQebUsLn19RSVvze84JYHLcJNtNAzOSiszxpeVp5nU9HT/pMfyjpd/7KhTsSqRn+xaxkyrJ8kmYkwdiDEBiJ2GNV+Cu2OHxqrLb6cbqnk9B//UPMHNyWRn1Lj7Q0v0K4yb4BXysRvIn+86yH0LWpt+JCEV5Xpe7QXMP4kQADVLnU0LpXDPxvZjRMi02aDY4yO+KVF88tWeVQeQdGpAiFpHdPymWLgC8FLBVXeaI6RejuRwOSOlHpniUVLLSFaRXuLwdh/7WQEfIeGnnjP7npAq2sWBai+7adI4y0si4L+BSboeKKLkKFPPteIENQqumcw4zgLc98WajCo2NXUW2pm80eY0JmEUeAbPsCUPtBUkzL/Rh/oUB4ldavOyuA0Foqrns1P+VvBBhYOb9Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(26005)(9686003)(45080400002)(7696005)(53546011)(478600001)(107886003)(6506007)(71200400001)(5660300002)(2906002)(64756008)(41300700001)(76116006)(66556008)(66946007)(66476007)(966005)(8936002)(8676002)(52536014)(66446008)(6916009)(54906003)(4326008)(316002)(38100700002)(122000001)(86362001)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTRPWEVQcW1YWjJsQlNiVGc0ZXVkbUgxL1NCdm5LN1lVZloyQzZ5TmdjOUZS?=
 =?utf-8?B?WFV0UXhQbC81SHIyQVNxbG02OXdkSzZQdE5POUNvcHZTU3dEM2F6T08yaFQ4?=
 =?utf-8?B?UDlVL0hPYiswbCsxZXg4VHJyalp6ZWl6WFI2ZjZidm11TzhwdXdvblAyNGVD?=
 =?utf-8?B?Um1EcVdIdjQxejRaVkhiY2sxemc0RTQ3elVGWDZYUWw4MkFnMDlxc1BUZFhF?=
 =?utf-8?B?eXFNWkN2NGFMT2NPRWVCM2szTXc3Z3k0cnJRdU1ZaEYwT3FXc0FqSkR4U1B1?=
 =?utf-8?B?SUVjZ1JpUFdSVUROSXhXQ2RLa3NpTW5Od1JuUEJGZ29CanpNODNsWFZlbUFU?=
 =?utf-8?B?MEJaK1JtalQrR2hUQU1qNnFTMGNxOFU3YW45MVBEZ1lHU0oycHdhZG45YnBP?=
 =?utf-8?B?dVlWanRGMVdQUFhjQ1NEb0k0NGNPM1RydEJTNzlCRWpyNllwNlNXSHlTQVhH?=
 =?utf-8?B?S1FLNnUyOVduNDcyMEg4RkI1UmRqdHhwT0x1VEtlbHMwcHlmZXBwd085UVpD?=
 =?utf-8?B?d3gvWVFQaTNXcTdIWVRMMk5HQURTWGk0VTFaWHB0cnRlUkYwNUl0VHBtQXJl?=
 =?utf-8?B?a0tHWFh3TEFyZnhLTElzU3VuT2ZhZ2hMWVNDN2N3MG5DU09BV3JKenpOVlJx?=
 =?utf-8?B?VjJQNTY4djhqVi9iTEFVRVZkZzR1VnBXZXBTbnhOa1I5Mnc1YUt0RlBvZ1Ra?=
 =?utf-8?B?ZHZnK0hRd2Y1T1Q2c2ZFRWF1eDJGYWN6WllITEQweDZNNzl5YWd5NnE4d3Mv?=
 =?utf-8?B?RkV0ejdoSHh6TG5FYXdnMTZrMTVYWXpkV0VkazVQM1pDQTN0SzhDSHA4MmM5?=
 =?utf-8?B?TXUrU2JjSW9sRFFKbW1yWUlLY0JHNzBjeThLa2tweWJ2REpDUzZJUVRyMXJv?=
 =?utf-8?B?TzN5MmlwaVFBTW9DbWlOZlVIaHNqaVdXQTkwemJXN2tGa1F1TXhEcVVGZEI1?=
 =?utf-8?B?VzlscFRoR0grc0k3ZVRqdVltTzZWWFpjV09mSVFhVlAvc1JtSGtzamR2bGg1?=
 =?utf-8?B?dVNocTMxRmVOQXhZbFgwRnBWcnRuL1d4d3pQSUNJb2h0S3B3Q20zUEQxUWtK?=
 =?utf-8?B?UUNaVFQySFFjelFVYjByUnlpRjZBZGlLNGM5ZldFUVBIWFp2Qlg0R1prN0NE?=
 =?utf-8?B?U2lvd2pMSW1PWjd1a2FXQ3hsWG1CWVpNMWpnNDZvb0h0cmU0S1d3NWdIcUJZ?=
 =?utf-8?B?U2dJNWlCSWpHOXd6Z0VWSDMxUStqcTQ1K3pIQlRyRzdhalNxRVFtUzRHZS9o?=
 =?utf-8?B?d1NPSzU3dmkzRmNUaHc4dTFmWmhxS3dVRkNBcEVBUmZieVh3d1V0TVZ5aVla?=
 =?utf-8?B?UTZZczJWTXZieWtGR3VNdGJEZ1FXRmJBUXBLL1U1MFUzT21QOE5ORWVYL0JG?=
 =?utf-8?B?TDVUZUswWjBzUmkxdDFPRlFQekhaQnhrNGlCcmJGQ2JaZ2w1eGZkTURvbEhM?=
 =?utf-8?B?TU1zZDA0QlIwdVFReDNDaE9EOGt6WTh5VE5odXo1Z1p6VERNUE1YejJwOGhp?=
 =?utf-8?B?aXIzRklOMEhrQyswUzI0T3l6YmJ3QXc2K3dpUmx5ckkvUldnbVVFUW83Nnk1?=
 =?utf-8?B?NW9lQnEyOXd0bTRNNDdUSzhTOWo1VXJVdTRRVW1TKzdkdUlLTzVOK1I2cmNs?=
 =?utf-8?B?RnZQcEZXSTcyQVI3aFE0YS9oblR6U1h4b2hOZlgzQjZvR0NIZGwvRXMwcUZ3?=
 =?utf-8?B?Rm9CNW9mZVpoK0NiaDE1dG9BTjJRZlYyMDhYRTkxdzhkWmRSVThnTmpXWklZ?=
 =?utf-8?B?ZkozWWwxRkdyNVdFQ1B2czZBSEpvdjFpM1pxOTdOT2xLblhDNTFQUFlwUzBK?=
 =?utf-8?B?eXpsRjRBYytvNldsemVCaTdQNFZ4TmxkUkRjV2czNy9YdzNLZFdjWDl1UlNl?=
 =?utf-8?B?KzY1YXlKaDZQYlZzN0F6ekYxNVcwbEU5emQrdFhsQ0hZb1VkNUlsR2RaVmFl?=
 =?utf-8?B?blQ4cDl1TDI1NGQxVXZxMzdtaXh2NEx1ay8wdnlVdmJOTUthMkNQZEFxYTlm?=
 =?utf-8?B?cHRnaER5L2dOMGh1STQxbGlud3RUV1MxZjU4U2FyYlNqL1YxVGlueGNHalhS?=
 =?utf-8?B?QlhwdE5UV2VZVDBrbHNlanlycFEwWmRValF5dHk5MzhyWStrdnJDYWJ2TnU5?=
 =?utf-8?Q?xJQY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a431baf6-a7d0-470b-feb1-08dbd9d0b0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 05:17:34.2741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLiRqeMwAW4dF3Sp4YoxD8/jyCIijusY0AY0sYH3cfY/6Zv0r2z6bzZKPTmq+C3beB1ClA0IdYWO6+0/A7Zo7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIEphc29uIFdhbmcN
Cj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAzMSwgMjAyMyA3OjA3IEFNDQo+IA0KPiBPbiBNb24s
IE9jdCAzMCwgMjAyMyBhdCAxMjoyOOKAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAzMCwgMjAyMyA5OjM1IEFNDQo+
ID4gPg0KPiA+ID4g5ZyoIDIwMjMvMTAvMjYgMTE6NTAsIFBhcmF2IFBhbmRpdCDlhpnpgZM6DQo+
ID4gPiA+PiBGcm9tOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+ID4g
Pj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIEph
c29uIFdhbmcNCj4gPiA+ID4+IEZvciBleGFtcGxlLCB5b3Ugc3RpbGwgaGF2ZW4ndCBzdWNjZWVk
ZWQgaW4gZGVmaW5pbmcgcGFzc3Rocm91Z2guDQo+ID4gPiA+IEl0IHdhcyBkZWZpbmVkIG9uIDE5
dGggT2N0IGluIFsxXS4NCj4gPiA+ID4gV2hhdCBwYXJ0IGlzIG5vdCBjbGVhciB0byB5b3UgaW4g
ZGVmaW5pdGlvbiBvZiBwYXNzdGhyb3VnaCBkZXZpY2U/DQo+ID4gPiA+DQo+ID4gPiA+IFsxXQ0K
PiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tDQo+ID4gPiBjb21tZW50L1BI
MFBSMTJNQjU0ODFFQTZBNEQwQzY0QzVBRjZEM0ENCj4gPiA+ID4gNTdEQ0Q0QUBQSDBQUjEyTUI1
NDgxLm5hbXByZDEyLnByb2Qub3V0bG9vay5jb20vDQo+ID4gPg0KPiA+ID4NCj4gPiA+IExldCBt
ZSBjb3B5LXBhc3RlIGl0IGFnYWluOg0KPiA+ID4NCj4gPiA+IEZvciBleGFtcGxlLCBhc3N1bWlu
ZyB5b3UgYXJlIGNvcnJlY3QsIHlvdSBzdGlsbCBmYWlsIHRvIGV4cGxhaW4NCj4gPiA+DQo+ID4g
PiAxKSB3aGF0IGlzIHRyYXBwZWQgYW5kIHdoYXQncyBub3QsIG9yIHdoYXQncyB0aGUgYm91bmRh
cnkNCj4gPiBQYXNzdGhyb3VnaCBkZWZpbml0aW9uIHdhcyByZXBsaWVkIGZldyB0aW1lcy4NCj4g
PiBPbmUgb2YgdGhlbSBpcyBoZXJlLA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRp
by0NCj4gY29tbWVudC9QSDBQUjEyTUI1NDgxRUE2QTREMEM2NEM1QUY2RDNBDQo+ID4gNTdEQ0Q0
QUBQSDBQUjEyTUI1NDgxLm5hbXByZDEyLnByb2Qub3V0bG9vay5jb20vDQo+ID4gSSBkb27igJl0
IGtub3cgd2hhdCB5b3UgbWVhbiBieSAnZXhwbGFpbicuIFdoYXQgZG8geW91IHdhbnQgdG8gYmUg
ZXhwbGFpbmVkPw0KPiA+IFdoYXQgaXMgdHJhcHBlZCBpcyBsaXN0ZWQgaW4NCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy92aXJ0aW8tDQo+IGNvbW1lbnQvUEgwUFIxMk1CNTQ4MUVBNkE0RDBD
NjRDNUFGNkQzQQ0KPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9kLm91dGxv
b2suY29tLw0KPiA+IFdoYXQgaXMgbm90IHRyYXBwZWQgaXMgYWxzbyBsaXN0ZWQgaW4NCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tDQo+IGNvbW1lbnQvUEgwUFIxMk1CNTQ4MUVB
NkE0RDBDNjRDNUFGNkQzQQ0KPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9k
Lm91dGxvb2suY29tLw0KPiA+IFNvIHdoYXQgbW9yZSBkbyB5b3Ugd2FudCB0byBleHBsYWluIGlu
IHRoZXJlPw0KPiANCj4gWW91IGV4cGxhaW5lZCB0aGF0IE1TSS1YIGlzIHRyYXBwZWQgYnV0IG5v
dCB0aGUgb3RoZXJzLiBQZW9wbGUgbWF5IGtub3cgd2h5Lg0KPiBvciB3aGF0J3MgdGhlIGJvdW5k
YXJ5IHRvIGNob29zZSB0byB0cmFwIG9yIG5vdC4NCj4gDQpJZiBhIHBsYXRmb3JtIGNhbiBzdXBw
b3J0IHdpdGhvdXQgdHJhcHBpbmcsIGl0IGNhbiBiZSBhdm9pZGVkIGFzIHdlbGwgYW5kIGNhbiBi
ZSBhZGRlZCBpbiB0aGUgZnV0dXJlLg0KDQo+ID4NCj4gPiA+IDIpIGlmIHRoZSBoeXBlcnZpc29y
IGlzIG5vdCBkZXZlbG9wZWQgd2l0aCB0aG9zZSBhc3N1bXB0aW9ucywgdGhpbmdzDQo+ID4gPiBj
YW4gd29yaw0KPiA+IFdoYXQgdG8gZXhwbGFpbiBpbiAjMi4gOikNCj4gPiBUaGluZ3MgY2FuIGV4
cGFuZCB3aGVuIHN1Y2ggaHlwZXJ2aXNvciBpcyBib3JuLg0KPiANCj4gU28gdGhlIHBvaW50IGlz
IHN0aWxsLCB0byBtYWtlIHlvdXIgcHJvcG9zYWwgdG8gYmUgdXNlZnVsIGluIG1vcmUgdXNlIGNh
c2VzLg0KPg0KV2hlbiBhIHVzZSBjYXNlIGFyaXNlLCBkZXZpY2UgY29udGV4dCBjYW4gYmUgZXhw
YW5kZWQuDQpObyBwb2ludCBpbiBtYWtpbmcgdGhpbmdzIG5vIG9uZSBpbXBsZW1lbnRzIG9yIG5v
dCBwcmVzZW50IGluIGh5cGVydmlzb3IuDQpUaGUgaW5mcmFzdHJ1Y3R1cmUgaXMgZXh0ZW5kaWJs
ZSBzbyBzcGVjIGlzIGNvdmVyZWQgZm9yIGl0Lg0K

