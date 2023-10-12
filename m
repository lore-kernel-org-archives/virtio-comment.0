Return-Path: <virtio-comment-return-7696-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A513ECDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:13:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE9321A90EB
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:13:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB99598683B
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:13:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A106198660E; Thu, 12 Oct 2023 13:13:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9293398660F
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 13:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0FyiCEjF3KTOBqbiXbnFgilzLv1wIB/PPXBZQk4hZtl7lhzGLUFmfyJXvVukBxQrOCO+QleF/N5fys3ZohYqAAAMu/2ecVAtA9BKXs0GtZomeViCOoHKL6JkeQFu6TAhwUyyNnbxu6wJ2OlVjSIpgTyvl0FzJ0Caz8r12onlbGnqht74enBMnQl3v8vcX/dpEDxkIEmA9tAF//csjBRE5eHGAfk8zu9J1Vys6lEpN/cuu0lsuwJd6JpqxBzv2wz+ND/67SssdMgfg8LUvGpMJJ2Kh+uuvvHDEuDIhBLf0sJNs65/BRVKI4PCPhEyaG5saeG1fXPpNU66pqoFQRz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzyT0bLmxU+95e+dZtCjNEv/DiuSclR+if7VIoRLF+4=;
 b=U2iAIBvldfxB4u8CGnjF+bVVKhMbLo3ZyN7OYOnsZHjUY3K7UEN+Hhx5HKcRHQeycgEdQqjuDKf+DhkIXi/8PyaDdrj0LLa+YnzP/guehMqyEARvkNow6PLiOnkUpXOkkw6wM5xnIVnZ0pyBE5ZNRrAEHgZlHBKIXGUXm+blq8KI3kVyPB0xBNRjAwU4cQ8qwnXjl8BifOmzktr8Q1lAZETA85vf1pvkYvrEiU7zfi10C/ROGx6zS2dUmCczsz/3J+hxlpvIMd9idshZLuVBISQZhGvY3vqUT1RH8vd1fuyvYsi8CIkIxBTz+3+ZuB+6MDg1aYqOtlx7RgPQntkvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAABu2AIAAAfYQ
Date: Thu, 12 Oct 2023 13:13:29 +0000
Message-ID:
 <PH0PR12MB5481FA45B8262F916937CB3EDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012085859-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012085859-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5325:EE_
x-ms-office365-filtering-correlation-id: 99ec3ca5-6349-4a7f-8110-08dbcb2506c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RNY2z4RE788fTsNU0Adh7sHjvNShv/ulbW+Z3oBgeko+RUb8Ot3T4AcMypqFVTg4MGvP/JE7AYrNRfNq50tx/eWFfDAT2nsAk36HqY9W5ogZ7IjfUXiuhhQCC2pNRv3Ivkf0gAMlaODuxpzazGyy7ZNWU7voVF23ZLwTNkmRhAQAdRT7ZsKE8paMfCVdPR93PWjzmjxdioagjUCQkrXNIenqmsMoyLt4aFaYs3bmK4frroCuO4dTx1K+8GzhtpZ5YwT/41SnyNPwPl3C59AM3YMBqFdXPCFitdWRbHScS+k/9IufFLwIz9g8zz4+pregBMRqotVd1CnqJmEoIhv/bBWPUwFVcQ/TWFZOKX21nrGx3hPgztPRmvYYcul1m51ttYe7csW13e40MQW2osyB0Y8K7BzsdWkiPtsj05Gvhtg3EPU1v/VBfMfSkF/mI3DlzcE3dIxYSicukNJdS09eec+JPho8mq+TbTefzJt8N/XrFpSN8g0zB+GrUyYUdpwMxntM2Swum8CGIpmKAgQ1N/MphWHdNHt+2n/zvXghSU2yKnPo291v2I3v1CM0y+O1L0tW8HEQzToGJ1GjMjE6x+tPoqlSy4ZhyR5XcEoX8MQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6916009)(83380400001)(316002)(52536014)(55016003)(38100700002)(8676002)(76116006)(8936002)(38070700005)(122000001)(33656002)(86362001)(54906003)(4326008)(66476007)(66556008)(64756008)(66446008)(66946007)(107886003)(6506007)(7696005)(2906002)(41300700001)(4744005)(71200400001)(9686003)(5660300002)(26005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHFCQlRyb24zc0F2ZnpaOEQvaHpWZ25WenNXbzZUcGdpKzJ3RjdySHB0UFlC?=
 =?utf-8?B?SVVFY085MkdSRzRvNW4xUktjYlZpdWF2cmM4Z2ZCZFpXWDB4cFhhQkZqbFJ4?=
 =?utf-8?B?SlBrSXlua2tuUFIrUWhTMGR0SjQ0MWtwRjNjbGJmT0ovYXEwV0dTcGF0MkFv?=
 =?utf-8?B?WnJwMlMvLzk2QU5FdjdzTHhLTFV1RHVycjNyU05tTHJNb3N0TTBFc3EwYzBq?=
 =?utf-8?B?bGY2dnZ2M21sekFpMmFVbDN0VDB3V2g2bmtKWENLS2xDa01wYndHRnBGM3ZO?=
 =?utf-8?B?dGNOUHE3N04xMzdjQmNsVHh1Nk43ZTdkOWhXS1NYUW42dHFkZzkxVkc2OENG?=
 =?utf-8?B?OERXeStXdjVNZzJOQXlJTG8zTWM4R3IvTW00V1NKWU1JdU9sQU1COGF3dDJY?=
 =?utf-8?B?UDFCS3g4ZHNJSjJ4VFhmQ1lMVGNJVVNoU2U3NTNqckNYdm9UdHVuYWN0b1hO?=
 =?utf-8?B?ODhvNFpBeUZuS1ZYc2hUVTZNZHFnQVFEOVd6dUd1MEJ2Z21heiszZ3JrOGho?=
 =?utf-8?B?bmtEcUJuZk5lOFhTWm5CK1g3WS9DL0RxbWR2YUl5SEpmUGRMS2J3NnN3d1pt?=
 =?utf-8?B?K0lCSENOSHA3SUV0UE9UUzNQQlZhVG5oUkp3NjVmWGxiUVFsSXZueWNDdENk?=
 =?utf-8?B?V1J4U1I3OUYxakt1ZXpHd0FnelBCcjFIUXJ6Y3pDMWFZSkdJNE9yYm1uekwy?=
 =?utf-8?B?VnhpdHEzZFJlYjdkNk9SZVoxYXFoTEJPQjBxWTdBSmJ2L01wdmx0RFp6WUsr?=
 =?utf-8?B?bUtTSFU2YXlDWms4L1NtTWQzcmFzNWFjWWQ0ck1UaEE5MFhsd09yOWl2ZWYw?=
 =?utf-8?B?SE5KUHB4Y04wbTRpdnFVc3MvYVVzaHg1QkJydWN5Q2ZJeDJxV3lnVHRhbjFw?=
 =?utf-8?B?Q3lDZWczVjhadDlwMzQ0T3JYaEVsSGJOd0lLazZRTXo0ZGxpZVhHQ2hjV0wy?=
 =?utf-8?B?T0EyQld0RDBXV1VTR2R3WG1qUDdLZkFiaW13Sm9DNTB1VnhBK0VodnhoTVcw?=
 =?utf-8?B?c3ZXbUZ3MDI3R2F4RzRwbklac01oVlFCeFZTTXNDL1BRMDFPYVpsVkZ1RG5G?=
 =?utf-8?B?ZUliNTJHeFdpYXhPaytRMHZlL3QrVGRKcC9PMUZ4UWI5YU9ZV0pCOWw2bTN3?=
 =?utf-8?B?R3lmUk1BM3Y3bzFsKzQxZjZ0cVczNThQblhjVjY5RzF3UE5pRExEMHFzU3Ja?=
 =?utf-8?B?cHBBWUl2OElid05TL3ZsUHlOcEtZM3F2UzF2RmRTYXdWMWJkZ00zV0ZQcnhw?=
 =?utf-8?B?WDdpRW5MU2kyczlXSFIyaDRxSVY0eUN3ZDV6U1ZQbk1aV1VtQ2ZiSGdWajZS?=
 =?utf-8?B?Q1JpNUtobnZDMW91RTduT3A2N3VTcXg5b2tKQ2xmemtlRWVVMHArdmRiR1Zt?=
 =?utf-8?B?ZW1vclJMRENJaVo0QVBjTmhQSnFSK1RqN1FSTEE4NFFHb01xcEVIa0JreGUy?=
 =?utf-8?B?amtDTUVrM2pidzhKZ3NlMWRvU1FjSFh6NzA3QTRkL2FhdmJ3MVVPNWZJaWIv?=
 =?utf-8?B?Vi9DNjUrNmxZeHMyYlAzTm83MFlKUWFxcGd0emhWdVQyVHIzRzNhMFpaNkpL?=
 =?utf-8?B?aHFWTHlZYVRUMm5CbEQ3UXdJKzlEVUFjQk5XQnZXNWxYemZDWG9MNlBDc0h3?=
 =?utf-8?B?eTBkT0pRU3JPMkpCZmhxQzUxNVYvVUs1QXZKNzdDTUFONlNJYlM3VmsrMno1?=
 =?utf-8?B?emYrSHVQN250dEpHOUowdXpzZEU2dUo1RjlSbzJWQ1V3ZmRUNDB2aXd0djNN?=
 =?utf-8?B?cUs0WW9QTEhSUU1zM3p3NVVLWDNUSGNWdDFrd2t0NzVjUE8yQ2ZpdlNuanNE?=
 =?utf-8?B?d0JoWTFDUTRxdmNYcDh2dmpyaW94VUtEQXR3TjhVeDNuZ2dyUWc2eWFCeVVJ?=
 =?utf-8?B?U041NEcwK3BmRlR1eG5jWnBOQkJtRm1aeGpxMHY5UnQwMGlRU011ZEJVaVp5?=
 =?utf-8?B?WEFWTnJTYmpleStKSEZTdVM1Y1NldGQ1aFcxb1RDcjRBVllBQ3VCYTlPb1ZL?=
 =?utf-8?B?cGdOcnVVWHd1T3JzZ2pnbjBMRnFvUVBYdFNXMXpNMEQ4Q25RTGNBbVJxV0hV?=
 =?utf-8?B?Y2tsTkNBRXg0bEpXVFdiajllZnhkeDE4RThOcXhRM0Y5WmFBUUZLenhxZHdr?=
 =?utf-8?Q?uJS8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ec3ca5-6349-4a7f-8110-08dbcb2506c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 13:13:29.0614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2moKnJtSyQni/6tLIV+uVKoOLItdB6SV2Mn/gL8U+7MS6xhVLe5wVRZ698ZdD9WEzmJ3AJ7znEXzOZoP1jNjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5325
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBNaWNoYWVsIFMuIFRz
aXJraW4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTIsIDIwMjMgNjozMyBQTQ0KPiANCj4g
T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMTE6Mzc6MDFBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdy
b3RlOg0KPiA+IEFzIE1pY2hhZWwgc2FpZCwgc29mdHdhcmUgYmFzZWQgbmVzdGluZyBpcyB1c2Vk
Li4NCj4gPiBTZWUgaWYgYWN0dWFsIGh3IGJhc2VkIGRldmljZXMgY2FuIGltcGxlbWVudCBpdCBv
ciBub3QuIE1hbnkgY29tcG9uZW50cyBvZg0KPiBjcHUgY2Fubm90IGRvIE4gbGV2ZWwgbmVzdGlu
ZyBlaXRoZXIsIGJ1dCBtYXkgYmUgdmlydGlvIGNhbi4NCj4gPiBJIGRvbuKAmXQga25vdyBob3cg
eWV0Lg0KPiANCj4gSXQgaXMgd29ydGggcG9uZGVyaW5nIHRob3VnaC4gQ2FuIHlvdSBnaXZlIGl0
IHNvbWUgdGhvdWdodD8NClllcy4gDQpEZXZpY2UgY29udGV4dCBhbmQgZGlydHkgdHJhY2tpbmcg
Y2FuIGJlIHVzZWQgbW9zdGx5IGFzX2lzLg0KSXQgbmVlZHMgc29tZSBkaWZmZXJlbnQgc2V0IG9m
IGNvbW1hbmRzIGFzIG9uZSBjYW5ub3Qgc3RvcC9mcmVlemUgdGhlIGRldmljZS4NCg0KPiBJIGFt
IHRoaW5raW5nIG9mIGEgc3BlY2lhbCBiYXIgcmVnaW9uIChvciBhIGNvdXBsZSkgdGhyb3VnaCB3
aGljaCBhZG1pbg0KPiBjb21tYW5kIHN0cnVjdHVyZSBjYW4gYmUgZXhwb3NlZCwgYW5kIGEgc3Bl
Y2lhbCBncm91cCB0eXBlIHRoYXQgcmVmZXJzIHRvDQo+IHNhbWUgcGNpIGZ1bmN0aW9uLg0KWWVz
LCB0aGlzIGNhbiBiZSBhbiBvcHRpb24gYXMgYWRkaXRpb25hbCB3YXkgZm9yIG5vbl9wYXNzdGhy
b3VnaCBtb2RlLg0K

