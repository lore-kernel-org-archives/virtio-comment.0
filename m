Return-Path: <virtio-comment-return-5738-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8E4C77B7F
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:54:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 73423F3EA2
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:54:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67D5A986640
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 20:54:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5C3C798653E; Wed,  3 May 2023 20:54:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47C63986636
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 20:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZibjH/uKr+QkZQ1dwUXujY4wNVgf8MAfhCMVlpxe0oYA5ilXj7Nnq8Rz25C0nvrIRoEhpe9YWPJLwNUwl4cTqxjiq8V4h1soiMhxeSB3EVsSfBxSqXP5ywcokR7jLeCmSoiHTVmpMcwzwDtcPVShvzICrFSD7d/KcnZIBRb85xlWgHPFJUgBAEtN8UcYHajMvQ0WneKa3oPBt31PAQXpLc28+Msv8dL5yecPy03OdW7ET+kjdERcNjrT7O1zfIZhvjJ6hORq0vAIL5f1IZnHE2ERi/zOYroPBctiudOGuN/jaoKeeIltKtWkwY2dopGhXnwJn/pklhjoZlRYgrgpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ3VMvozJNQgQ3AFErd+ATjqtcsXY3bARM/SvvaKTtk=;
 b=jtyadVPzAamV0st8BoECcWPBO1qIMFJQnW3IusdYo93BeeBWdhYfOJ62i3N2xZFscpx0JqI1llGKsHPJOJb/IzhV3hvK6LR1ISL0ptTXbJyHbHC2jYVLOJXh0EHF8S+F350CzFhtyIi6SvF3+liJ+LZQHre2UBRDwXcRe1IPl6p4ds4SC3c7XFCFqde5KCJK1lQOTsAk4tfuevsFO8gpi0QDa5oJ4sS1kEFsxEZVmQrdKGm05K2mHDocHHv8ZOjPOmOdnXk3wSUBP15suYHwDc/kbmB75lpU+VPzpnAyVdF7rP0a5eJNiOtDcYEizceQGg784zl13NgDUQ7hrC9l6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Thread-Topic: [PATCH] transport-fabrics: introduce Virtio Over Fabrics
Thread-Index: AQHZfb78GD8bmXf83UqKMJbzAHgMva9JBXww
Date: Wed, 3 May 2023 20:54:07 +0000
Message-ID:
 <PH0PR12MB54812E7B5BDDA7748EBE8BDDDC6C9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230503125807.475394-1-pizhenwei@bytedance.com>
In-Reply-To: <20230503125807.475394-1-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB7334:EE_
x-ms-office365-filtering-correlation-id: 2d801d9e-868b-4190-aed0-08db4c1889cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3FyK6cvnx4QjwSRnGiYIz9shULrPwWap5RrSzGC77p65XpKLv9UeYPsiKSyXeCt6Mw7MaxFSMbHorHZRlJsc7kqwnSpEc6R8p52Bh40gBxHXTeL/91bqSR42WSPudwqVlt7Tl/wpJdplPDaP6fBxCRwPSdyQKBNIs6MIzhD6bgSKlb3uQMuow8T9cNxoSOWif+YXXyO0PLD4v+5pBq2E4bevW1ZNW8u/y0XE4LAQvLX6lVUsfw5QoQJ2XDciazr5srhHSke/w2dI9aj1ph/HY/HgjItJIkLZGBwr9FSzAUAocuEnb2IfbNQ1w9wuvFo926yglKZZDi3V8ycmYNUBd1rxenZolkpQhAQvYvbzd3ZS+KsNtCb/NPKZMy3+1K5xk1Y0sU6w3eCVbwsDnURtoWfcvwxXqzN8mFkgKxtYALgfnsbeuwmnpKhP0SUvJ+Tfqah79An7K+r7QGBN8Fm4DKTNTEpWjy5jBvdYSb6EY6D9d3lzVW35megxkuSFT6qDeHD6tmvyTu5++m2CBnRm4cOpU6wtcirmS/31O+lk6GvU13BlI5pXxnYq3gBPOUU1W/WxpetNscjZTxpc7xXPPbhIe+wZ7t3SjNgm+9PfYeA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(6506007)(54906003)(83380400001)(478600001)(71200400001)(7696005)(55016003)(26005)(66446008)(66946007)(64756008)(316002)(66476007)(110136005)(4326008)(76116006)(9686003)(186003)(66556008)(41300700001)(52536014)(122000001)(8936002)(8676002)(5660300002)(2906002)(38070700005)(38100700002)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aKYVdVjaInYNV9ygxnNJKeiOfAsylOPvvSnrMJ22nq5jWsLRyNNI30OfyB0k?=
 =?us-ascii?Q?VvoGNJhhRmwI9/qGjbqLKAieZXaWRqWdRjgQdI+d8DSSsd71FhBKvYFdnDz7?=
 =?us-ascii?Q?g5nGsHRPlouYjNhSGqNfcZ7uFvQemKvmOUPvzQCzyjKmD3YQlyWNjISO+K/w?=
 =?us-ascii?Q?12sw+Nexvlv1zMZHRHp1o6hi0bc6Mgqk1Hn+OBZCFpllr6C2i8u7mzr8Jql2?=
 =?us-ascii?Q?ty5PPqCGyzvYcTMTVZSj1Ifm/vQ3A5f3GyYIumCjhsr+cKC3+oKgtEy0TdZG?=
 =?us-ascii?Q?eY9tYTS6QdOKl5rFWkSr/DSs3kj2VtHlGTr3ml3f1obzgqkLMYxit7pTJjn/?=
 =?us-ascii?Q?srpVOzZWz2pvHhMfDQUIWipzNxFGYzoFyZtRcHIXtboRhPItKUZCE8kil1fr?=
 =?us-ascii?Q?WEKUvVexxXa1MglqZYJzqMkZbBQ+Rqb+/BdfC+uF2fZKk541JnSLDK351jbc?=
 =?us-ascii?Q?AiizT1ZS0bQBkwo3bMnlY/eVrpiGzcPzspi+I/PO6apfoCcY5sw5cvO9rWCn?=
 =?us-ascii?Q?9OwLVqKvYjNM7Kd/8OjkQ0eqlMkLRLxijdG9gYbUADSBYy74hV4cYoi5l+i5?=
 =?us-ascii?Q?L7dUIkmPWiXwGUbj6yZZKn7KQHAgguv2JPuaR5vEiwf6HkOD8ijr3BM0I5XL?=
 =?us-ascii?Q?NpXNrWcArXJNo3UGxB1XtdtuZNxc9Dj3nu9l82aj7tfE8ZPK5mTxunvxki4L?=
 =?us-ascii?Q?7QAr1twXPkzrASCl+nat+gs/x+pT3XqDxOZtOxo5MLZ+DinUJqDmzgHKb3NN?=
 =?us-ascii?Q?na51N0/HKjHj0AkYZ+7iYSd/vH3OFpWyTx4NCMbhzzwJcNvXBW7kf9JAa+5p?=
 =?us-ascii?Q?MAc7bccONmG1VMIU2kW3PavnaOwt25RBO4/+PX5M4ukwAPvFFPxonfmA0N7p?=
 =?us-ascii?Q?ijWhX5e0SuwQChrGgJpO8Bpw/YXwOJigK2qHBanvQlRelPg5+KCWKuFMNSDJ?=
 =?us-ascii?Q?Z1OSGrpAzcL529MxH7uPB5dqTT8RWDscXPaFuSzfu+YhThGVOJC3VYsjci7t?=
 =?us-ascii?Q?GhkP5BQtfIrqtei3To/FVIXwCsMEVaZofKGqeJuR99uaBKOVPvBqWYLStEcu?=
 =?us-ascii?Q?LEckSjxc9gnoeNBn6BwI8c914d+Qt/2GO3SCr4M2TGDshH11SOmrcGaPjSGQ?=
 =?us-ascii?Q?Z8CdXIxNkEg5LgRjcyXtR4o7/dXmGqomPk5bzQv/4NK/4EOBAj83z5dTTA/c?=
 =?us-ascii?Q?NzontdTqsWh+FrgbVjiwRj4NdSl6enhWQPFxNIijgHBxDtAuoJN1VEMOPnpG?=
 =?us-ascii?Q?b8Ia+B69GGicMg/VANyHdxSguJuzmPbrNQiyGkoXEY4wveoiatZ0T3KTA4pZ?=
 =?us-ascii?Q?79N5x5V1BVefjx8jzkHoLxX9F/oE0oNmrcsQ9X7z3vyP8gO8S/gG9gXN3iAE?=
 =?us-ascii?Q?ldHl7cTX/sLZkcy9eb3twX+Vvglf9j+whvTEJ7G++3arHsVunlYbOFRS2q4i?=
 =?us-ascii?Q?yF7dZRp2p61zXA0/CMod0yV9edlz1QZF7xDYV/IUzxrXQtZ1Vb6VAhpXPbSl?=
 =?us-ascii?Q?bE0C7YoozZCP+IiVLyLhvxBmiKIHFwkVUeB8V1hkguUU7j6lW3Y8BzaRjC0E?=
 =?us-ascii?Q?irUGpCCk2BHTqS61X4M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d801d9e-868b-4190-aed0-08db4c1889cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 20:54:07.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8hJh1l93FdmGiOtjqj/E6M1vCZKiklOY5+zPowBCp5UkuDTMqjqXCRUMV7a4JCxy83R3CWonrwTl58cTajSbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
Subject: [virtio-comment] RE: [PATCH] transport-fabrics: introduce Virtio Over Fabrics



> From: zhenwei pi <pizhenwei@bytedance.com>
> Sent: Wednesday, May 3, 2023 8:58 AM
>=20
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>=20
> Introduce Virtio Over Fabrics transport to support "network defined perip=
heral
> devices". With this transport, Many Virtio based devices transparently wo=
rk
> over fabrics. Note that the balloon device may not make sense. Shared mem=
ory
> regions won't work.
>=20

Before getting in the details of the 1000+ lines of text, lets please have =
some basic protocol set as it is unlikely going to conclude with one patch.

1. Please version your patches as "PATCH v0" -> PATCH v1" etc.
2. add change log of major items changed/removed/added, so reviewer can foc=
us on those at priority while ignoring existing things from vN to vN+1.

3. Split giant 1000+ lines of text to smaller incremental patches.

An example for this would be,
a. overview of fabrics=20
b. Theory of operation
c. descriptor structures
d. device/transport Notifications
e. Queue connect/disconnect commands
f. control path commands (get/set features etc)
g. data transfer commands and responses
h. conformance sections

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

