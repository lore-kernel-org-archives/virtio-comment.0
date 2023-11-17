Return-Path: <virtio-comment-return-8417-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96747C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:14:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C98F1863EA
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:14:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B16E2986E22
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:14:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 96123986E18; Fri, 17 Nov 2023 09:14:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84FDA986E19
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SglvSuXn6DmeuOmXwtUOtXrrSLGIgbR4+beCenZNMk6IG3SPAkq+jw9BIU7/1WFQj8smfFqb8i0rleP20Ut79FTq81U/Ct9EnDQn4C79d1K/hf0vBcdfJlaDzswUqtPNUGzggVG9LD7LR7tfbO48sqFH5t/aJIV/CQodGYciesz4FOzHEORZfSCcOyn0ubmMRxiEITOFo9sqrfzDm+1JsjClJ31aJMHLDzE9zljWdccX28uYQOroDG5NXV+4pkUsL3ENwpQAj1wi6po6a+Rx6l0GI5RKoESdyhTwqyVHjXhNU3PF7MxVvJBcKzCm1oayLwOxKYxz/UoxTkiJ/yCNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4J9S1A6zhFCl1OUKF7lV+AywVFB4q8xooV4pLNXrLQ=;
 b=HFZUi2J2Mpgt/hJQoJ8glpkpGiiD1/kEq0CK9cZ+r7hDE59Zt6NUMhgMojK9+wNL6v9YquO9juhS7Jh7GioWkdVVkOAPSy93oYocyb/RVh/9+633o3mHqecr4HJjlCBF+mM+av9NSg+Q3YRi1ExMPbzsOWzHUN2autfmYh0xIvdmAHhxVS7hsxTOUv6DSyIA4V9ScSiyoO/14Y4yjCH8N+QVN73ZBTVy4Qz5gP99GgGWAuiDknu5zDwSEPwd8vpmcZnZZjrEWha6UZqQYoMRFIiE3rJ2SfPYp/eYVejy/n4XESGvPwAMGFuZ7MuO87B1u1TJUqzjXrQQPelv4ag1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4ag
Date: Fri, 17 Nov 2023 09:14:21 +0000
Message-ID:
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117031251-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4231:EE_
x-ms-office365-filtering-correlation-id: c717983f-5bd3-4e1c-fede-08dbe74d95b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Xe3PRtDgLZSVCKFEC+bPJMoT63rHF5juElne5Yj9clQUByyPN12IWlSAjRQB5P4ChpC8QD3m6DuK38PaS+f/hp2setK/ueiZaVKBuj+tAQME85SivuEWXRZDsXrhTzS0QmZRFRe7qmihPiI5BEtLI+7/p0ZwoZn+JHkhslCsu6uXihcBrOWyol6a4KD61FoNGPlR1zFv4IvMucDh/mM3fPPe7IL2fas+iJSqDFUKx4AXcN3C9RghovDA44dKH4ERU1vxlXGUIO9pBp4Ij6zBBV+1uMZTCCUzX0XONX9fJxiMG+rwRmGwb18QtUQULJlh1DlRUDHZh/j5SIaMmZTx/gjwscPfR/7Agwh1TMNA4B70L9IRcN1bYXAQtgwBg2GtQXDAW0oIrb4jGEofLBMiOuuheRGW4XONxj9/s/WAROcWB+Hv8saTh4PSH3WbICWu9Rxo8qp0zAnJSOWpLSgUGeUOLotQgkWCROYXD8hpzeSPUDNUZoF57zhnB+4AAA+3PV2qb6LRXIJPrvHpJNYkbfjPxMuMQmvozZ0JM5iOrFtzWdXsrZbeiS1ZBQoQnoNPZr1d/l9IMiKfyOZOND+7RT7XQpkscjR3xXQH3jczrSMjdJbFsvtA53trxoKcqVhZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(41300700001)(55016003)(9686003)(478600001)(86362001)(122000001)(71200400001)(7696005)(55236004)(6506007)(38100700002)(66556008)(66476007)(66446008)(54906003)(64756008)(6916009)(76116006)(66946007)(316002)(38070700009)(52536014)(4326008)(2906002)(5660300002)(8676002)(8936002)(26005)(33656002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0inKlAKreEklDTQLbonm9SL4ivQ+HGRKYgsngFnRkTDwSdma1A18L4ihulWy?=
 =?us-ascii?Q?bJ7KnnRpWN8M9Z9PD5hDNfz1LXOMV8ALutWyLMfpTyEISLGR99Xb9uYDVUEv?=
 =?us-ascii?Q?oSY/nk2hc8DSfMymX6zX2k9N9QmyF2DcaAoIZAdGGnR6Jnxu9qgUe4mWyL1U?=
 =?us-ascii?Q?RbLNZcqSFo6NXTsy+jmcD+Hat0/sSVq+SA+eAAazS9BetLr5eTv+hrcd6q65?=
 =?us-ascii?Q?6edjUYzcqBAlOJW+fGQtP89kJlvkyMcoOltdlZR3/UxeyToTIvauUZhb1WBn?=
 =?us-ascii?Q?zsg1DeKfH5CfXbpznr1Kmo/2KIdCM+7AM6W1KHCtxaAF5kDqCQ8I7Zi4OMKa?=
 =?us-ascii?Q?uFCcT6xyfNI+4WDdEXK19UV8M+2kJNG6bt5NGYADTXHXsxJ0oug6GOFxek/1?=
 =?us-ascii?Q?KDW1AukFo9D/hATdJokWPvrYabTi3uNZapaD0n2qnWPoqcwQgH5ifGxl51Jq?=
 =?us-ascii?Q?tALyZOLjBhp+RfNK/1sv6Somb+HAYfYvD3oLNZ2KDrel14uNJQ3NhEMUGUPN?=
 =?us-ascii?Q?FU6j03ci4OyhpSxZ4oNdNNNEPGnfdL4V5W550t81cmO0EXiAp8sh1+pEV4f2?=
 =?us-ascii?Q?I3uNCVRvbeBMPmHXDrhpAxl1nbp8HwAJdmx+Q6aTGYTHQBoHkiPcX9YTQWCR?=
 =?us-ascii?Q?KSvVMJcMOVqAVGn4LiOgK5tKZCzmWjjxK9LNgQtxjFkLPL/hISHtbs0Zf874?=
 =?us-ascii?Q?EGsTaHEh4MYPM2SRlmqnFEJGEQSmgEzn9O80Xq+jMWuhapGAcpdYzmo1s+kJ?=
 =?us-ascii?Q?5ZOYhoRVYfSljZoiz8wWSNiTbHZDNGJz59DQZfjJ5BFQMMg1Q6AVkwX1HVEk?=
 =?us-ascii?Q?VJXr7oKzcBtWbuwXMyGCnU/SQcuHcZCzWwwbqUozSUN7dbwtABqFTlE2lOmt?=
 =?us-ascii?Q?xeZY50MOv9b5KXS/my5v81oMNjwEvpAcqUbN9EeLzBZ6qv9jDIZJgut03k50?=
 =?us-ascii?Q?JYtFck7N+rlFZZFQ66w1u4aAacFifROzAs4e7xbYzaqVneAzhAalue2Rd2OZ?=
 =?us-ascii?Q?JY8I8SjgyELRvl8T7k6sTK1MKviuJTQWUie9fp+vZNEaGYGGFPZLEU48MOTf?=
 =?us-ascii?Q?LC+84MiZRqZK+gSX6JlPs253vGkp3BGfbEEgKa1qTj5pKx2Hl/+ZE63aXRwi?=
 =?us-ascii?Q?Hyc37CB88XSxKOLkth5Em97MrXbiXtu9d5TREKVIV8My/vLVyYZR/So3eD2o?=
 =?us-ascii?Q?nGmlfDHPO8njpWvH2/qpbygOaEj2JjLG9PoZguR0Ya+utYFJBU7SsT8xXEcn?=
 =?us-ascii?Q?l7EXlZHrhRFM8AaVHNdGg9BQtb66+javHFwQcpKx0filvS6PkZXsm4n8h05q?=
 =?us-ascii?Q?bbbNJWIRk14k/sV0Tx5Mn+KQPIGl9qz2n7MgnL+WIvoIbW1iXWQQv2zczZa+?=
 =?us-ascii?Q?8rxveYM8FlPW7aq/4XlvV3v+0r99QiKoXJnR46R6DmIoBQNcVx8Tio08d0Wv?=
 =?us-ascii?Q?ehpL03URjLXqxKMmC3Rf7wkwTE0Re+3ixgwYnyKREJo9FTfH2zAUJNMuyxPg?=
 =?us-ascii?Q?wBb1A+qHCRP3J2xhNDU9q8MVM75ixe4Iu5WzV8+QT/gMDvgHwkkmIxunxHmS?=
 =?us-ascii?Q?RaKs3hcXa1g7bzY+xGo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c717983f-5bd3-4e1c-fede-08dbe74d95b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:14:21.3225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nT+fkM5gdeArAAX/VAdKzcT+rCGGlEhhGkn14PpaG9uXq3W6cTjGvr+nY3XV6+eARV4PynHPkrXFclX9kTCVkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 2:16 PM
> In any case you can safely assume that many users will have migration tha=
t takes
> seconds and minutes.

Strange, but ok. I don't see any problem with current method.
8MB is used for very large VM of 1TB takes minutes. Should be fine.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

