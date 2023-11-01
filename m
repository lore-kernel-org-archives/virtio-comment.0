Return-Path: <virtio-comment-return-8089-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BF4C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2C98A2AD55
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02E4F986BBD
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:55:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DB9B9986BB2; Wed,  1 Nov 2023 07:54:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB936986BB3
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 07:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOh4KUtdskPmMH2O+J5zKIoDSxDGPKUattfHRaHYqWAteXzYRbFzG600cg/+7XZLZPaFViNqJRvJRL9x+WVHdaA0l/Ox6zf7KUGPN1BFRlM4S3a7dGE+jdB67Mboebp/yp2rOPeUswO+G0GJQHbqiUvUnGpBN+HA+VmdQRgOYDz4y0lZBBvKuNKZCoZyG7qjk6L0u+HBHI5DD9MnqUgRkFhWv+T6VcE7pMJVjgVjr517RA8ZLcjuOTpK2kTKzUC3sXxba31FYmcWxR1aprTD3J8o1OZ/B/OpiVm8b01dzfOESyKzcPfbUdx+3US1PWDijaQUHhkLXxiXWJGdobJ0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjiHpC3KxhFzzHUNwuKH1ipfb4Iu1QADKLvvtE5A/3A=;
 b=MY2SF3cDF8gPpHbY7X8cMnnXx3xNXn7h4Fh//GajRKysmJrPzY+nS+YoSGUpk8W6EO8+dd94aGtp+dFlHcMHOccQE3W7ozIBgORqp4KUC7Oim3QxxxndpspXuluHzkQ1rA2dFrfAgp1jWo7VH+yxw0VK/6KyIPQqrWx1qxZ5AASk8ze3As49c5UdoYd51i5fUmhXtMUOXXD4d0duMJj5ipj5Fkoj1Gkvc1HmBl2c6237m0Jrv+BMhwwy+QFnLQU1ydvf5OA3kdDfMeNwmH9DTmXAcRl8oPoRxfXeb3RPdtfVxwH+IEVFmp+/582QQHlzP46DD6hDXVPcpKJbtKWz0w==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcIAAD/uAgAAAm4CAAAJmQIAAAjuAgAAAiKCAAA2bgIAAAiNg
Date: Wed, 1 Nov 2023 07:54:56 +0000
Message-ID:
 <PH0PR12MB54811086EF9D3E96628DEF02DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
 <PH0PR12MB54810FE590680689D3140911DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <534d3350-ebe8-42f0-a961-a9675c76f984@intel.com>
In-Reply-To: <534d3350-ebe8-42f0-a961-a9675c76f984@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYXPR12MB9340:EE_
x-ms-office365-filtering-correlation-id: a2322425-dca4-4ab3-9fb5-08dbdaafd73a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sr+fWZ+SqFr21N2IoP2vwpA4ndoVlzeNy5/gr6Ml6wuBobtt3LM85eRQ9mthmU0rNXuHtQYKeRs1fpr1tjlax7KSJuPzP/gUi57WCh6wTsiCh/tHDMWeq01Eq+K6UgW/84ci6iUfuG8eXXPGrY/TRVFq+zA/MtyXO4t4Kr4ui3XJ4rA8VLYZLQe2YxURDsyZ8dF4WjQIMMw96pDbgLQnY1yVuu3qYbwA9cGLKpyffHzZrH+9r+0t870O/8nB4Qr9G/sAjxnKtv+TQhrsXGEDNjA6smOJVdN8n8O4gcuj/oqpBXPr6pyVnQz7kMOq7HC1PXOvGz1imVi3ub1D4tfJRo0LNzQ5yfV9S2NcmIqJZRnC73SqrlqCRQaDYJNiSR2uA4TOEWU0jn58zA6RPWCxpTHG4dQ5mxXg+Qp0WzmhgZUa2q7hfXsZVGLOiRkMH05dCDsdN7diH8RZKzX/c73PLz+AHGchZT/ENYN5F0djglARGY/XtMWyAxCwNrkZL5z14YZ0OOjmCHRjizygxtEBNfPgMRsAsF2fSDeI61VqpNn0Bqi6fXoHvVcGOZRbpK61+DeN+ynatbQJfJOxIYdruBK3BuFqEdquUMgsyXZ9tEEwoPVxinc3LtN5Yq54QwP7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(107886003)(9686003)(2906002)(6506007)(26005)(64756008)(38100700002)(66476007)(5660300002)(76116006)(66556008)(66946007)(71200400001)(66446008)(316002)(110136005)(54906003)(4326008)(53546011)(478600001)(41300700001)(7696005)(8676002)(8936002)(83380400001)(52536014)(122000001)(86362001)(33656002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVo4cXVBMkRkaStnWVNSN0d1WUV2dHlESVJCYWUzcno0ZDNORzBmd0tWcHcr?=
 =?utf-8?B?YVhsMEFaS0lRaDZwaEt0RXR2M0tnZnhXSTRMY1VOdUk4NmxTb3crcnFhcktU?=
 =?utf-8?B?MzZEYlROdzJLeDRwQ3h6c1lYZEs3VlVUNnEwOVkrS3liM3pLcVEwVVR2N1Yr?=
 =?utf-8?B?b3ZyaVVGU0MyTGhzQm1wVEJwZms4Rzl2TGVkWUFCVmhEcXdEajFPZzU3VnhW?=
 =?utf-8?B?OUliaDdBeVlSeFkrSGI1NE8va1FQU1hZWldkK1pGSjlPOWtCZCs1T3NjaEZv?=
 =?utf-8?B?WUcvMjJHc1dXNmJnZmJlYUFXZWtCTERMZ3F6bnBsYVhOU1hsQUdsZzNJdE83?=
 =?utf-8?B?Tk1sTmlYdGxoSFBTR01mMmp2YjRlNHhSRVk4Q1RPbDVWeVhrdzJqaHR2bUx1?=
 =?utf-8?B?ZW5NQzZhQkZtYTRMa1B1dXM4SFB6dm8xVitjYnNoNVBGckRnU0FHRkpGNHZs?=
 =?utf-8?B?QXhYOGYvWWZaSE1DZU1rNGpmRExLL3VnbHRFSUhBYTI5RW9jMjNCdElXQzZM?=
 =?utf-8?B?cFVnZWNLT0ZNcTBIcXFHb1MwanJSMkVWQktUZ1BtKzAvUmVhRit1VFhoNTRq?=
 =?utf-8?B?NVdWeDExT05NbmNDanoxeGc1N3ozclRkdFFucVZneXdwZEQ5RDQyZUk2dWNv?=
 =?utf-8?B?VjBsczBQLzJmU2EzODVJN0VSTURkT2NzVWtWVnViUk9xcGtiWEtQM2FlcU5q?=
 =?utf-8?B?bTdoTkFTcmFDQTRua2JsVHRGL2R3c1hORk5yUVphcHZKTlBuRkJpd0dDMklp?=
 =?utf-8?B?NGFTTWVSblVQOFpoVnd1T1ZvKzFSRlZMMGVBODVFcGh5L2ZYWVo1UHh6YmMr?=
 =?utf-8?B?bzhUSlBZOE9Kd002UWNkVjJ6aDlsMzVrbjFMaGttR0hqZmVXaTBlNTY3QnRi?=
 =?utf-8?B?SjVlTzVhQXcyZTNMVk5RcnBJbXQ1bXpMU2NGbHlGdEFPYWRSNFZUeTVkVXJU?=
 =?utf-8?B?cFdGOWlGK2h1QnRmek44YnJrZjZpZEd4QTd1UUJPNGptUllBNER4OXB5Y3pD?=
 =?utf-8?B?TGZsTzYyODVVYjl4QjJVaXgvR1ZmdlJ0MUdPWXNoMUZKMzV1K2RsSDBqL2JL?=
 =?utf-8?B?WG43N1drZHkwUHBKYUdsMEpISDRqNis0bWRSTTRFcEtpNjdyV1lqekRPZnlY?=
 =?utf-8?B?U1ZjVzJVbm5ZUEp3V0MxdVVLRnc1eHN0cjNpeTFWQWpGNmIyUnI1bUhIbHVN?=
 =?utf-8?B?U3BrQ3JFQ3BEL3ppelpxVUNnQ2J6TDBMSmRjWmV2TEtBQ0V2L3pDaEEzc2Mr?=
 =?utf-8?B?UTJoNkNKTGFRblJFM0hSZkFOUEJJQ1VvSnl0Y25mR0syaCtOclpVM0lKUTky?=
 =?utf-8?B?eVpnWDBudEtSRFNDRDBJTE5abmFkNVd5QzJrQzUwVU5hVWhXWUM5VS82amJy?=
 =?utf-8?B?alpUNDR1SWVWcGk5MmJTNVhlL3dkTXdDVmduRG5UblpZanNFOUs3NzJGOVRl?=
 =?utf-8?B?ZHpyUkphVm9JZEN0aTNFbDVlRjdNN05hWWRnWkt0NkMrbS9OTnd2M0RFTFY5?=
 =?utf-8?B?RTV1SUIxQS9aeTNTbnpFS1I0UWZTdjl0NTJvUFdHL1F1MkIyUVA2b3FsZnVE?=
 =?utf-8?B?QjVRMTE0REhNcmxIYWIvUFV1eFkzbUlwOXMvUEFGWko4REJqdUtwQmJody94?=
 =?utf-8?B?U1NFSXVveDdUaGhKSWU2dnAzL1dmc08rNWF1ZFA1eERsL1dLNnYxb2NDZi83?=
 =?utf-8?B?elpCOE8rbExQQUpPRTRBY0ViUFVRcTJtWFgweEhCOCtQSlVwOTFTWVc4eHZD?=
 =?utf-8?B?TGw4a1VldkJBY21Md1F1R0l5NmowVnpEZTFuK1I2aEoya0VXakcvOWFQSWoz?=
 =?utf-8?B?RS8vU05vY3ZORE9lV2M2WTZKa0tFUlBIMEJtdjRsYjN6N3BtU1VKTEV2NHdJ?=
 =?utf-8?B?NUVzdUtia04xOUJtdkd3SmVMbVR3T1czUjUyOEQxT2FJbEZ1M29aeVRtZjNL?=
 =?utf-8?B?ZFhwdC9sV1Q0QnpTUUFuT3pmVHpiT01qRUs0eWhsSjRZbC9sM1BiYkF0clB2?=
 =?utf-8?B?R2VSelQzU0JvakphYUMydXJ4Wm5HRjJEOXZoNVpOZVRzZ2JVZElIUGVKTzhy?=
 =?utf-8?B?K05ROUo0SXFOODZzcitTbWtOK0IyOTEzZmQveEtBOXBZZ1NCSjhCc1dML3dQ?=
 =?utf-8?Q?cQq4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2322425-dca4-4ab3-9fb5-08dbdaafd73a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 07:54:56.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2eHsJSwHXE+CpVgsqhIcSJ0LfnnLsIt9g4Inr2y/txb8RTpZ94VIhe5XJStPJ/oxUdLxaoZtEAagyKIuFZB9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgTm92ZW1iZXIgMSwgMjAyMyAxOjE3IFBNDQo+IA0KPiBPbiAxMS8xLzIwMjMg
MzowMyBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IFpodSwgTGluZ3No
YW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1i
ZXIgMSwgMjAyMyAxMjoyNiBQTQ0KPiA+Pg0KPiA+PiBPbiAxMS8xLzIwMjMgMjo1MCBQTSwgUGFy
YXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpo
dUBpbnRlbC5jb20+DQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxLCAyMDIzIDEy
OjA5IFBNDQo+ID4+Pj4NCj4gPj4+PiBPbiAxMS8xLzIwMjMgMjozNyBQTSwgTWljaGFlbCBTLiBU
c2lya2luIHdyb3RlOg0KPiA+Pj4+PiBPbiBXZWQsIE5vdiAwMSwgMjAyMyBhdCAwNTo0Mjo1NkFN
ICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+Pj4gRnJvbTogTWljaGFlbCBTLiBU
c2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPj4+Pj4+PiBTZW50OiBXZWRuZXNkYXksIE5vdmVt
YmVyIDEsIDIwMjMgMTE6MDEgQU0NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IE9uIFdlZCwgTm92IDAx
LCAyMDIzIGF0IDAyOjU0OjQ3QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+
Pj4+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+Pj4+Pj4+
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDMxLCAyMDIzIDM6NDQgUE0NCj4gPj4+Pj4+Pj4+DQo+
ID4+Pj4+Pj4+PiBPbiBUdWUsIE9jdCAzMSwgMjAyMyBhdCAwNTo0MjoyOVBNICswODAwLCBaaHUs
IExpbmdzaGFuIHdyb3RlOg0KPiA+Pj4+Pj4+Pj4+PiBZb3VyIGFuc3dlciBpcyBub3QgcmVsZXZh
bnQgdG8gdGhpcyBkaXNjdXNzaW9uIGF0IGFsbC4NCj4gPj4+Pj4+Pj4+Pj4gV2h5Pw0KPiA+Pj4+
Pj4+Pj4+PiBCZWNhdXNlIHdlIHdlcmUgZGlzY3Vzc2luZyB0aGUgc2NoZW1lcyB3aGVyZSByZWdp
c3RlcnMgYXJlDQo+ID4+Pj4+Pj4+Pj4+IG5vdA0KPiA+PiB1c2VkLg0KPiA+Pj4+Pj4+Pj4+PiBP
bmUgZXhhbXBsZSBvZiB0aGF0IHdhcyBJTVMuIEl0IGRvZXMgbm90IG1hdHRlciBNU0kgb3IgTVNJ
WC4NCj4gPj4+Pj4+Pj4+Pj4gQXMgZXhwbGFpbmVkIGluIEludGVsJ3MgY29tbWl0IG1lc3NhZ2Us
IHRoZSBrZXkgdG8gZm9jdXMgZm9yDQo+ID4+Pj4+Pj4+Pj4+IElNUyBpcyAicXVldWUNCj4gPj4+
Pj4+Pj4+IG1lbW9yeSIgbm90IHNvbWUgaHcgcmVnaXN0ZXIgbGlrZSBNU0kgb3IgTVNJLVguDQo+
ID4+Pj4+Pj4+Pj4geW91IGtub3cgdGhlIGRldmljZSBhbHdheXMgbmVlZCB0byBrbm93IGEgYWRk
cmVzcyBhbmQgdGhlDQo+ID4+Pj4+Pj4+Pj4gZGF0YSB0byBzZW5kIGEgTVNJLCByaWdodD8NCj4g
Pj4+Pj4+Pj4+IFNvIGlmIHZpcnRpbyBpcyB0byB1c2UgSU1TIHRoZW4gd2UnbGwgbmVlZCB0byBh
ZGQgaW50ZXJmYWNlcw0KPiA+Pj4+Pj4+Pj4gdG8gcHJvZ3JhbSBJTVMsIEkgdGhpbmsuIEFzIHBh
cnQgb2YgdGhhdCBwYXRjaCAtIGl0J3MNCj4gPj4+Pj4+Pj4+IHJlYXNvbmFibGUgdG8gYXNzdW1l
IC0gd2Ugd2lsbCBhbHNvIG5lZWQgdG8gYWRkIGEgd2F5IHRvDQo+ID4+Pj4+Pj4+PiByZXRyaWV2
ZSBJTVMgc28gaXQgY2FuIGJlDQo+ID4+Pj4+Pj4gbWlncmF0ZWQuDQo+ID4+Pj4+Pj4+PiBIb3dl
dmVyLCB3aGF0IHRoaXMgZXhhbXBsZSBkZW1vbnN0cmF0ZXMgaXMgdGhhdCB0aGUgYXBwcm9hY2gN
Cj4gPj4+Pj4+Pj4+IHRha2VuIGJ5IHRoaXMgcHJvcG9zYWwgdG8gbWlncmF0ZSBjb250cm9sIHBh
dGggc3RydWN0dXJlcyAtDQo+ID4+Pj4+Pj4+PiBuYW1lbHksIGJ5IGRlZmluaW5nIGEgc3RydWN0
dXJlIHVzZWQganVzdCBmb3IgbWlncmF0aW9uIC0NCj4gPj4+Pj4+Pj4+IG1lYW5zIHRoYXQgd2Ug
d2lsbCBuZWVkIHRvIGNvbWUgdXAgd2l0aCBhIG1pZ3JhdGlvbiBpbnRlcmZhY2UNCj4gZWFjaCB0
aW1lLg0KPiA+Pj4+Pj4+Pj4gQW5kIHRoYXQgaXMgdW5mb3J0dW5hdGUuDQo+ID4+Pj4+Pj4+Pg0K
PiA+Pj4+Pj4+PiBXaGVuIHRoZSBkZXZpY2Ugc3VwcG9ydHMgYSBuZXcgZmVhdHVyZSBpdCBoYXMg
c3VwcG9ydGVkIG5ldw0KPiA+Pj4+IGZ1bmN0aW9uYWxpdHkuDQo+ID4+Pj4+Pj4+IEhlbmNlIHRo
ZSBsaXZlIG1pZ3JhdGlvbiBzaWRlIGFsc28gZ290IHVwZGF0ZWQuDQo+ID4+Pj4+Pj4+IEhvd2V2
ZXIsIHRoZSBsaXZlIG1pZ3JhdGlvbiBkcml2ZXIgZG9lcyBub3QgaGF2ZSB0byB1bmRlcnN0YW5k
DQo+ID4+Pj4+Pj4+IHdoYXQgaXMgaW5zaWRlDQo+ID4+Pj4+Pj4gdGhlIGNvbnRyb2wgcGF0aCBz
dHJ1Y3R1cmVzLg0KPiA+Pj4+Pj4+PiBJdCBpcyBqdXN0IGJ5dGUgc3RyZWFtLg0KPiA+Pj4+Pj4+
PiBPbmx5IGlmIHRoZSBoeXBlcnZpc29yIGxpdmUgbWlncmF0aW9uIGRyaXZlIGludm9sdmVkIGlu
DQo+ID4+Pj4+Pj4+IGVtdWxhdGluZywgaXQgd2lsbCBwYXJzZQ0KPiA+Pj4+Pj4+IGFuZCB0aGF0
IGlzIGZpbmUgYXMgbGlrZSBvdGhlciBjb250cm9sIHN0cnVjdHVyZXMuDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+PiBUaGUgcG9pbnQgaXMgdGhhdCBhbnkgbmV3IGZpZWxkIG5lZWRzIHRvIGJlIGFkZGVk
IGluIHR3byBwbGFjZXMNCj4gPj4+Pj4+PiBub3cgYW5kIHRoYXQgaXMgbm90IGdyZWF0IGF0IGFs
bC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4gTW9zdCBjb250cm9sIHN0cnVjdHMgYXJlIHdlbGwgZGVm
aW5lZC4gU28gb25seSBpdHMgdHlwZSBmaWVsZCBpcw0KPiA+Pj4+Pj4gYWRkZWQgdG8NCj4gPj4+
PiBtaWdyYXRpbmcgZHJpdmVyIHNpZGUuDQo+ID4+Pj4+PiBUaGlzIGlzIHZlcnkgbG93IG92ZXJo
ZWFkIGZpZWxkIGFuZCBoYW5kbGVkIGluIGdlbmVyaWMgd2F5IGZvcg0KPiA+Pj4+Pj4gYWxsIGRl
dmljZQ0KPiA+Pj4+IHR5cGVzIGFuZCBmb3IgYWxsIGNvbW1vbiB0eXBlcy4NCj4gPj4+Pj4gV2Vp
cmQsIG5vdCB3aGF0IEkgc2VlLiAgRS5nLiB5b3Ugc2VlbSB0byBoYXZlIGEgc3RydWN0dXJlDQo+
ID4+Pj4+IGR1cGxpY2F0aW5nIHF1ZXVlIGZpZWxkcy4gRWFjaCBuZXcgZmllbGQgd2lsbCBoYXZl
IHRvIGJlIGFkZGVkDQo+ID4+Pj4+IHRoZXJlIGluIGFkZGl0aW9uIHRvIHRoZSB0cmFuc3BvcnQu
DQo+ID4+Pj4+DQo+ID4+Pj4+Pj4gV2UgbmVlZCBhIHN0cm9uZ2VyIGNvbXBhdGlibGl0eSBzdG9y
eSBoZXJlIEkgdGhpbmsuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPbmUgd2F5IHRvIHNob3cgaG93
IGl0J3MgZGVzaWduZWQgdG8gd29yayB3b3VsZCBiZSB0byBzcGxpdCB0aGUNCj4gPj4+Pj4+PiBw
YXRjaGVzLiBGb3IgZXhhbXBsZSwgYWRkIHF1ZXVlIG5vdGlmeSBkYXRhIGFuZCBxdWV1ZSByZXNl
dA0KPiBzZXBhcmF0ZWx5Lg0KPiA+Pj4+Pj4gSSBkaWRuJ3QgZm9sbG93IHRoZSBzdWdnZXN0aW9u
LiBDYW4geW91IGV4cGxhaW4gc3BsaXR0aW5nIHBhdGNoZXMNCj4gPj4+Pj4+IGFuZCBpdHMNCj4g
Pj4+PiByZWxhdGlvbiB0byB0aGUgc3RydWN0dXJlPw0KPiA+Pj4+Pj4+IEFub3RoZXIgaXMgdG8g
YWRkIE1TSVggdGFibGUgbWlncmF0aW9uIG9wdGlvbiBmb3Igd2hlbiBNU0lYDQo+ID4+Pj4+Pj4g
dGFibGUgaXMgcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3QuDQo+ID4+Pj4+PiBZZXMsIHRoaXMgd2ls
bCBiZSBhZGRlZCBpbiBmdXR1cmUgd2hlbiB0aGVyZSBpcyBhY3R1YWwgaHlwZXJ2aXNvciBmb3Ig
aXQuDQo+ID4+Pj4+IFlvdSBhcmUgdHlpbmcgdGhlIGFyY2hpdGVjdHVyZSB0byBhbiBleHRyZW1l
bHkgaW1wbGVtZW50YXRpb24NCj4gPj4+Pj4gc3BlY2lmaWMgZGV0YWlsLg0KPiA+Pj4+Pg0KPiA+
Pj4+PiBIeXBlcnZpc29ycyAqYWxyZWFkeSogaGF2ZSBtaWdyYXRlIHRoZSBNU0lYIHRhYmxlLiBK
dXN0IGluIGENCj4gPj4+Pj4gaHlwZXJ2aXNvciBzcGVjaWZpYyB3YXkuIHF1ZXVlIHZlY3RvciBp
cyBhbiBpbmRleCBpbnRvIHRoaXMgdGFibGUuDQo+ID4+Pj4+IFNvIHRoZSBpbmRleCBpcyBtaWdy
YXRlZCB0aHJvdWdoIHRoZSBkZXZpY2UgYnV0IHRoZSB0YWJsZSBpdHNlbGYNCj4gPj4+Pj4gaGFz
IHRvIGJlIHRyYXBwZWQgYW5kIGVtdWxhdGVkIGJ5IGh5cGVydmlzb3I/IEdpdmUgbWUgYSBicmVh
ay4NCj4gPj4+PiBJIGFncmVlLCB0aGUgTVNJIHRhYmxlIGNvdWxkIGJlIFIvVyBhbnl3YXkuDQo+
ID4+PiBQbGVhc2UgZXhwbGFpbiB0aGUgbW90aXZhdGlvbiwgd2h5IGl0IGNhbm5vdCBiZSBhZGRl
ZCB3aGVuIHRoZXJlIGlzDQo+ID4+PiBfcmVhbF8gc3cNCj4gPj4gd2hpY2ggd2lsbCB1c2UgaXQ/
DQo+ID4+PiBJIGFza2VkIHRvIGFkZCBpdCB3aGVuIGl0IGlzIG5lZWRlZC4NCj4gPj4+IFdoeSBp
dCBpcyBtdXN0IHJpZ2h0IG5vdywgaWYgaXQgaXMuDQo+ID4+PiBJZiB0aGVyZSBpcyBhbnkgc29m
dHdhcmUgbGlrZSB0byB1c2UgaXQsIHBsZWFzZSBleHBsYWluIHdoaWNoIGlzIGl0DQo+ID4+PiBh
bmQgaG93IHdpbGwgaXQNCj4gPj4gdXNlIGl0Lg0KPiA+PiBhcyBNU1QgaGFzIGV2ZXIgcG9pbnRl
ZCBvdXQsIGh5cGVydmlzb3JzIGFscmVhZHkgaGF2ZSBtaWdyYXRlIE1TSSB0YWJsZS4NCj4gPj4g
U28gSSBzdWdnZXN0IHlvdSB0byByZWFkIFFFTVUgY29kZSB0byBmaW5kIHRoZSBhbnN3ZXIuDQo+
ID4gSHVoLCB0aGlzIGlzIG5vdCB0aGUgYW5zd2VyLg0KPiA+DQo+ID4gTWljaGFlbCBhc2tlZCAt
ICIgYWRkIE1TSVggdGFibGUgbWlncmF0aW9uIG9wdGlvbiBmb3Igd2hlbiBNU0lYIHRhYmxlIGlz
DQo+IHBhc3NlZCB0aHJvdWdoIHRvIGd1ZXN0LiINCj4gPiBDdXJyZW50bHkgaXQgaXMgbm90LiBX
aGVuIGluIGZ1dHVyZSBoeXBlcnZpc29yIGFkZHMgaXQsIGl0IGNhbiBiZSBhZGRlZC4gV2hhdA0K
PiBwcmV2ZW50cyB0aGlzIGFkZGl0aW9uIGluIGZ1dHVyZT8NCj4gPg0KPiA+IEkgYXNrZWQgdmVy
eSBzaW1wbGUgcXVlc3Rpb24gdG8gZXhwbGFpbiB0aGUgdXNlIGNhc2UgYW5kIGh5cGVydmlzb3Ig
d2hvDQo+IHdhbnRzIHRvIHRyYW5zZmVyIE1TSVggdGFibGUgYnkgdXNpbmcgZGV2aWNlIGNvbnRl
eHQ/DQo+ID4gWW91IGRvbuKAmXQgYW5zd2VyIGl0Li4uDQo+ID4gSSBhc3N1bWUgdGhlcmUgaXMg
bm8gdXNlciBzb2Z0d2FyZSBvZiBpdC4NCj4gPg0KPiA+IElmIHRoZXJlIGlzIG9uZSwgcGxlYXNl
IHNoYXJlIGFuZCBpdCBzaG91bGQgYmUgYWRkZWQuDQo+IEkgY2FuIGdpdmUgeW91IHNvbWUgaGlu
dHM6DQo+IHdoZW4gdGhlIFZNIGZyZWV6ZSBpbiB0aGUgInN0b3Bfd2luZG93IiBvZiBsaXZlIG1p
Z3JhdGlvbiwgdGhlIGh5cGVydmlzb3INCj4gb3ducyB0aGUgZGV2aWNlLCBhbmQgaXQgY2FuIGFj
Y2VzcyB0aGUgTVNJIHRhYmxlIG9mIHRoZSBkZXZpY2UuIFNvIEkgZG9uJ3Qgc2VlDQo+IE1TSSBj
b25maWd1cmF0aW9ucyBibG9ja2luZyBsaXZlIG1pZ3JhdGlvbi4NCj4gPg0KPiA+PiBXZSBkb24n
dCB3YW50IGFub3RoZXIgbG9uZyBsb25nIHRocmVhZCBidXQgbm9ib2R5IGRldmVsb3AgdGhlaXIN
Cj4gPj4ga25vd2xlZGdlIHRoZXJlLg0KPiA+Pg0KPiA+IEV4YWN0bHkuIFNvIGV4cGxhaW4gdXNl
IGNhc2Ugb2Ygd2hpY2ggc29mdHdhcmUgd2lsbCB1c2UgaXQ/IEkgZG9u4oCZdCBzZWUgYW55DQo+
IGh5cGVydmlzb3IgdXNpbmcgaXQgdG9kYXkgX2Zyb21fIHRoZSBkZXZpY2UgY29udGV4dC4NCj4g
c2VlIGFib3ZlDQo+ID4NCj4gPj4gQW5kIGlmIHRoaXMgaXMgYSB2ZW5kb3Igc3BlY2lmaWMgaXNz
dWUsIHRoZW4gc2hvdWxkIG5vdCBiZSByZWxldmFudCB0byB0aGUgc3BlYy4NCj4gPiBXaGF0IHZl
bmRvciBzcGVjaWZpYyBpc3N1ZSBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IEJ5IHNvbWUgbWVhbnMg
YXJlIHlvdQ0KPiBfaW1wbHlpbmdfIG5vdCB0cmFuc2ZlcnJpbmcgbXNpeCB0YWJsZSBpcyBwcm9w
b3NlcnMgdmVuZG9ycyBsaW1pdGF0aW9uPw0KPiA+IEhlbGwgbm8uDQo+IEh5cGVydmlzb3IgdHJh
bnNmZXIgTVNJIHRvIHRoZSBkZXN0aW5hdGlvbiBhcyBleHBsYWluZWQgYWJvdmUsIGFuZCB0aGlz
IHJvdXRpbmUNCj4gd29ya3MsIGFuIHJlZiBpcyBRRU1VDQpJIGhhdmUgaGFyZCB0aW1lIGZvbGxv
d2luZyB5b3VyIHN1Z2dlc3Rpb24uDQpTbyBkbyB5b3Ugd2FudCBNU0lYIHRhYmxlIGFzIHBhcnQg
b2YgZGV2aWNlIGNvbnRleHQgb3Igbm90Pw0K

