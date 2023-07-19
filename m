Return-Path: <virtio-comment-return-6865-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778A3EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:44:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF5C32A8DF
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:44:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99EBE9867B3
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 12:44:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 853459866A2; Wed, 19 Jul 2023 12:44:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 721DD9866A3
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Jul 2023 12:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoAFsZPx7yeL76orrQCktMxsoJthsL157z5+IV/2Z3/ys0fvNqmGHEr6qF6Z4X+MWZfcQMBpZAtZMD7psikE8nvDehKA4594xYYYxhUbhUnkkzF3fuF+L15pwb7WYc6i6F6oKlrZOgcLdiAymDAlBcyOjayWAECwx8HwWpXr+ILgNsnvG5IXb4MzkNxFUZ/Cr/gJtSrJRCgalRXDqNZDgOzJXmikhHr6pDzIHXN0VBTaVJj4fTuf34b/SQZBNocey9SDmcH8lcQCDwXdqlg2BtLCzeXZphmYrf48m8QXCcly/FwykyxKPgKXCBl0Qzm4dmgH50dcC+cuBflzuiWpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiOX1xiBNBu3nxCxlFmX+V8CjsXgflbFYi0BglhN3/4=;
 b=TSK9Ig072mHNbI59EEfZnOuj7wD6dJW5xe1Z/JTIa9XKchoyusKMxG6XmP7fO2NXiy/5sOY83uaDWkrPyoepukg8ye5bxf5v8S13xRMb/QwbKI5O7LfLrTctZZt0R/76EKMya5USfy+DN7cpUrYjIYR1ZrOGONk6oQj92V9rbIIkdcm/kxLp1JnL+uBiNJGm23oUfl3zi33dvz2wVpPPu6Xh9QgOx+x+de1EulVK5BksDXtjSeHafbWT7p6TpLFMsvK7Tj8XRdIp9f9o8YBngg+UUz15K1tovcBoDD/NYBxsbXuls+wpLitysIMf3jGa1rAoIULv4J5QJFrDOKFAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics
Thread-Index: AQHZp//GdtomPRtgx0S0IhL/pYbPzK/Az0wAgABd65A=
Date: Wed, 19 Jul 2023 12:44:52 +0000
Message-ID:
 <PH0PR12MB54816BDFABCC4F2D7DD9D95EDC39A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
In-Reply-To: <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB5105:EE_
x-ms-office365-filtering-correlation-id: 2e579da7-345e-49d2-4ff6-08db8855f2c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5Zmt4FKSdzm3TYOG77zY2RW85PXk/GDxiihc6nONPNGHdQljfJcoUI9OWoXXxgJBtZVoa5D49XgPrWagYDNoAX2zMaGGu7P1tDVhduXXz6oB7Kq2X0H2ztUunclnEplQ9AF0CXRNexiv+APtjBMHrW3ym32CwXRGmuWwPDJ8QUI8kuIouRFXIgntlqt22kz1cB+xpN3WMTyMUsvjvHDWy5RBfJD1zTQliFoR2Bw+bAT6odLFTFV/KeMX31gIQVDTWe/d/njbDixqOO/COYOgHLGRLF0vEvsyulB0Jrge+XrBgj4s0hJpOh9i32d/I58KQSvF3ed4AbdTsPFtHh+MdrnahGa0vtpjQgl2v7eV2EKpTBsk5xrR8Fmq5PkZAGWkZKt51HTgjkMSUnb8bMY9h4rohr4RsMlxMWVu8uyG/vetKqKw9gNmh5C02tkKHAP+9GYxCGUj1Lao311N1nXYEsA7njPaTzy4GeNMUFZIW05Kj23gIQJkaMnuVUvLfDSodFsCOrn8mV2yw59Roew01ynPSpyrbKb0bj7T9FygCJ3OlTt/HBbgfpMlzn1TTQtbpVaERsmgd3ysNVM2L+1g6yZ0tIl0rC1Ij+Ls/f0Elj9cM8Y8ddtHmZbMcr2xmp3N
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(55016003)(26005)(186003)(6506007)(71200400001)(64756008)(66446008)(66476007)(66946007)(76116006)(66556008)(4326008)(316002)(52536014)(8676002)(8936002)(41300700001)(5660300002)(7696005)(9686003)(2906002)(478600001)(54906003)(110136005)(38100700002)(122000001)(33656002)(86362001)(558084003)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUw0OXhIczFQOUJhVjlyNmJGQnlQZVhQOGxZMkRPdkxhbWoxWUVESENTZmMz?=
 =?utf-8?B?K3hIcUplNGhxMmZVTEFGNGhNc0hDNlJLQ3RWK1g4M3o2WG5SYTBWRFhkWVFP?=
 =?utf-8?B?aDFtdVorNTdvNFVnUktQR3Awd1NnR040TnZ0RlhBNjFEdEZiQUpjaWpJZUJQ?=
 =?utf-8?B?ZDlYT0RWdTRpOXVUNERJZ0ZQZWs5MTMvbnFNam54em9WRTAvSGcxUVYyZCtw?=
 =?utf-8?B?MElCVTVmLzRJUkdRNHJHaS95bHVUL2w1amFwb2ZHV0dXVGk2ODl2eUdRam5a?=
 =?utf-8?B?L3dFWTJqTjNqZUxpNEM1L3laVXp5bkxMMTdyNkZjZnN2SGFyZTVPZlBNM05a?=
 =?utf-8?B?VjVqYzhSU3ZaWG52MEd0Y3NWODFySHo5TVJQcnJ4SW5NU3NYK2pvUElUdWtC?=
 =?utf-8?B?OGtPSWFsRGJNaEI2RXpWVkk1MEowUkpDL2VkT1RmUUJoZ3RuRzcyejdSc2FO?=
 =?utf-8?B?cDVFVHdUWHVrQjBBcCtJUW5NNktNV0NrM3l2QkRwY3lDWHBac0dZMDBpWk0r?=
 =?utf-8?B?RW90MzVIM3l0UDM1cVIvU1E5ekhXaGFFRWE3bEh6ZkFmZkg1aSsrZ0tpdHlq?=
 =?utf-8?B?UlZ0ZTlzdEpIMFVjcjhiVElUWUpPcnNSc1BYdFNheC9YQzBDRmk2ZWMxbXZT?=
 =?utf-8?B?WStjdXc2c2Z3RThweDdEZDdBdFZsRUJzMkpKVGNWaFBqM01qV2cvUWdvTTVp?=
 =?utf-8?B?akt0Y1VOckpSR3dmbHFHM3FiVktwUEdwS2FJUnUzUDg0VlFIc21QZmlyZ3Fz?=
 =?utf-8?B?cnBBL3EwMGwrUGVkU1NFYjdpNzFweHhlY1VUU1FCdFM3VmRuRWV2WFJrUHV0?=
 =?utf-8?B?Z2pBL1BXaGNKelMyVmlJTU9Jc0NrK01LQmRYc1NTRDRlVnFxT3hNcy84VWlw?=
 =?utf-8?B?dllkdHFBVzMvMTZSc3VRWkpEV1FRZTdWWDdoSGtMcUpNZ01TUlczZzB3ZkVS?=
 =?utf-8?B?Nkdtc1d6THprWXlEQmJ5VjR2cTRXZUt2c2phenBRNWxhUHhabUFFdnB6OFpH?=
 =?utf-8?B?SWhlZWl4ek1vSUFYakFabU1GNGJIWFhCaU01bi9hNUZqN0d3SkwrRkVUU3dz?=
 =?utf-8?B?bk5wRkxLV0ZrWTYxajl6dyt5bkoyTWVDcHFwNkZ6RmxrVkQyS25SL016T1Y4?=
 =?utf-8?B?bGZZK0FHajRDWmRLOVIvWFZmeFRyR3FOSC9DclRnS3dOZGV5MXpqRnRxN0Ra?=
 =?utf-8?B?TVlXbUtPTUFpWWEzUUJ0TGQvdXBxclpXaVF2ODQ1QUdnZEVYY0k5UmJwS1BK?=
 =?utf-8?B?ZUoweUhyNVZ6YUpCVmY1YWJuck9DeGt6SCs1WG5xRzV6Q1RNTm5IZ1FtVVVW?=
 =?utf-8?B?M1d0b2VESFBtY2FlbGFuQW1kczZoRnhyR01GODZFbmZUd051cTkvZU5EcVRR?=
 =?utf-8?B?TkRPQ0VoZUNPZUZPZC9pMUo0Y2luQ01LaC8wVTZOclYzYzgyNWRBYXd0eElq?=
 =?utf-8?B?QkgyU0h2WUJVRXBWWmZSVnRBbVd2T1VuYUpkSW5jZmtpa1dQcFQ3T0lJRFU1?=
 =?utf-8?B?ZFczVWZsT2licndRRk5jNVJwNU4xSkFZTHBJTGk4RFlnQkIzZisvSmpTWWZQ?=
 =?utf-8?B?ZEhPOWJtN1lRMWdPTWluM0cwdVdrSnJZK2graTROYVVGZmpGYUVGVndDRTg5?=
 =?utf-8?B?YWZFNnl6SWlIWm8rY1NUSWMwOGx3QUhsUkJMdzlNOWNPNjJ1SUVKVDVMcmE4?=
 =?utf-8?B?WDZwNkpxRktvV0FZVGJlWjZzRFA0dFBWUUhObFhlVDhMUHRZc0VHb1ovSTBF?=
 =?utf-8?B?T0ZQNG50MHR6RFlvckJZRHdWcE8xTlprSGJWYXpzVE5FYXdWR2RVemtObW5x?=
 =?utf-8?B?dEJ5b2V5WFNWczRBQnJGSmdGcFlFYVc5RmhUWXhBdTJCMENGbHhtRmtlSzU1?=
 =?utf-8?B?SDBvU3ZBbC8rb3l2M2F2RC9Ia0xzV3Y3OUdqM25mbENBY205ZmEyNlZKNWcx?=
 =?utf-8?B?RzF0UWd5VG53RWR2dzNibm11clljcERpL3RhL2VvcVppNVZ3TGVNMXlXaVNC?=
 =?utf-8?B?V1pNWWxaYzd1QlBjeS9PV0liYWp0dmV0ZVc4NWZSYkl2cC9DMVl6aVpidlI3?=
 =?utf-8?B?bCtQN05FVWdtL1p2OFFhenRTYjZ0ZzhnUnp0V2prZWQxRTZWb1ExdUkraS9D?=
 =?utf-8?Q?Fyxc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e579da7-345e-49d2-4ff6-08db8855f2c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 12:44:52.9737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGOO2IkyC8zkF2/eNtqfrqmZc2K/vusuUxRBh5ZMihaRnjrzgoy6ehcg7vuTnHeAFmJJBGnWltvdsFc9vXOY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5105
Subject: [virtio-comment] RE: PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics

DQoNCj4gRnJvbTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgSnVseSAxOSwgMjAyMyAzOjA3IEFNDQo+IA0KPiBIaSBTdGVmYW4gJiBQYXJh
dg0KPiANCj4gUGluZyENCj4NCg0KVGhpcyB0YXNrIGlzIG5vdCBpbiB0aGUgdG9wIGl0ZW1zIGZv
ciAxLjQgZm9yIHZpcnRpbywgc28gaGFkIHNsb3cgcHJvZ3Jlc3MuDQpJIHdpbGwgc3BlbmQgc29t
ZSB0aW1lIHRoaXMgbW9udGguDQo=

