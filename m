Return-Path: <virtio-comment-return-6811-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90FEB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 12:13:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A91162AEF1
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 12:13:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96E6D98648A
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 12:13:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 840CE98645C; Mon, 10 Jul 2023 12:13:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71148986462
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jul 2023 12:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJyFYV6Z9s6lvNcXkWf8hKJ8AxAj4G05f6hhwDx3xp47aInqTZ6d1CY7Q0pPuROC5FSEmZfeaufspahDJ7I8F+eyrC/Qgd0QYKIrNWBNx8xxUYdfDHOI1T0s1b/0RPmbYtNSQE4U6vwOEv/3YstkDZDqU1D3UlE7pfRqxzIux2XVZ0nd3kVuHJ2kLKITAe+2IWvHRMz4Yqulragk1L3hdziPvI5Q/mx44aCJ2j93KXesPtuE7Yw2J9XvjoJ9KZmOoUMLq8NsnT60HmqKglERhg8X0dD5AC8FBD2otF6+4XCF9kBUj16MO5kVdXb2qmiuDyiITLmPe9LHCr6A4j7D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsC2+0TfiEihaxW3nBuawreQO9DZN/4lGWVlpuutCng=;
 b=c1itvEtxSCBIn9pBK7tjVOkGZ92CDkv9fMsdsAmyzj93gVrhdeDHfnSsKlID9Ij9sqyzNLyvkcqWc2y5ch+Ss/5epwV+US1UYQkt4CD5H7aPQQFN6t+zLP2oa2dm16LQjsStvpuYgi3FLbLIZQKZO9cdNBpA+Yc+WlP5OPa/j/HHRRn7pOq2RKDnKrITe+dNGUyQYeDckvKmJX3PiUwvQqjAbHOvt2vpBYrs+HFVwdgzFxXEwHD74q3sb6u1JFt7n8H9Fb4ZxpOaUJiazY0JNC8rTgxR9jEed25s++60PuMt7pigTXHD6b7XhRD/0Nko4o4nZJcK1f4pgwErSIyTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea
	<dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, Yan Vugenfirer
	<yvugenfi@redhat.com>
Thread-Topic: [virtio-comment] [PATCH 0/2] Selective queue enabling
Thread-Index: AQHZmKAQVS3tAnpQAkiNIwN8c9DA46+tO0mAgAVYSwCAAB+fgIAAayeA
Date: Mon, 10 Jul 2023 12:13:47 +0000
Message-ID:
 <PH0PR12MB5481EEBADA76385FAFA0EA4CDC30A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
 <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com>
 <20230710014740-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230710014740-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BN9PR12MB5228:EE_
x-ms-office365-filtering-correlation-id: a1ef8834-fc6d-4d93-ee7d-08db813f1d50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DXWg66REjIUnKnFoEBjwncgIGNbzHfkf8gjcqPCESzMmOqTYY+vanKfRDgrvM2nPA+LgMQZUicsDpUIbTxndk3kvMLWRqbexqD33uG1GJdkzXKW5TPny7hpGQA3fy+rQURcEuYr9YAL/O9mS+5nvOwRyzOOag+JRausLFbE11IqOAbS/d/eQzxbMwPwzdY4mG1G5VG9BgR7TEg6HcGOXOwFNPyS9h4ueFD08DPKADpt/HmXtDpLUK10y/xo4vium1v2nRl4HB+0DmgUDX1W4w7pHoEE2hBgbm+RrfWRCd5Q6jbdrbJ5g5guDZ/ijujt9VxlA/OGGEse9tJf4jf24GH3O4lrrUqfKqbnNXQOO0XwgjBdljs5UdlFxibvXqXa2GlY+kXzMHsSpmGLaZbO0tc21oLkKkGhXrIEIJOvgNeBmFAsYRUDVg3zPPnnRMp5IHlJzy7d0gBQx4euxlfdwQBCszyyAd6MSdHhFEp0gcaf09Z2NvaZVyXygpuiZ/+NGsNPpkhmPpkDzRPoexepOBPRfgflfejFn4UFxdw07ddHNwkDmytr1aRBxf5UA4/0HvMQ6EEqXCR4jSbmqRQ7SDoaAqzQ+TStK0/hA6SgaaqHFvHA1VQ2A/GJjp/Q3Jd7D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(478600001)(7696005)(71200400001)(33656002)(26005)(6506007)(186003)(55016003)(9686003)(316002)(2906002)(41300700001)(4744005)(38100700002)(122000001)(64756008)(66446008)(76116006)(66946007)(66556008)(66476007)(4326008)(86362001)(7416002)(8936002)(8676002)(38070700005)(5660300002)(52536014)(110136005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUU1cDdiSmoxTVl0Q1o4eENiQ2lBS1N2d1Q1cUlTUEVPNXJHU2dnTVgyZHVQ?=
 =?utf-8?B?TGJRdjY4U21tdUVjK04xN09SSTJZdVc0bUd5N01RVzJ0K2JYZWU0TjhQV2Iy?=
 =?utf-8?B?dTJJaFVzSytWNVFQYUpiTDdKbW96TlB1NlJZQlZ1VzBjclExVC8vbDZEK0k2?=
 =?utf-8?B?TnMzMlJQQXl2RG53dTZrV2swTHlObzJpdlpKT1o2UzNKUURRdkVrdVRQS2Ra?=
 =?utf-8?B?dlhkY0ZUM2lTWkpKdXJ5aXYvSERkN3BHMjJzM0x1cHc3TFU0dWU2ZjExMWcz?=
 =?utf-8?B?amcwZEJEVmt3OTc3RGNlbE1Zb2haV2hEamoxdkZ5ZUVxQ2gwYlc1VS9sWFBz?=
 =?utf-8?B?eDdDb2Y0YUR3VURwS2d3cHZOZ2dXYmNhUmI0c3Z0WUd2S3A2K0ErSnRzNENU?=
 =?utf-8?B?OWpWSEZLb2NOU0lNNWhVejhnRlA2MHpDNXI3b0tCdzdoME1WNVRWNVpJbHZn?=
 =?utf-8?B?YUhPektVczN6bFNrT1MxS245czJhN0RUYXAvajIzZllzUWNkVXhjOUkvSDBj?=
 =?utf-8?B?YzJDUzhWTXljT0NpNDB4Um02aUxlU2l6aFk0TzAyTzArdlhWU2t6S1NXdVRZ?=
 =?utf-8?B?Y3JFMDl5ZDh0NDFmU0VncjQzeE1INTJxc1dlQTR1SWVIWGdpUmQ2YmpINCtu?=
 =?utf-8?B?YU1HNi95aFhVcGJwdUtIOU5WSGhac3hpYXNCWnpkTW52eEJJSlBrY0R6Vm1w?=
 =?utf-8?B?ZEZyemNaTzBidlZjUHYyc21RVVJJNjRrU0NUcXhNaWQ3R0R3OFBMT2Fycm9O?=
 =?utf-8?B?ODFQaFdiRUZZRmx5MVVKYXQvb01KSzNWaHVKRVpFZzZ6Q25SdHUzM0s2SllR?=
 =?utf-8?B?YW5qbUdyYm5kRUY3RytWSWF6VXpaekpobjV3bWtTYVRuTXhYM1g0dlJGM21T?=
 =?utf-8?B?eEo0RG9TVzNKVmR2eUdGZjhPQStQVjN5V2F6MHlpNTdyaTVZTlZxaEd6SjI5?=
 =?utf-8?B?a3N0Y1NwdWxzOG5ZMFFHeVhjWEJYY3Z4NWlMNDJlRTk5Z0NoeDByaForNXMv?=
 =?utf-8?B?cVhTb1p3VVRJTWFVVHJ0T01uTGdhaHh6L3dCSWRmNTBZT1FVcENWMHFnNWVT?=
 =?utf-8?B?bHRGQU9VdmtHR0h1a0c4Ly9YcjdOS0pCSUJScSs2aU85QXBVZ3NxaXQxY3lL?=
 =?utf-8?B?aUFLYlVTM21vbWNMZTVaald0TEFqRGkvZ1dia3ZNYVVITjlBemIrU09XZk8y?=
 =?utf-8?B?cERjSnplUmJpc1VLN3NINzlYdmZkK2xQWDVkVlE0UFNTak5wUGtNR1VTalVN?=
 =?utf-8?B?MkFsZE9GV0dNTjNNQTdMVzAxb3lPK1huTFA3cmwvWVVDRzV5blpwVU9nbUNN?=
 =?utf-8?B?a2Evd2JUTEFwazY1dU5VNXBTRlM2anovVzdNcWpSWWxYMEYzSlpUaG9ldTAv?=
 =?utf-8?B?ckhhYUxMNlZzQzZPSDVUZHZlRmIreDM1Si84aWFGdFE2K3gvbGl2N0N0V2hk?=
 =?utf-8?B?RWllcmdjZXJoRmU1YnlnZWZjaWVUdWNEUFdSTkJRcVZKazN1MGl1cnpmT0FN?=
 =?utf-8?B?Y3dDYW1ZN2RSYjZIeE5zOWFLdHVzUk5GV1I2S0hRNDd5Wm5iNFNLN2Fxc0JC?=
 =?utf-8?B?V1kxOUpabFppNW5YVm05RGtCWU1PNjlVVUlyNnpJV2tLOHhNTUxIOWp1THQ4?=
 =?utf-8?B?NTViT0xJV2NWanNJbkY5bFBwWUREdndnRS9YNklHTXNTSzdiTFNDazN2M281?=
 =?utf-8?B?UTdrZUt5dGJRK0hHMURNaEpmSWpyaUJCcnllc09JY3hnT2NCYVpUUGhjenJh?=
 =?utf-8?B?ZDFHeWg5R1hkbnFGR004WW5lYzNtNmUyaXFXTzUyZUhvUGxnK2xFWkIyZGFR?=
 =?utf-8?B?Y0JvWUY3NTRmQlc1ZU5xV2xTK0tRUDFXK2RkSVVUTm5XYXhZTjhXeGxnUURr?=
 =?utf-8?B?bVBDZmZtSmttcVdDRFo0d21EeTdIQld3bWM4d1FwR1dUeVZOWFpOVDNmOTh2?=
 =?utf-8?B?Y0xKUGxyUTFQT3o5U1lCMlFNanFRK2NEUDdVQ0ZEcFBoVWN5OWN0bURxb3By?=
 =?utf-8?B?YlZ4aXlLMG9qSy9GMzlZYUM4N2QrWWVJS3Rud2hkd05LWnBXeThhb3oyMCto?=
 =?utf-8?B?OFpvRjBDTkxacmo3czBVZHJpbFppejBlN09mRGFYYW1MK2U5RjBvYkJweVN3?=
 =?utf-8?Q?LVro=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef8834-fc6d-4d93-ee7d-08db813f1d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 12:13:47.7600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyCDQDUfWk2oTNxVCGvbPr5aGksBiqLknEPcqhNH2bBqDBkRWm2Oy3juXo+YkG6LhiUihiaAQAniW2gQX9fpZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228
Subject: RE: [virtio-comment] [PATCH 0/2] Selective queue enabling

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
TW9uZGF5LCBKdWx5IDEwLCAyMDIzIDE6NDkgQU0NCg0KPiBJJ20gbm90IHN1cmUgd2UgbmVlZCB0
byBib3RoZXIgYXQgdGhpcyBwb2ludC4gSW4gbGludXggd2Ugc2VlbSB0byBoYXZlIGFncmVlZCB0
bw0KPiB1c2UgYSBtaXggb2YgUklOR19SRVNFVCBhbmQgYSB2ZHBhIHNwZWNpZmljIHRoaW5nLiBO
b24tdmRwYSBzb2x1dGlvbnMgZG9uJ3QNCj4gc2VlbSB0byBuZWVkIHRoaXMuIFJpZ2h0IFBhcmF2
Pw0KDQpDb3VsZG7igJl0IGZvbGxvdyBhbGwgdGhlIGVtYWlscywgYnV0IHllcywgSSBhZ3JlZSB3
aXRoIE1pY2hhZWwgdGhhdCBGX1JJTkdfUkVTRVQgc2VlbXMgZW5vdWdoIHdoaWNoIGlzIHNlcnZp
bmcgdGhlIHB1cnBvc2Ugb2YgZHluYW1pY2FsbHkgYWRkaW5nIHRoZSBxLg0K

