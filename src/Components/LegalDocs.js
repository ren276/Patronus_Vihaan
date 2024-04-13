import React, { useEffect } from "react";
import { Link } from "react-router-dom";
import "../Styles/LegalDocs.css";

function LegalDocs() {
  useEffect(() => {
    window.scrollTo({ top: 0, behavior: "smooth" });
  });

  return (
    <div className="legal-section-title">
      <h1 className="legal-siteTitle">
        <Link to="/">
          Health <span className="legal-siteSign">+</span>
        </Link>
      </h1>

      <div className="legal-text-content">
        <p className="legal-title">General Info</p>
        <p className="legal-description">
        Welcome to Patronus, where advanced AI technology meets skin care, offering precise diagnosis, multilingual support, seamless consultation, and licensing opportunities for revolutionary skin care detection
        </p>

        <p className="legal-title">Privacy Policy</p>
        <p className="legal-description">
        Our Privacy Policy ensures your data's confidentiality, outlining our commitment to protecting your information across our platform.
        </p>

        <p className="legal-title">Terms of Service</p>
        <p className="legal-description">
        Our Terms of Service outline the guidelines and agreements governing your use of our platform, ensuring a transparent and fair experience for all users.
        </p>

        <p className="legal-title">Consultations</p>
        <p className="legal-description">
        Our Consultation Policy ensures a seamless and professional experience, guiding users through expert advice and support from healthcare professionals
        </p>

        <p className="legal-title">How it Works</p>
        <p className="legal-description">
        Discover how it works: Upload images, let AI analyze, connect with professionals, receive recommendations, and monitor progress for a seamless skin care journey.
        </p>
      </div>

      <div className="legal-footer">
        <p>© 2024-2025 Patronus. All rights reserved.</p>
      </div>
    </div>
  );
}

export default LegalDocs;
