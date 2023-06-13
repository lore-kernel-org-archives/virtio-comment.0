Return-Path: <virtio-comment-return-6325-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F11DC77B7A
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 11:33:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5546042566
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 11:33:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3497298657D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 11:33:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1EAD09842EA; Tue, 13 Jun 2023 11:33:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 095E398653E;
	Tue, 13 Jun 2023 11:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an/dLnv5q6xq+H0mVvymDQhvXnQZ5cpnLp/5fK/XG/vJYvA94x8rcTrkagLjoEnbnLFWHOPiXUKcYNZHKzjMPsQh1AAt2XUO4JSEUBlxm9Bl6c6bMUPZYUNvZFAlOjyHTbpHPH1GvnXT5wbVZW3aWk9DXgY5FFBrkqX1YiWxAyjMVyavl5wLPZ8WTpxYOD4pFOz1Yav5Ejey6Q9K9ENs/bft8JO/+lwnxxIcOr3NA2ATBXBcKDI53MD5JaGW7f+e7seau+npHi3FxruQYc8wRVthQ1e3OUNdKQVyALfxAL+1J20J7ERbMkS+siMnda5evbMf6ZVPusn/8IvRGuJkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVcQlbf5MhbaASsjZBUgMXmJ0va2DyHXTa33aMTSOj4=;
 b=PVIfTjJQ8wOH3RM/hzTUZ/epzyo2qJ8m/EKi3dUbzb9E3+8aflbaoYuqwpOY9s+lo0DQomllR6lj/lCDKpQYeR5TztuXdtt/QHOVQqynxkXbDb/eArIf+TSxnuaGkrsIHWt93Yyzk+9u9vnpnClEA6O041AQB2SO/wfoLORBR3HbSCQEddbZGsB/isSDBKDMf0txnZ0EzqeZKh44ATCs89BF7qeAUsqyQzsplJjvHD/SQo4Mpy2ka6oRv7NgekxCreOE9twm/000c4a89t989tKupwh+4RLhdmWEv00BLqJoUJRVYFo12cKzTaO6VsUuFUPfVXSnphVvcg77lcT6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Thread-Topic: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements
Thread-Index:
 AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6923NWAgAABgBCAABCDgIAGxrQAgACeYKCACPiXgIAALZrggAEGcgCAACs+kA==
Date: Tue, 13 Jun 2023 11:33:01 +0000
Message-ID:
 <PH0PR12MB54819F053CA9667F8147371EDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
 <20230606120830.GA28580@h68b04307.sqa.eu95>
 <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
 <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613045211-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230613045211-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB6118:EE_
x-ms-office365-filtering-correlation-id: 4d2cb3a7-4fc4-40eb-04da-08db6c01f21d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7JHAPqBpLBs+7rikUXdh1bewlLpGfL8HkZkTNZvtHSrmQYd7xk2ygPNUxXIPaVwm3NEiRWImWAo1rL3SGzwBkPwCkpqUSBjV5M1ldcTuCqHNrZC6ZOfisFgJX+YaOmaDWKPbEepeR7ZyHr9DEiHv1wcyQYvKfCNHtLHIWS+NhGKW1nZ/HO0mQMFuH4xp0NxoG76RxRQ19wxPT36k3BxRYJuOUkdtkLPBJHPPLa8L8mbqqjvq25CMuvz6OF2yW2042OwlhN1gwQDBsBPn4F5I+jKCtUAdFeelwJoz1Rpr8nZ971lktO9t8G5n026QKwVWUiijdxRAAkg95zMFNBIpB+nsbCUTmCM23DBmpcrhWRcwMhrpp3JaJseKd+ZPUeD6/Wm6E0BnsXtl8M7hr8GolEKlFRbmNWLYqnDlen5OxESFVlMVTHU9Wm+LTQ1apxgeRCAdNAG/4OdhYuXmgoouGsTGNrGsqTcNwhl9wZIz7YZghYoEp4RH+cgyfw+EQtHO9KkkUPsn4MwQk3ZG8br8C4Vzl6xHpXP9YXsZ5RRUf4bBbuicumheS2Ri7Ein3GiqqSD8L3SyESxQWpmFuRVnIHqqHS2fB51ry5UelZPwVfDd09bk3dZyJQfenz0phrke
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(7696005)(9686003)(38100700002)(86362001)(38070700005)(122000001)(33656002)(6506007)(55016003)(186003)(4744005)(66446008)(2906002)(5660300002)(54906003)(52536014)(8676002)(316002)(8936002)(41300700001)(66946007)(6916009)(66556008)(4326008)(76116006)(66476007)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?i6MquSJSVm3STHxbL9kJqPtQkwaFpLiMOhQIKGXD0jpZRj1ka7PEsiT7Iasi?=
 =?us-ascii?Q?jTQIwTdV00vIk58gzIGIvazKN7P2KSdXiMXbWPQqYZaJNfy0hkpSOfYEdcm8?=
 =?us-ascii?Q?nJlGo1bj1mhlewep8fORc7unbqgfv9hU89ivcKkXpwIw5j9BsEkVCyk/+tm6?=
 =?us-ascii?Q?58/pMzxMTJ9NRd3FcjPTF5Ja7MR21P7qyI39GxAlNmLPws4BW51oodyURNOy?=
 =?us-ascii?Q?hsAslndpQDoz3gF+Lku29CpACDqOnMosfve7qInPs+llVXSL30G1UN4tJwlA?=
 =?us-ascii?Q?4H+jZ9ANS4zzyCYtP/dMhsqBmMeh347HNZCKbZq1HR/HHJdq3lL68+I8h1Pi?=
 =?us-ascii?Q?xeIw/p3BPyH4HvLZDa7WThd/YN3OgCXqfS1NilMyUP9MoZJvNsdV2CdNel/D?=
 =?us-ascii?Q?YsoDlQNODmBDQ2ZjnXJJB/E7OTv5tG3O6g1SEshWBPatN3iC5GApBuEyWCoy?=
 =?us-ascii?Q?MdbieSwrOwSVvWeqQfkXW171CD7nzEuFbEFqkm4hlTPojo7lIasxzOEEI6vu?=
 =?us-ascii?Q?mvLjY6kg1JuW2zkS5X5//bZ7XrUHcGPy41dAQQ80/mLkewqyPF3hPsSc7qKw?=
 =?us-ascii?Q?lOkIP7bJfB5qpoygGbDYzeceSuq/qENEvQL7vJ6isOglLkf/snIZq3RQb0TT?=
 =?us-ascii?Q?l1hiTVSvjxx7Z4no0k6/r5klNJKphmmcQsbzwb28ZPnPXYc0nc3V+nnLRyCO?=
 =?us-ascii?Q?ankzpNJHmYmxVJlubzXdOjT1ZDQOsd+C3fwXIpyQ5LEUci5Aq8pNrpYUAD/X?=
 =?us-ascii?Q?7X1XTCzshkw0s4wlVbT3Ogu9zSr52hFdeywdFMxkh+VEiQMT0hfp5EUgYnXO?=
 =?us-ascii?Q?Oq87XrzBLTr/leuEpt1C+yNc9KdB3UwkuthGP08fmyJhg9I/owhZwxt9cNGE?=
 =?us-ascii?Q?7h0A7iEVabo4W0bCE0er6Q9gj4EdwqRYj/K63EKVLNcBI1Yg/6xTXHNfAd3p?=
 =?us-ascii?Q?D/EbdasqsSA43xFbGusQWwhqRcZ4TnocJkOMdjFDOAUkW3hv8zXru8JI0kDP?=
 =?us-ascii?Q?Rj1/UgxrZRPr4HLB4QHM+DkUhJoAU++9jsKQT3JmyGWqbTN1usAFNnaY1gAC?=
 =?us-ascii?Q?AaJJAh8wUSHbr6zSSLChWs1+HqeUEu3zgH1jS6HTu8gaXz88MgeJhe1ZNzK3?=
 =?us-ascii?Q?6QUdhwxu2L9Rdw1ZQZWWQPMOEyB9HzpSwAyKeDQPXjQyqZGj5wZaQg4God49?=
 =?us-ascii?Q?CGUNZYtOdUxfR3IVHT3dqSt9xUtWt/UiWwQcmlog9jU16Wg77LK+jb0USwGl?=
 =?us-ascii?Q?JosVmJkxw6SVOV1rDOsBE7hcOzY1OWGXAlnDrCo26cBJ/Tawy6hfQUznI12E?=
 =?us-ascii?Q?cKyq1Y9YhIwz72sLr6d04zpfLc8sYonj7bua1X6uBHV7Y3BUwa7wiCtDR17Q?=
 =?us-ascii?Q?zwvO4QoS5QbtJQLfNwVWJpB2xCWa6PtN/dz1wbtwlfX30gipXBiCye24eLWE?=
 =?us-ascii?Q?KlIYujGcRsMqVKsKD5e2F4t/FKR+CQYA8gI3hJCGCQTaXLe0+mwtaPHXEoto?=
 =?us-ascii?Q?TvHfE0EZqyQvR2pXCru0N6iZe/gK6itwm5LFaeH1H6OqfXwW8qUGJIVmLTXt?=
 =?us-ascii?Q?o297Efw2gox5XX3SoOL4mozeq9wxqHuFhw192sEakvvQW/RBz6H3YMAPZ3pi?=
 =?us-ascii?Q?SFLj1+KAveTPB62kMzGPrK0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2cb3a7-4fc4-40eb-04da-08db6c01f21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 11:33:01.5789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFnM7bdljOzGSPPi2TLh+0iZolvIV+KmzbjZsFmFtpFfB/GaKpTKucOclAkhN8/VVbZJ8fdF9kBlVriDQ//QlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6118
Subject: [virtio-comment] RE: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 13, 2023 4:58 AM
=20
> > 2. Design and its review to finish by July-30 3. Spec to review by
> > Aug-30
>=20
> Wait a second are we talking about 1.4 or 1.3?  For 1.3 indeed we need to=
 wrap
> development up by end of summer - our charter is to produce releases ever=
y 12
> to 16 months, previous one was July 1st, 2022.
>=20
1.4.

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

